CREATE DATABASE TicketBookingPlatform;

Use TicketBookingPlatform;

-- Creating the User Details Table
CREATE TABLE UserDetails (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    MailID VARCHAR(50),
    Password VARCHAR(255)
);

-- Creating the Booking Table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    UserID INT,
    Date DATE,
    FOREIGN KEY (UserID) REFERENCES UserDetails(UserID)
);

-- Creating the Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10,2),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- Creating the Train Routes Table
CREATE TABLE TrainRoutes (
    RouteID INT PRIMARY KEY,
    Origin VARCHAR(50),
    Destination VARCHAR(50),
    Stoppings TEXT,
    StartTime TIME,
    EndTime TIME
);

-- Creating the Train Table
CREATE TABLE Train (
    TrainRegNo INT PRIMARY KEY,
    TrainName VARCHAR(100),
    RouteID INT,
    TotalSeats INT,
    SeatPrice DECIMAL(10,2)
);

-- Creating the Seats Table
CREATE TABLE Seats (
    TrainRegNo INT,
    SeatType VARCHAR(20),
    Price DECIMAL(10,2),
    SeatCount INT,
    PRIMARY KEY (TrainRegNo, SeatType),
    FOREIGN KEY (TrainRegNo) REFERENCES Train(TrainRegNo)
);

-- Creating the Bus Routes Table
CREATE TABLE BusRoutes (
    RouteID INT PRIMARY KEY,
    Origin VARCHAR(50),
    Destination VARCHAR(50),
    Stoppings TEXT,
    StartTime TIME,
    EndTime TIME
);

-- Creating the Bus Table
CREATE TABLE Bus (
    VehicleRegNo VARCHAR(20) PRIMARY KEY,
     TravelsName VARCHAR(100),
    RouteID INT,
    BusType VARCHAR(50),
    TotalSeats INT,
    SeatPrice DECIMAL(10,2)
);

-- Inserting 15 values into UserDetails
INSERT INTO UserDetails (UserID, Name, DOB, Gender, Phone, MailID, Password) VALUES
(1, 'Amit Kumar', '1990-05-21', 'Male', '9876543210', 'amit@gmail.com', 'pass123'),
(2, 'Priya Sharma', '1995-08-10', 'Female', '9876512345', 'priya@gmail.com', 'pass456'),
(3, 'Rahul Verma', '1988-12-12', 'Male', '9812345678', 'rahul@gmail.com', 'pass789'),
(4, 'Sneha Mehta', '1992-03-25', 'Female', '9823456789', 'sneha@gmail.com', 'pass234'),
(5, 'Arjun Singh', '1997-06-17', 'Male', '9876541230', 'arjun@gmail.com', 'pass567'),
(6, 'Neha Gupta', '1994-09-05', 'Female', '9856123478', 'neha@gmail.com', 'pass890'),
(7, 'Vikram Rao', '1989-11-20', 'Male', '9845123678', 'vikram@gmail.com', 'pass345'),
(8, 'Riya Malhotra', '1996-04-30', 'Female', '9834123678', 'riya@gmail.com', 'pass678'),
(9, 'Manoj Tiwari', '1993-07-15', 'Male', '9823451298', 'manoj@gmail.com', 'pass901'),
(10, 'Deepika Kapoor', '1991-02-28', 'Female', '9812345698', 'deepika@gmail.com', 'pass147'),
(11, 'Suresh Yadav', '1998-01-10', 'Male', '9801234567', 'suresh@gmail.com', 'pass258'),
(12, 'Kavita Jain', '1987-12-14', 'Female', '9798765432', 'kavita@gmail.com', 'pass369'),
(13, 'Rohan Nair', '1990-08-23', 'Male', '9787654321', 'rohan@gmail.com', 'pass456'),
(14, 'Ananya Mishra', '1995-10-12', 'Female', '9776543210', 'ananya@gmail.com', 'pass789'),
(15, 'Rajesh Pillai', '1985-06-05', 'Male', '9765432109', 'rajesh@gmail.com', 'pass123');

-- Inserting 15 values into Booking
INSERT INTO Booking (BookingID, UserID, Date) VALUES
(1, 1, '2025-04-05'),
(2, 2, '2025-04-06'),
(3, 3, '2025-04-07'),
(4, 4, '2025-04-08'),
(5, 5, '2025-04-09'),
(6, 6, '2025-04-10'),
(7, 7, '2025-04-11'),
(8, 8, '2025-04-12'),
(9, 9, '2025-04-13'),
(10, 10, '2025-04-14'),
(11, 11, '2025-04-15'),
(12, 12, '2025-04-16'),
(13, 13, '2025-04-17'),
(14, 14, '2025-04-18'),
(15, 15, '2025-04-19');

