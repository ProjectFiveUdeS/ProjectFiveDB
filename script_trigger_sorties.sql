
---type de sorties: 1 = temporaire / 2 = permanente 


CREATE OR REPLACE FUNCTION verifSortie ()
    RETURNS TRIGGER
    SET SCHEMA 'public'
    LANGUAGE plpgsql
    AS $$
	DECLARE examen_new varchar(50) := (select id_cours_examen from assis_a where new.cip = assis_a.cip);
    BEGIN 
	IF (new.heure_debut is NULL )
	THEN
		return NEW;
	END IF;
	IF (((select examen.tiers_temps from assis_a,examen where (new.cip = assis_a.cip) 
		and (assis_a.id_cours_examen = examen.id_cours_examen))<= new.heure_debut)or (select examen.tiers_temps from assis_a,examen where (new.cip = assis_a.cip) 
		and (assis_a.id_cours_examen = examen.id_cours_examen)) is null)
	THEN
			IF ((select id_sortie from sorties,assis_a  where(id_cours_examen = examen_new and assis_a.cip = sorties.cip and type_sortie = 2 )order by id_sortie DESC LIMIT 1) is NULL)
			THEN
				IF (((select heure_fin from sorties,assis_a where (new.heure_debut > heure_debut and examen_new = assis_a.id_cours_examen and assis_a.cip = sorties.cip) order by heure_fin DESC LIMIT 1) is NULL)
				and ((select id_sortie from sorties,assis_a where id_cours_examen = examen_new and assis_a.cip = sorties.cip order by id_sortie DESC LIMIT 1) is not NULL))		
				THEN
				raise notice 'cas 1';
				perform ajoutfile(new.cip,new.type_sortie);
					RETURN NULL;
				ELSE  
				raise notice 'cas 2';
					RETURN NEW;
				END IF;
			END IF;
			IF (new.type_sortie = 2 and (select type_sortie from sorties,assis_a where type_sortie = 2 and (heure_debut is not null) and id_cours_examen = examen_new and assis_a.cip = sorties.cip  group by 1 )is not NULL)
			THEN
				raise notice 'cas 3';
				RETURN NEW;
			ELSE			
			raise notice 'cas 4';
				--perform ajoutfile(new.cip,new.type_sortie);
				RETURN NULL;				
			END IF;
	ELSE
	raise notice 'cas 5';
		RETURN NULL;
	END IF;
    END;
    $$;
	

CREATE OR REPLACE FUNCTION ajoutfile(cip_ajout varchar(8),type_ajout INT)
RETURNS void
LANGUAGE plpgsql

AS $$
DECLARE examen_new varchar(50) := (select id_cours_examen from assis_a where cip_ajout = assis_a.cip);
BEGIN
raise notice 'entre ajout_file';
	IF ((select id_sortie from sorties,assis_a where(id_cours_examen = examen_new and assis_a.cip = sorties.cip and heure_fin is not null and type_sortie = 2 )order by id_sortie DESC LIMIT 1) is NULL)
	THEN
	raise notice 'entre ajout_file dans if';
		insert into sorties values((select MAX(id_sortie) from sorties) +1 ,NULL,NULL,cip_ajout,type_ajout);	

	END IF;
END;
$$;


CREATE OR REPLACE FUNCTION retourEleve(cip_retour varchar(8))
RETURNS void
LANGUAGE plpgsql

AS $$
DECLARE limite time := ((select heure_debut from sorties where cip_retour = cip ) + '00:05:00');
DECLARE id_retour INT := (select id_sortie from sorties where cip_retour = cip);
DECLARE examen_new varchar(50) := (select id_cours_examen from assis_a where cip_retour = assis_a.cip);
DECLARE id_next INT := (select MIN(id_sortie) from sorties,assis_a where id_cours_examen = examen_new and assis_a.cip = sorties.cip and heure_debut IS NULL);
    BEGIN
	raise notice 'entre retour_eleve';
	update sorties 
	set heure_fin = current_time
	where cip_retour = cip;

	
	IF ( limite < (select heure_fin from sorties where cip_retour = cip ) )
	THEN
		raise notice 'Sortie depasse la limite de 5min';
	END IF;

	IF (id_next is not null)
	THEN 
		raise notice 'test id heure debut %',(id_next);
		update sorties 
		set heure_debut = current_time
		where (id_next) = id_sortie;
	END IF;
END;
$$;

drop trigger IF exists validation_reservation on sorties; 
CREATE TRIGGER validation_reservation
    BEFORE INSERT
    ON public.sorties
    FOR EACH ROW
    EXECUTE PROCEDURE public.verifsortie();

