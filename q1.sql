USE SSD_Assignment_02;

DROP PROCEDURE IF EXISTS ListAllSubscribers;

DELIMITER $$
CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_name VARCHAR(100);

    DECLARE cur CURSOR FOR
        SELECT SubscriberName FROM Subscribers ORDER BY SubscriberName;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_name;
        IF done = 1 THEN LEAVE read_loop; END IF;
        SELECT v_name AS Subscriber;
    END LOOP;
    CLOSE cur;
END$$
DELIMITER ;

CALL ListAllSubscribers();