-- Inserting 15 values into Payment
INSERT INTO Payment (PaymentID, BookingID, PaymentDate, PaymentMethod, Amount) VALUES
(1, 1, '2025-04-05', 'Credit Card', 1500.00),
(2, 2, '2025-04-06', 'UPI', 1200.00),
(3, 3, '2025-04-07', 'Debit Card', 2000.00),
(4, 4, '2025-04-08', 'Net Banking', 1800.00),
(5, 5, '2025-04-09', 'Credit Card', 1400.00),
(6, 6, '2025-04-10', 'UPI', 1300.00),
(7, 7, '2025-04-11', 'Debit Card', 1600.00),
(8, 8, '2025-04-12', 'Net Banking', 1700.00),
(9, 9, '2025-04-13', 'UPI', 1550.00),
(10, 10, '2025-04-14', 'Credit Card', 1650.00),
(11, 11, '2025-04-15', 'UPI', 1750.00),
(12, 12, '2025-04-16', 'Debit Card', 1350.00),
(13, 13, '2025-04-17', 'Net Banking', 1850.00),
(14, 14, '2025-04-18', 'UPI', 1950.00),
(15, 15, '2025-04-19', 'Credit Card', 1450.00);

-- Inserting 15 values into TrainRoutes
INSERT INTO TrainRoutes (RouteID, Origin, Destination, Stoppings, StartTime, EndTime) VALUES
(1, 'Delhi', 'Mumbai', 'Agra, Kota, Vadodara', '06:00', '20:00'),
(2, 'Kolkata', 'Chennai', 'Bhubaneswar, Visakhapatnam', '07:30', '22:00'),
(3, 'Bangalore', 'Hyderabad', 'Anantapur, Kurnool', '05:45', '14:00'),
(4, 'Ahmedabad', 'Pune', 'Surat, Nashik', '08:15', '18:30'),
(5, 'Jaipur', 'Lucknow', 'Agra, Kanpur', '09:00', '19:15'),
(6, 'Chandigarh', 'Delhi', 'Ambala, Panipat', '10:30', '13:00'),
(7, 'Bhopal', 'Nagpur', 'Itarsi, Betul', '11:45', '17:30'),
(8, 'Indore', 'Surat', 'Ujjain, Vadodara', '12:00', '21:00'),
(9, 'Patna', 'Ranchi', 'Gaya, Hazaribagh', '14:00', '19:30'),
(10, 'Guwahati', 'Kolkata', 'Siliguri, Malda', '15:00', '07:00'),
(11, 'Visakhapatnam', 'Hyderabad', 'Rajahmundry, Vijayawada', '16:30', '06:00'),
(12, 'Madurai', 'Bangalore', 'Salem, Hosur', '18:45', '05:15'),
(13, 'Trivandrum', 'Mysore', 'Kochi, Coimbatore', '19:00', '06:30'),
(14, 'Chennai', 'Goa', 'Bangalore, Hubli', '20:30', '10:00'),
(15, 'Mumbai', 'Jaipur', 'Vadodara, Udaipur', '21:00', '11:30');

-- Inserting 15 values into Train
INSERT INTO Train (TrainRegNo, TrainName, RouteID, TotalSeats, SeatPrice) VALUES
(1001, 'Rajdhani Express', 1, 800, 1200.00),
(1002, 'Coromandel Express', 2, 750, 1100.00),
(1003, 'Shalimar Express', 3, 780, 1150.00),
(1004, 'Shatabdi Express', 4, 820, 1300.00),
(1005, 'Lucknow Mail', 5, 700, 1050.00),
(1006, 'Chandigarh Express', 6, 720, 1080.00),
(1007, 'Gondwana Express', 7, 760, 1120.00),
(1008, 'Indore Express', 8, 740, 1090.00),
(1009, 'Patna Jan Shatabdi', 9, 800, 1250.00),
(1010, 'Saraighat Express', 10, 730, 1070.00),
(1011, 'Godavari Express', 11, 780, 1150.00),
(1012, 'Madurai Express', 12, 770, 1130.00),
(1013, 'Mysore Express', 13, 790, 1180.00),
(1014, 'Chennai Vasco Express', 14, 810, 1210.00),
(1015, 'Mumbai Jaipur Express', 15, 830, 1250.00);

