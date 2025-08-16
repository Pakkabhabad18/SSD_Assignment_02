USE SSD_Assignment_02;

DROP PROCEDURE IF EXISTS SendWatchTimeReport;

DELIMITER $$
CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_sid INT;

    DECLARE cur CURSOR FOR
        SELECT DISTINCT SubscriberID FROM WatchHistory ORDER BY SubscriberID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_sid;
        IF done = 1 THEN LEAVE read_loop; END IF;
        CALL GetWatchHistoryBySubscriber(v_sid);
    END LOOP;
    CLOSE cur;
END$$
DELIMITER ;

CALL SendWatchTimeReport();

