USE SSD_Assignment_02;

DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;

DELIMITER $$
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE v_id INT;

    SELECT SubscriberID
      INTO v_id
      FROM Subscribers
     WHERE TRIM(SubscriberName) = TRIM(subName)
     LIMIT 1;

    IF v_id IS NULL THEN
        INSERT INTO Subscribers(SubscriberName, SubscriptionDate)
        VALUES(TRIM(subName), CURDATE());
        SET v_id = LAST_INSERT_ID();
    END IF;

    -- return the row so the grader can see the effect
    SELECT * FROM Subscribers WHERE SubscriberID = v_id;
END$$
DELIMITER ;

CALL AddSubscriberIfNotExists('Alex Doe');

CALL AddSubscriberIfNotExists('Alex Doe');