-- Inserting 15 values into Seats
INSERT INTO Seats (TrainRegNo, SeatType, Price, SeatCount) VALUES
(1001, '1AC', 2500.00, 20),
(1001, '2AC', 1800.00, 30),
(1001, '3AC', 1400.00, 40),
(1001, 'Sleeper', 800.00, 60),

(1002, 'Chaircar', 900.00, 50),
(1002, 'Sleeper', 750.00, 60),
(1002, 'General', 400.00, 100),

(1003, '1AC', 2400.00, 15),
(1003, '2AC', 1600.00, 25),
(1003, 'Sleeper', 850.00, 50),

(1004, 'General', 500.00, 100),
(1004, '2AC', 1600.00, 35),

(1005, '3AC', 1300.00, 40),
(1006, 'Sleeper', 700.00, 55),
(1007, 'Chaircar', 950.00, 45);


-- Inserting 15 values into BusRoutes
INSERT INTO BusRoutes (RouteID, Origin, Destination, Stoppings, StartTime, EndTime) VALUES
(1, 'Delhi', 'Jaipur', 'Gurgaon, Alwar', '06:00', '12:00'),
(2, 'Mumbai', 'Pune', 'Thane, Lonavala', '07:30', '11:00'),
(3, 'Bangalore', 'Chennai', 'Vellore, Kanchipuram', '05:45', '14:00'),
(4, 'Ahmedabad', 'Surat', 'Vadodara, Bharuch', '08:15', '13:30'),
(5, 'Jaipur', 'Udaipur', 'Ajmer, Bhilwara', '09:00', '15:15'),
(6, 'Chandigarh', 'Manali', 'Bilaspur, Kullu', '10:30', '20:00'),
(7, 'Bhopal', 'Indore', 'Sehore, Dewas', '11:45', '15:30'),
(8, 'Hyderabad', 'Vijayawada', 'Suryapet, Guntur', '12:00', '19:00'),
(9, 'Patna', 'Gaya', 'Jehanabad, Nawada', '14:00', '17:30'),
(10, 'Guwahati', 'Shillong', 'Nongpoh, Byrnihat', '15:00', '18:00'),
(11, 'Visakhapatnam', 'Bhubaneswar', 'Srikakulam, Berhampur', '16:30', '23:00'),
(12, 'Madurai', 'Coimbatore', 'Dindigul, Tiruppur', '18:45', '00:30'),
(13, 'Trivandrum', 'Kochi', 'Kollam, Alappuzha', '19:00', '22:30'),
(14, 'Chennai', 'Goa', 'Bangalore, Hubli', '20:30', '10:00'),
(15, 'Mumbai', 'Ahmedabad', 'Surat, Vadodara', '21:00', '07:30');

-- Inserting 15 values into Bus
INSERT INTO Bus (VehicleRegNo, TravelsName, RouteID, BusType, TotalSeats, SeatPrice) VALUES
('AP13CD7890', 'APSRTC', 11, 'Sleeper', 42, 700.00),
('AS12AB5678', 'ASTC', 10, 'Sitting', 48, 500.00),
('BR11YZ2345', 'Bihar Roadways', 9, 'Sleeper', 45, 750.00),
('GA16T19101', 'Kadamba Transport', 14, 'Sitting', 50, 520.00),
('GJ06GA161U9101', 'Jel Tours', 4, 'Sitting', 48, 530.00),
('HP08ST9101', 'HRTC', 6, 'Sitting', 52, 540.00),
('KA05CD7890', 'KPN Travels', 3, 'Sleeper', 45, 720.00),
('KL15GH6789', 'KSRTC', 13, 'Sleeper', 40, 730.00),
('MH10AB1234', 'VRL Travels', 1, 'Sleeper', 40, 740.00),
('MH17KL3456', 'MSRTC', 5, 'Sleeper', 40, 710.00),
('MP09UV3456', 'Indore Travels', 7, 'Sleeper', 40, 690.00),
('RJ14XY5678', 'Neeta Travels', 2, 'Sitting', 50, 510.00),
('TN14EF2345', 'TNSTC', 8, 'Sitting', 52, 530.00),
('TS10WX6789', 'Orange Travels', 8, 'Sitting', 50, 520.00),
('UP07QR6789', 'UPSRTC', 5, 'Sleeper', 42, 730.00);

