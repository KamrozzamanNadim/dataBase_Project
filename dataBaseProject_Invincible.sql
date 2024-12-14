-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2024 at 05:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comprehensivevegshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `AttendanceID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `AttendanceDate` date DEFAULT curdate(),
  `Status` enum('Present','Absent','Leave') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auditlog`
--

CREATE TABLE `auditlog` (
  `CustomerID` int(11) NOT NULL,
  `DeletionDate` datetime NOT NULL,
  `DeletedBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `MembershipType` enum('Regular','Premium','Occasional') DEFAULT 'Regular',
  `TotalPurchases` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `Name`, `ContactNumber`, `Email`, `Address`, `MembershipType`, `TotalPurchases`) VALUES
(1, 'Ali Hasan', '01812345678', 'ali@gmail.com', 'Dhaka', 'Regular', 1500.00),
(2, 'Rehena Khatun', '01787654321', 'rehena@gmail.com', 'Chittagong', 'Premium', 3200.00),
(3, 'Habib Rahman', '01698765432', 'habib@gmail.com', 'Sylhet', 'Occasional', 850.00);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerfeedback`
-- (See below for the actual view)
--
CREATE TABLE `customerfeedback` (
`CustomerName` varchar(100)
,`ProductName` varchar(100)
,`Rating` int(11)
,`ReviewText` text
,`ReviewDate` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerorderdetails`
-- (See below for the actual view)
--
CREATE TABLE `customerorderdetails` (
`CustomerName` varchar(100)
,`OrderID` int(11)
,`TotalAmount` decimal(10,2)
,`DeliveryStatus` enum('Pending','Delivered','Cancelled')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerorderstatus`
-- (See below for the actual view)
--
CREATE TABLE `customerorderstatus` (
`CustomerName` varchar(100)
,`OrderID` int(11)
,`OrderDate` date
,`TotalAmount` decimal(10,2)
,`DeliveryStatus` enum('Pending','Delivered','Cancelled')
);

-- --------------------------------------------------------

--
-- Table structure for table `customersubscription`
--

CREATE TABLE `customersubscription` (
  `SubscriptionID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `PlanID` int(11) DEFAULT NULL,
  `SubscriptionStartDate` date DEFAULT NULL,
  `SubscriptionEndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `DiscountID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `DiscountPercentage` decimal(5,2) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `JobRole` varchar(50) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `HireDate` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `Name`, `ContactNumber`, `Email`, `JobRole`, `Salary`, `HireDate`) VALUES
(1, 'Saiful Islam', '01855667788', 'saiful@gmail.com', 'Salesman', 12000.00, '2024-11-19'),
(2, 'Mithun Sarker', '01777889900', 'mithun@gmail.com', 'Delivery Man', 15000.00, '2024-11-19'),
(3, 'Nasrin Akter', '01688990077', 'nasrin@gmail.com', 'Cashier', 18000.00, '2024-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `farmdetails`
--

CREATE TABLE `farmdetails` (
  `FarmID` int(11) NOT NULL,
  `FarmerID` int(11) DEFAULT NULL,
  `CropType` varchar(100) DEFAULT NULL,
  `FarmSize` float DEFAULT NULL,
  `IrrigationMethod` varchar(100) DEFAULT NULL,
  `HarvestCycle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `farmdetails`
--

INSERT INTO `farmdetails` (`FarmID`, `FarmerID`, `CropType`, `FarmSize`, `IrrigationMethod`, `HarvestCycle`) VALUES
(1, 1, 'Potato', 5.5, 'Drip Irrigation', 90),
(2, 2, 'Brinjal', 3.2, 'Flood Irrigation', 120),
(3, 3, 'Tomato', 4.8, 'Sprinkler Irrigation', 75);

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `FarmerID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `NID` varchar(20) DEFAULT NULL,
  `FarmLocation` varchar(255) DEFAULT NULL,
  `JoinedDate` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`FarmerID`, `Name`, `Address`, `ContactNumber`, `Email`, `NID`, `FarmLocation`, `JoinedDate`) VALUES
(1, 'Abdul Karim', 'Gazipur', '01712345678', 'abdul@gmail.com', '1982345678901', 'Gazipur District', '2023-01-15'),
(2, 'Rafiqul Islam', 'Narayanganj', '01898765432', 'rafiqul@gmail.com', '1987654321098', 'Narayanganj', '2022-05-10'),
(3, 'Shahina Begum', 'Mymensingh', '01611223344', 'shahina@gmail.com', '1985432109876', 'Mymensingh Rural Area', '2021-07-20');

-- --------------------------------------------------------

--
-- Stand-in structure for view `farmerfarmdetails`
-- (See below for the actual view)
--
CREATE TABLE `farmerfarmdetails` (
`FarmerName` varchar(100)
,`FarmLocation` varchar(255)
,`CropType` varchar(100)
,`FarmSize` float
,`IrrigationMethod` varchar(100)
,`HarvestCycle` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `FeedbackText` text DEFAULT NULL,
  `FeedbackDate` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `InventoryID` int(11) NOT NULL,
  `ShopID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `RestockDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`InventoryID`, `ShopID`, `ProductID`, `Quantity`, `RestockDate`) VALUES
(1, 1, 1, 150, '2024-11-14'),
(2, 2, 2, 50, '2024-11-13'),
(3, 3, 3, 70, '2024-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `logistics`
--

CREATE TABLE `logistics` (
  `LogisticsID` int(11) NOT NULL,
  `TransportID` int(11) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `DispatchDate` date DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `DeliveryStatus` enum('In Transit','Delivered','Cancelled') DEFAULT 'In Transit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logistics`
--

INSERT INTO `logistics` (`LogisticsID`, `TransportID`, `OrderID`, `DispatchDate`, `DeliveryDate`, `DeliveryStatus`) VALUES
(1, 1, 1, '2024-11-15', '2024-11-15', 'Delivered'),
(2, 2, 2, '2024-11-16', NULL, 'In Transit'),
(3, 3, 3, '2024-11-17', '2024-11-17', 'Delivered');

-- --------------------------------------------------------

--
-- Stand-in structure for view `logisticssummary`
-- (See below for the actual view)
--
CREATE TABLE `logisticssummary` (
`OrderID` int(11)
,`VehicleType` varchar(50)
,`DriverName` varchar(100)
,`DeliveryStatus` enum('In Transit','Delivered','Cancelled')
,`DispatchDate` date
,`DeliveryDate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `marketingcampaign`
--

CREATE TABLE `marketingcampaign` (
  `CampaignID` int(11) NOT NULL,
  `CampaignName` varchar(100) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Budget` decimal(10,2) DEFAULT NULL,
  `TargetAudience` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `PricePerUnit` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `PricePerUnit`) VALUES
(1, 1, 1, 20, 25.50),
(2, 1, 3, 10, 28.00),
(3, 2, 2, 15, 35.00),
(4, 4, 2, 10, 35.00);

--
-- Triggers `orderdetails`
--
DELIMITER $$
CREATE TRIGGER `AdjustTotalAmount` AFTER DELETE ON `orderdetails` FOR EACH ROW BEGIN
    UPDATE Orders
    SET TotalAmount = (
        SELECT COALESCE(SUM(OrderDetails.Quantity * OrderDetails.Price), 0)
        FROM OrderDetails
        WHERE OrderDetails.OrderID = OLD.OrderID
    )
    WHERE Orders.OrderID = OLD.OrderID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `CalculateTotalAmount` AFTER INSERT ON `orderdetails` FOR EACH ROW BEGIN
    UPDATE Orders
    SET TotalAmount = (
        SELECT SUM(OrderDetails.Quantity * OrderDetails.Price)
        FROM OrderDetails
        WHERE OrderDetails.OrderID = NEW.OrderID
    )
    WHERE Orders.OrderID = NEW.OrderID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `RecalculateTotalAmount` AFTER UPDATE ON `orderdetails` FOR EACH ROW BEGIN
    UPDATE Orders
    SET TotalAmount = (
        SELECT SUM(OrderDetails.Quantity * OrderDetails.Price)
        FROM OrderDetails
        WHERE OrderDetails.OrderID = NEW.OrderID
    )
    WHERE Orders.OrderID = NEW.OrderID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ReduceStock` AFTER INSERT ON `orderdetails` FOR EACH ROW BEGIN
    UPDATE Products
    SET Stock = Stock - NEW.Quantity
    WHERE Products.ProductID = NEW.ProductID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT curdate(),
  `TotalAmount` decimal(10,2) NOT NULL,
  `PaymentMethod` enum('Cash','Card','Mobile Banking') DEFAULT 'Cash',
  `DeliveryStatus` enum('Pending','Delivered','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrderDate`, `TotalAmount`, `PaymentMethod`, `DeliveryStatus`) VALUES
(1, 1, '2024-11-15', 850.00, 'Cash', 'Delivered'),
(2, 2, '2024-11-16', 1200.00, 'Card', 'Pending'),
(3, 3, '2024-11-17', 450.00, 'Mobile Banking', 'Delivered'),
(4, 2, '2024-11-27', 1050.00, 'Mobile Banking', 'Pending');

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `LogOrderChanges` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    INSERT INTO OrderLogs (OrderID, ChangeDate, OldTotal, NewTotal)
    VALUES (
        OLD.OrderID,
        NOW(),
        OLD.TotalAmount,
        NEW.TotalAmount
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `PaymentDate` date DEFAULT curdate(),
  `AmountPaid` decimal(10,2) NOT NULL,
  `PaymentMethod` enum('Cash','Card','Mobile Banking') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `OrderID`, `PaymentDate`, `AmountPaid`, `PaymentMethod`) VALUES
(1, 1, '2024-11-15', 850.00, 'Cash'),
(2, 2, '2024-11-16', 1200.00, 'Card'),
(3, 3, '2024-11-17', 450.00, 'Mobile Banking');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `StockQuantity` int(11) DEFAULT 0,
  `ExpiryDate` date DEFAULT NULL,
  `FarmerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `Category`, `UnitPrice`, `StockQuantity`, `ExpiryDate`, `FarmerID`) VALUES
(1, 'Potato', 'Vegetable', 22.95, 550, '2024-01-15', 1),
(2, 'Brinjal', 'Vegetable', 31.50, 290, '2024-01-20', 2),
(3, 'Tomato', 'Vegetable', 25.20, 400, '2024-01-10', 3);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `UpdateInventoryOnRestock` AFTER UPDATE ON `product` FOR EACH ROW BEGIN
    IF NEW.StockQuantity > OLD.StockQuantity THEN
        UPDATE Inventory
        SET Quantity = Quantity + (NEW.StockQuantity - OLD.StockQuantity)
        WHERE ProductID = NEW.ProductID;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `productsalesreport`
-- (See below for the actual view)
--
CREATE TABLE `productsalesreport` (
`ProductName` varchar(100)
,`TotalQuantitySold` decimal(32,0)
,`TotalRevenue` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE `refund` (
  `RefundID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `RefundAmount` decimal(10,2) DEFAULT NULL,
  `RefundReason` text DEFAULT NULL,
  `RefundDate` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL CHECK (`Rating` between 1 and 5),
  `ReviewText` text DEFAULT NULL,
  `ReviewDate` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `CustomerID`, `ProductID`, `Rating`, `ReviewText`, `ReviewDate`) VALUES
(1, 1, 1, 5, 'Fresh potatoes, very good quality.', '2024-11-19'),
(2, 2, 3, 4, 'Tomatoes were nice, but some were too ripe.', '2024-11-19'),
(3, 3, 2, 5, 'Brinjals were excellent, very fresh.', '2024-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `ShopID` int(11) NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `OwnerName` varchar(100) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `OpeningTime` time DEFAULT NULL,
  `ClosingTime` time DEFAULT NULL,
  `ShopLicenseNumber` varchar(50) DEFAULT NULL,
  `CreatedDate` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`ShopID`, `ShopName`, `Location`, `OwnerName`, `ContactNumber`, `OpeningTime`, `ClosingTime`, `ShopLicenseNumber`, `CreatedDate`) VALUES
(1, 'Green Mart', 'Dhaka', 'Rafiq Ahmed', '01912345678', '08:00:00', '22:00:00', 'SHOP123456', '2024-11-19'),
(2, 'Fresh Veggies', 'Chittagong', 'Farhana Jahan', '01798765432', '09:00:00', '21:00:00', 'SHOP789101', '2024-11-19'),
(3, 'Healthy Harvest', 'Sylhet', 'Hasib Uddin', '01612378945', '07:30:00', '20:30:00', 'SHOP456789', '2024-11-19');

-- --------------------------------------------------------

--
-- Stand-in structure for view `shopinventorystatus`
-- (See below for the actual view)
--
CREATE TABLE `shopinventorystatus` (
`ShopName` varchar(100)
,`ProductName` varchar(100)
,`Quantity` int(11)
,`RestockDate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptionplan`
--

CREATE TABLE `subscriptionplan` (
  `PlanID` int(11) NOT NULL,
  `PlanName` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Benefits` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `Name`, `ContactNumber`, `Email`, `Address`) VALUES
(1, 'Jamal Supply', '01722334455', 'jamal@gmail.com', 'Gazipur'),
(2, 'Rahim Traders', '01833445566', 'rahim@gmail.com', 'Dhaka'),
(3, 'Arif Enterprise', '01644556677', 'arif@gmail.com', 'Sylhet');

-- --------------------------------------------------------

--
-- Stand-in structure for view `suppliershopinteraction`
-- (See below for the actual view)
--
CREATE TABLE `suppliershopinteraction` (
`SupplierName` varchar(100)
,`ShopName` varchar(100)
,`ProductName` varchar(100)
,`Quantity` int(11)
,`UnitCost` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `supplyorder`
--

CREATE TABLE `supplyorder` (
  `SupplyOrderID` int(11) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `ShopID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT curdate(),
  `TotalCost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplyorder`
--

INSERT INTO `supplyorder` (`SupplyOrderID`, `SupplierID`, `ShopID`, `OrderDate`, `TotalCost`) VALUES
(1, 1, 1, '2024-11-10', 5000.00),
(2, 2, 2, '2024-11-11', 3000.00),
(3, 3, 3, '2024-11-12', 4000.00);

-- --------------------------------------------------------

--
-- Table structure for table `supplyorderdetails`
--

CREATE TABLE `supplyorderdetails` (
  `SupplyOrderDetailID` int(11) NOT NULL,
  `SupplyOrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitCost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplyorderdetails`
--

INSERT INTO `supplyorderdetails` (`SupplyOrderDetailID`, `SupplyOrderID`, `ProductID`, `Quantity`, `UnitCost`) VALUES
(1, 1, 1, 200, 25.00),
(2, 2, 2, 100, 30.00),
(3, 3, 3, 150, 27.00);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `TaxID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `TaxPercentage` decimal(5,2) DEFAULT NULL,
  `EffectiveDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `topcustomers`
-- (See below for the actual view)
--
CREATE TABLE `topcustomers` (
`CustomerName` varchar(100)
,`TotalPurchases` decimal(10,2)
,`MembershipType` enum('Regular','Premium','Occasional')
);

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `TransportID` int(11) NOT NULL,
  `VehicleType` varchar(50) NOT NULL,
  `VehicleNumber` varchar(20) NOT NULL,
  `DriverName` varchar(100) NOT NULL,
  `DriverContact` varchar(15) DEFAULT NULL,
  `TransportCapacity` int(11) DEFAULT NULL,
  `TransportRoute` varchar(255) DEFAULT NULL,
  `AvailabilityStatus` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`TransportID`, `VehicleType`, `VehicleNumber`, `DriverName`, `DriverContact`, `TransportCapacity`, `TransportRoute`, `AvailabilityStatus`) VALUES
(1, 'Truck', 'DH-TR1234', 'Kamal Hossain', '01711122334', 2000, 'Gazipur to Dhaka', 1),
(2, 'Pickup Van', 'CTG-V4567', 'Bashir Ahmed', '01812345678', 1000, 'Chittagong to Dhaka', 1),
(3, 'Rickshaw Van', 'SYL-R9876', 'Anisur Rahman', '01622334455', 500, 'Sylhet City', 1);

-- --------------------------------------------------------

--
-- Structure for view `customerfeedback`
--
DROP TABLE IF EXISTS `customerfeedback`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerfeedback`  AS SELECT `c`.`Name` AS `CustomerName`, `p`.`ProductName` AS `ProductName`, `r`.`Rating` AS `Rating`, `r`.`ReviewText` AS `ReviewText`, `r`.`ReviewDate` AS `ReviewDate` FROM ((`review` `r` join `customer` `c` on(`r`.`CustomerID` = `c`.`CustomerID`)) join `product` `p` on(`r`.`ProductID` = `p`.`ProductID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `customerorderdetails`
--
DROP TABLE IF EXISTS `customerorderdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerorderdetails`  AS SELECT `c`.`Name` AS `CustomerName`, `o`.`OrderID` AS `OrderID`, `o`.`TotalAmount` AS `TotalAmount`, `o`.`DeliveryStatus` AS `DeliveryStatus` FROM (`orders` `o` join `customer` `c` on(`o`.`CustomerID` = `c`.`CustomerID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `customerorderstatus`
--
DROP TABLE IF EXISTS `customerorderstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerorderstatus`  AS SELECT `c`.`Name` AS `CustomerName`, `o`.`OrderID` AS `OrderID`, `o`.`OrderDate` AS `OrderDate`, `o`.`TotalAmount` AS `TotalAmount`, `o`.`DeliveryStatus` AS `DeliveryStatus` FROM (`orders` `o` join `customer` `c` on(`o`.`CustomerID` = `c`.`CustomerID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `farmerfarmdetails`
--
DROP TABLE IF EXISTS `farmerfarmdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `farmerfarmdetails`  AS SELECT `f`.`Name` AS `FarmerName`, `f`.`FarmLocation` AS `FarmLocation`, `fd`.`CropType` AS `CropType`, `fd`.`FarmSize` AS `FarmSize`, `fd`.`IrrigationMethod` AS `IrrigationMethod`, `fd`.`HarvestCycle` AS `HarvestCycle` FROM (`farmer` `f` join `farmdetails` `fd` on(`f`.`FarmerID` = `fd`.`FarmerID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `logisticssummary`
--
DROP TABLE IF EXISTS `logisticssummary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `logisticssummary`  AS SELECT `l`.`OrderID` AS `OrderID`, `t`.`VehicleType` AS `VehicleType`, `t`.`DriverName` AS `DriverName`, `l`.`DeliveryStatus` AS `DeliveryStatus`, `l`.`DispatchDate` AS `DispatchDate`, `l`.`DeliveryDate` AS `DeliveryDate` FROM (`logistics` `l` join `transport` `t` on(`l`.`TransportID` = `t`.`TransportID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `productsalesreport`
--
DROP TABLE IF EXISTS `productsalesreport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productsalesreport`  AS SELECT `p`.`ProductName` AS `ProductName`, sum(`od`.`Quantity`) AS `TotalQuantitySold`, sum(`od`.`Quantity` * `od`.`PricePerUnit`) AS `TotalRevenue` FROM (`product` `p` join `orderdetails` `od` on(`p`.`ProductID` = `od`.`ProductID`)) GROUP BY `p`.`ProductName` ;

-- --------------------------------------------------------

--
-- Structure for view `shopinventorystatus`
--
DROP TABLE IF EXISTS `shopinventorystatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shopinventorystatus`  AS SELECT `sh`.`ShopName` AS `ShopName`, `p`.`ProductName` AS `ProductName`, `inv`.`Quantity` AS `Quantity`, `inv`.`RestockDate` AS `RestockDate` FROM ((`inventory` `inv` join `shop` `sh` on(`inv`.`ShopID` = `sh`.`ShopID`)) join `product` `p` on(`inv`.`ProductID` = `p`.`ProductID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `suppliershopinteraction`
--
DROP TABLE IF EXISTS `suppliershopinteraction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `suppliershopinteraction`  AS SELECT `s`.`Name` AS `SupplierName`, `sh`.`ShopName` AS `ShopName`, `p`.`ProductName` AS `ProductName`, `sod`.`Quantity` AS `Quantity`, `sod`.`UnitCost` AS `UnitCost` FROM ((((`supplier` `s` join `supplyorder` `so` on(`s`.`SupplierID` = `so`.`SupplierID`)) join `supplyorderdetails` `sod` on(`so`.`SupplyOrderID` = `sod`.`SupplyOrderID`)) join `product` `p` on(`sod`.`ProductID` = `p`.`ProductID`)) join `shop` `sh` on(`so`.`ShopID` = `sh`.`ShopID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `topcustomers`
--
DROP TABLE IF EXISTS `topcustomers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topcustomers`  AS SELECT `customer`.`Name` AS `CustomerName`, `customer`.`TotalPurchases` AS `TotalPurchases`, `customer`.`MembershipType` AS `MembershipType` FROM `customer` WHERE `customer`.`TotalPurchases` > 2000 ORDER BY `customer`.`TotalPurchases` DESC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `customersubscription`
--
ALTER TABLE `customersubscription`
  ADD PRIMARY KEY (`SubscriptionID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `PlanID` (`PlanID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`DiscountID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `farmdetails`
--
ALTER TABLE `farmdetails`
  ADD PRIMARY KEY (`FarmID`),
  ADD KEY `FarmerID` (`FarmerID`);

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`FarmerID`),
  ADD UNIQUE KEY `NID` (`NID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`InventoryID`),
  ADD KEY `ShopID` (`ShopID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `logistics`
--
ALTER TABLE `logistics`
  ADD PRIMARY KEY (`LogisticsID`),
  ADD KEY `TransportID` (`TransportID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `marketingcampaign`
--
ALTER TABLE `marketingcampaign`
  ADD PRIMARY KEY (`CampaignID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FarmerID` (`FarmerID`);

--
-- Indexes for table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`RefundID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`ShopID`),
  ADD UNIQUE KEY `ShopLicenseNumber` (`ShopLicenseNumber`);

--
-- Indexes for table `subscriptionplan`
--
ALTER TABLE `subscriptionplan`
  ADD PRIMARY KEY (`PlanID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `supplyorder`
--
ALTER TABLE `supplyorder`
  ADD PRIMARY KEY (`SupplyOrderID`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `ShopID` (`ShopID`);

--
-- Indexes for table `supplyorderdetails`
--
ALTER TABLE `supplyorderdetails`
  ADD PRIMARY KEY (`SupplyOrderDetailID`),
  ADD KEY `SupplyOrderID` (`SupplyOrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`TaxID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`TransportID`),
  ADD UNIQUE KEY `VehicleNumber` (`VehicleNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customersubscription`
--
ALTER TABLE `customersubscription`
  MODIFY `SubscriptionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `DiscountID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `farmdetails`
--
ALTER TABLE `farmdetails`
  MODIFY `FarmID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `farmer`
--
ALTER TABLE `farmer`
  MODIFY `FarmerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedbackID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `InventoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logistics`
--
ALTER TABLE `logistics`
  MODIFY `LogisticsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marketingcampaign`
--
ALTER TABLE `marketingcampaign`
  MODIFY `CampaignID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `refund`
--
ALTER TABLE `refund`
  MODIFY `RefundID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `ShopID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscriptionplan`
--
ALTER TABLE `subscriptionplan`
  MODIFY `PlanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplyorder`
--
ALTER TABLE `supplyorder`
  MODIFY `SupplyOrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplyorderdetails`
--
ALTER TABLE `supplyorderdetails`
  MODIFY `SupplyOrderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `TaxID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `TransportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `customersubscription`
--
ALTER TABLE `customersubscription`
  ADD CONSTRAINT `customersubscription_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `customersubscription_ibfk_2` FOREIGN KEY (`PlanID`) REFERENCES `subscriptionplan` (`PlanID`);

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `farmdetails`
--
ALTER TABLE `farmdetails`
  ADD CONSTRAINT `farmdetails_ibfk_1` FOREIGN KEY (`FarmerID`) REFERENCES `farmer` (`FarmerID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`ShopID`) REFERENCES `shop` (`ShopID`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `logistics`
--
ALTER TABLE `logistics`
  ADD CONSTRAINT `logistics_ibfk_1` FOREIGN KEY (`TransportID`) REFERENCES `transport` (`TransportID`),
  ADD CONSTRAINT `logistics_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`FarmerID`) REFERENCES `farmer` (`FarmerID`);

--
-- Constraints for table `refund`
--
ALTER TABLE `refund`
  ADD CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `supplyorder`
--
ALTER TABLE `supplyorder`
  ADD CONSTRAINT `supplyorder_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`),
  ADD CONSTRAINT `supplyorder_ibfk_2` FOREIGN KEY (`ShopID`) REFERENCES `shop` (`ShopID`);

--
-- Constraints for table `supplyorderdetails`
--
ALTER TABLE `supplyorderdetails`
  ADD CONSTRAINT `supplyorderdetails_ibfk_1` FOREIGN KEY (`SupplyOrderID`) REFERENCES `supplyorder` (`SupplyOrderID`),
  ADD CONSTRAINT `supplyorderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `tax`
--
ALTER TABLE `tax`
  ADD CONSTRAINT `tax_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
