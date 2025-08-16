USE SSD_Assignment_02;

DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;

DELIMITER $$
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT s.Title AS ShowTitle,
           w.WatchTime
    FROM WatchHistory w
    JOIN Shows s ON s.ShowID = w.ShowID
    WHERE w.SubscriberID = sub_id
    ORDER BY s.Title;
END$$
DELIMITER ;
CALL GetWatchHistoryBySubscriber(1);