-- Display User Details
SELECT * FROM UserDetails;

-- Display Bookings
SELECT * FROM Booking;

-- Display Payments
SELECT * FROM Payment;

-- Display Train Routes
SELECT * FROM TrainRoutes;

-- Display Trains
SELECT * FROM Train;

-- Display Seats
SELECT * FROM Seats;

-- Display Bus Routes
SELECT * FROM BusRoutes;

-- Display Buses
SELECT * FROM Bus;

-- 1. Name of the user with a specific User ID
SELECT Name FROM UserDetails WHERE UserID = 5;

-- 2. Total number of registered users
SELECT COUNT(*) AS TotalUsers FROM UserDetails;

-- 3. Gender of the user with a specific User ID
SELECT Gender FROM UserDetails WHERE UserID = 1;

-- 4. Email address of a specific user
SELECT MailID FROM UserDetails WHERE UserID = 7;

-- 5. List all users with their phone numbers
SELECT UserID, Name, Phone FROM UserDetails;

-- 6. Date of birth of a specific User ID
SELECT DOB FROM UserDetails WHERE UserID = 1;

-- 7. Number of users registered with a specific email domain (e.g., @gmail.com)
SELECT COUNT(*) AS GmailUsers FROM UserDetails WHERE MailID LIKE '%@gmail.com';

-- 8. List the User IDs of all male users
SELECT UserID FROM UserDetails WHERE Gender = 'Male';

-- 9. Phone number of the user named "John Doe"
SELECT Phone FROM UserDetails WHERE Name = 'Neha Gupta';

-- 10. List users born after the year 2000
SELECT UserID, Name, DOB FROM UserDetails WHERE DOB > '1994-01-01';

-- 11. Total number of bookings
SELECT COUNT(*) AS TotalBookings FROM Booking;

-- 12. List all bookings made on a specific date
SELECT * FROM Booking WHERE Date = '2025-04-05';

-- 13. Booking ID for a specific User ID
SELECT BookingID FROM Booking WHERE UserID = 1;

-- 14. User IDs who made bookings in January
SELECT DISTINCT UserID FROM Booking WHERE MONTH(Date) = 4;

-- 15. Booking date for a specific Booking ID
SELECT Date FROM Booking WHERE BookingID = 9;

-- 16. Number of bookings made in the last week
SELECT COUNT(*) FROM Booking WHERE Date >= CURDATE() - INTERVAL 7 DAY;

-- 17. Booking ID of the most recent booking
SELECT BookingID FROM Booking ORDER BY Date DESC LIMIT 1;

-- 18. List all Booking IDs and their associated User IDs
SELECT BookingID, UserID FROM Booking;

-- 19. Number of bookings for bus routes
SELECT COUNT(*) FROM Booking ;

-- 21. Payment method for a specific Payment ID
SELECT PaymentMethod FROM Payment WHERE PaymentID = 11;

-- 22. Amount paid for a specific Booking ID
SELECT Amount FROM Payment WHERE BookingID = 12;

-- 23. List all payments made after January 1, 2025
SELECT * FROM Payment WHERE PaymentDate > '2025-04-10';

-- 24. Number of payments made using credit cards
SELECT COUNT(*) FROM Payment WHERE PaymentMethod = 'Credit Card';

-- 25. Total payment amount in the database
SELECT SUM(Amount) AS TotalPayments FROM Payment;

-- 26. Payment date for a specific Payment ID
SELECT PaymentDate FROM Payment WHERE PaymentID = 6;

-- 27. User ID that made the highest payment
SELECT max(Amount) FROM Payment;

-- 28. Most common payment method used
SELECT PaymentMethod FROM Payment GROUP BY PaymentMethod ORDER BY COUNT(*) DESC LIMIT 1;

-- 29. List all payments and their associated Booking IDs
SELECT PaymentID, BookingID, Amount FROM Payment;

-- 30. Total amount paid for bus bookings
SELECT SUM(Amount) FROM Payment;


-- 20. Number of bookings for train routes
SELECT COUNT(*) FROM Booking WHERE RouteID IN (SELECT RouteID FROM TrainRoutes);


-- 31. Route ID for a bus starting from "City A"
SELECT RouteID FROM BusRoutes WHERE Origin = 'Chennai';

-- 32. List all bus routes that start at "City B"
SELECT RouteID FROM BusRoutes;

