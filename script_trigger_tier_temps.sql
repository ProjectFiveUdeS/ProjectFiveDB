 CREATE OR REPLACE FUNCTION fonction_tierTemps() 
    RETURNS TRIGGER  
    SET SCHEMA 'public'
    LANGUAGE plpgsql 
    AS $$ 
	DECLARE
		fin_service TIME;
    BEGIN 

    IF (old IS NOT NULL AND old.debut = new.debut AND old.fin = new.fin) THEN 
        ---au cas d'un update  
        raise notice 'pas changement'; 
        ---pas de changement dans le temps, alors pas besoin de refaire tout le calcules 
        return new;  
    END IF; 
     
    raise notice 'changement'; 
    UPDATE examen 
    SET tiers_temps = CAST(to_timestamp(((((date_part('hour', new.fin) - date_part('hour', new.debut)) * 3600) + 
                 (date_part('minutes', new.fin) - date_part('minutes', new.debut)) * 60) / 3)  
                 + date_part('hours', new.debut)*3600 + date_part('minutes', new.debut) * 60)AS time) 
    WHERE new.id_cours_examen = id_cours_examen;  
    
	fin_service := CAST(to_timestamp(((((date_part('hour', new.fin) - date_part('hour', new.debut)) * 3600) + 
                 (date_part('minutes', new.fin) - date_part('minutes', new.debut)) * 60) / 3)  
                 + date_part('hours', new.fin) * 3600 + date_part('minutes', new.fin) * 60)AS time) ;
	
    UPDATE examen
    SET fin_adapte = fin_service 
    WHERE new.id_cours_examen = id_cours_examen;   
	
	UPDATE examen
    SET tiers_temps_adapte = CAST(to_timestamp(((((date_part('hour', fin_service) - date_part('hour', new.debut)) * 3600) + 
                 (date_part('minutes', fin_service) - date_part('minutes', new.debut)) * 60) / 3)
				 + date_part('hour', new.debut) * 3600 + date_part('minutes', new.debut) * 60)   AS time) 
    WHERE new.id_cours_examen = id_cours_examen;   
	
    RETURN new; 
    END; 
    $$; 

--efface le trigger s'il existe 
drop trigger IF exists trigger_tierTemps on examen; 
CREATE TRIGGER trigger_tierTemps 
AFTER INSERT OR UPDATE ON examen 
--le when c'est pour arreter la recursivité  
--en cas d'un update 
FOR EACH ROW WHEN (pg_trigger_depth() = 0) 
EXECUTE PROCEDURE fonction_tierTemps();  
