-- Create Database
CREATE DATABASE TruckingInventoryDB;
USE TruckingInventoryDB;

-- Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category ENUM('Fertilizer','Produce','Other') NOT NULL
);

-- Warehouses Table
CREATE TABLE Warehouses (
    WarehouseID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(100) NOT NULL,
    Country ENUM('Kenya','Uganda','Tanzania') NOT NULL,
    Location VARCHAR(100)
);

-- Suppliers/Clients Table
CREATE TABLE SuppliersClients (
    SupplierClientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- Drivers Table
CREATE TABLE Drivers (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15)
);

-- Trucks Table
CREATE TABLE Trucks (
    TruckID INT AUTO_INCREMENT PRIMARY KEY,
    RegistrationNumber VARCHAR(20) NOT NULL UNIQUE,
    Capacity INT NOT NULL,
    DriverID INT,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- Stock Table
CREATE TABLE Stock (
    StockID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    UNIQUE(ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);

-- Shipments Table
CREATE TABLE Shipments (
    ShipmentID INT AUTO_INCREMENT PRIMARY KEY,
    TruckID INT NOT NULL,
    DriverID INT NOT NULL,
    OriginWarehouseID INT NOT NULL,
    DestinationWarehouseID INT NOT NULL,
    ShipmentDate DATE NOT NULL,
    DeliveryDate DATE,
    FOREIGN KEY (TruckID) REFERENCES Trucks(TruckID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
    FOREIGN KEY (OriginWarehouseID) REFERENCES Warehouses(WarehouseID),
    FOREIGN KEY (DestinationWarehouseID) REFERENCES Warehouses(WarehouseID)
);

-- ShipmentProducts Table (Products per Shipment)
CREATE TABLE ShipmentProducts (
    ShipmentID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (ShipmentID, ProductID),
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