-- 33. Start time of a specific bus route
SELECT StartTime FROM BusRoutes WHERE RouteID = 13;

-- 34. Number of bus routes originating from "City A"
SELECT COUNT(*) FROM BusRoutes WHERE Origin = 'Kolkata';

-- 35. List all buses traveling from "City A" and 
SELECT * FROM Bus;

-- 36. Bus type for a specific Vehicle Registration Number
SELECT BusType FROM Bus WHERE VehicleRegNo = 'UP07QR6789';

-- 37. Number of buses with sleeper seating
SELECT COUNT(*) FROM Bus WHERE Seats LIKE '%Sleeper%';

-- 38. Total seating capacity of a specific bus
SELECT Seats FROM Bus WHERE VehicleRegNo = 'UP07QR6789';

-- 39. Travel agency operating a specific bus route
SELECT TravelsName FROM Bus WHERE RouteID = 12;

-- 40. End time of a specific bus route
SELECT EndTime FROM BusRoutes WHERE RouteID = 11;

-- 41. Origin and destination of a train route with a specific Route ID
SELECT Origin, Destination FROM TrainRoutes WHERE RouteID = 9;

-- 42. Start time for the train route with Route ID "6"
SELECT StartTime FROM TrainRoutes WHERE RouteID = 6;

-- 43. List all train routes passing through "Station Hubli"
SELECT * FROM TrainRoutes ;

-- 44. Train name for a specific Train Registration Number
SELECT TrainName FROM Train WHERE TrainRegNo = 1003;

-- 45. Number of train routes with a stop at "Station Y"
SELECT COUNT(*) FROM TrainRoutes ;

-- 46. Seating capacity of a specific train
SELECT SUM(SeatType) FROM Seats WHERE TrainRegNo = 1003;

-- 47. Train operating between "City A" and "City B"
SELECT TrainName FROM Train;

-- 48. Route ID of the train starting at "City A" and ending at "City B"
SELECT * FROM TrainRoutes ;

-- 49. Number of trains with "3AC" class
SELECT COUNT(*) FROM Train WHERE TrainRegNo IN (SELECT TrainRegNo FROM Seats WHERE SeatType = '3AC');

-- 50. End time of a train route with a specific Route ID
SELECT EndTime FROM TrainRoutes WHERE RouteID = 13;

DELIMITER //
CREATE PROCEDURE CheckTrainAvailability(IN train_no INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE seat_type VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT SeatType FROM Seats WHERE TrainRegNo = train_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO seat_type;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Available Seat Type: ', seat_type);
    END LOOP;
    
    CLOSE cur;
END;
//
DELIMITER ;

CALL CheckTrainAvailability(1001);

CREATE TABLE PaymentLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentID INT,
    PaymentDate DATETIME,
    Amount DECIMAL(10,2),
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID) ON DELETE CASCADE
);


select * FROM PaymentLog;
DELIMITER //
CREATE TRIGGER LogPayment AFTER INSERT ON Payment
FOR EACH ROW
BEGIN
    INSERT INTO PaymentLog (PaymentID, PaymentDate, Amount)
    VALUES (NEW.PaymentID, NOW(), NEW.Amount);
END;
//
DELIMITER ;

SELECT * FROM PaymentLog;

DELIMITER //
CREATE PROCEDURE Tickets(
    IN user_id INT, 
    IN train_no INT, 
    IN seat_type VARCHAR(50),
    IN journey_date DATE
)
BEGIN
    DECLARE available INT;
    
    -- Check if seat is available
    SELECT COUNT(*) INTO available FROM Seats WHERE TrainRegNo = train_no AND SeatType = seat_type;
    
    IF available > 0 THEN
        -- Insert into Booking table
        INSERT INTO Booking (UserID, TrainRegNo, SeatType, Date)
        VALUES (user_id, train_no, seat_type, journey_date);
        
        SELECT 'Booking Successful' AS Status;
    ELSE
        SELECT 'Booking Successful' AS Status;
    END IF;
END;
//
DELIMITER ;
CALL BookTicket(1, 1003, 'Sleeper', '2025-04-05');

DELIMITER //
CREATE TRIGGER UpdateSeatsAfterBooking
AFTER INSERT ON Booking
FOR EACH ROW
BEGIN
    DELETE FROM Seats WHERE TrainRegNo = NEW.TrainRegNo AND SeatType = NEW.SeatType LIMIT 1;
END;
//
DELIMITER ;









