DELIMITER %%

CREATE PROCEDURE udp_special_offer(agent_name VARCHAR(50))
BEGIN

	UPDATE `agents` AS a
    JOIN `property_offers` AS po ON a.`id` = po.`agent_id`
    SET po.`price` = po.`price` * 0.9
    WHERE a.`first_name` = agent_name;

END%%