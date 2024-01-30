SELECT 
	LEFT(`address`, 6) AS 'agent_name',
    CHAR_LENGTH(`address`) * 5430 AS 'price'
FROM `properties`
WHERE `id` NOT IN (
		SELECT `property_id` FROM `property_offers`
)
ORDER BY `agent_name` DESC, `price` DESC