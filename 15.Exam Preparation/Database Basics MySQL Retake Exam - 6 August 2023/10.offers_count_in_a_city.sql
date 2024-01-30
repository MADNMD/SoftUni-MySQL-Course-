DELIMITER %%

CREATE FUNCTION udf_offers_from_city_name (city_name VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN

	DECLARE offers_count INT;
    SET offers_count := (
		SELECT COUNT(*) FROM `property_offers` AS po
        JOIN `properties` AS p ON p.`id` = po.`property_id`
        JOIN `cities` AS c ON c.`id` = p.`city_id`
        WHERE c.`name` = city_name
     );
    RETURN offers_count; 

END%%