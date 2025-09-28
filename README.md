# Trucking Inventory Database

A relational database system designed for an East African trucking business to track inventory, warehouses, trucks, drivers, and shipments.

## Overview

This database allows the trucking business to:

- Track inventory of products (e.g., maize, potatoes, fertilizers, cement) across multiple warehouses and drop locations in Kenya, Uganda, and Tanzania.
- Manage trucks and drivers.
- Record shipments, including origin and destination warehouses and products per shipment.
- Maintain stock levels at each warehouse.

## Tables

- **Products** – List of items being transported.
- **Warehouses** – Storage and drop locations across the three countries.
- **SuppliersClients** – Information about suppliers or clients.
- **Drivers** – Truck drivers with contact info.
- **Trucks** – Fleet information with capacity and assigned driver.
- **Stock** – Inventory quantities per warehouse.
- **Shipments** – Records of shipments including truck, driver, origin, and destination.
- **ShipmentProducts** – Products included in each shipment.

## Features

- Enforces data integrity with primary and foreign keys.
- Supports multiple products per shipment.
- Tracks inventory in multiple warehouses.
- Includes sample data for trucks, drivers, warehouses, products, and shipments.

## Usage

1. Import `trucking_inventory.sql` into MySQL.
2. Explore stock levels, shipments, and assignments.
3. Extend the database for additional features if needed.

---

This project is ideal for tracking complex logistics and inventory operations for a trucking business operating in East Africa.
