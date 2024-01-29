CREATE TABLE `notification_emails`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `recipient` INT NOT NULL,
    `subject` VARCHAR(250),
    `body` VARCHAR(250)
);

DELIMITER %%

CREATE TRIGGER tr_notification_email
AFTER INSERT ON `logs`
FOR EACH ROW 
BEGIN

		INSERT INTO `notification_emails`(`recipient`, `subject`, `body`)
        VALUES (
				NEW.`account_id`, 
                CONCAT_WS('Balance change for account:', NEW.`account_id`), 
				CONCAT_WS('On', NOW(), 'your balance was changed from', NEW.`old_sum`, 'to', NEW.`new_sum`, '.'));
    
END%%