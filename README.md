# cloud_db_mgmt_pooling_migrations
Gain practical experience in managing a cloud-based MySQL database with a focus on implementing connection pooling and performing database migrations. You will work with both Azure and Google Cloud Platform (GCP) for this assignment.

## Connection Pooling Set Up 

**GCP:**  
+ In SQL, create a new mySQL database engine
+ Create a name and password
+ Cloud DQL edition: Enterprise 
+ Preset: Sandbox 
+ Click "Show Configuration Options" to see drop down
+ Machine Configuration: Shared core, 1 vCPU, 0.614 GB
+ Connections: add network named "Allow All" set to <code>0.0.0.0/0</code>
+ Create Instance

**Azure:** 
+ In Azure Database for MySQL servers, create new Flexible server
+ select resource group
+ Compute + storage: standard b1s
+ availabilty: no preference 
+ username and password 
+ Networking: + Add 0.0.0.0 - 255.255.255.255
+ Review + create
+ server parameters:
    + max connenctions: 20
    + connect timeouts: 3

## Database Schema and Data Creation 

**GCP:**  
+ after creating tables
+ connect my sql server w <code>mysql -u root -h[ip-address] -p [password] </code>
+ use database name (to select database)
+ show table to see if they populated 
+ exit out w exit 
+ make sure alembic is installed, if not, use pip install sqlalchemy alembic mysql-connector-python pymysql
+ <code>alembic init migrations</code> named migrations 

**Azure:** 

## Using MySQL Workbench to Generate ERD

## SQLAlchemy and Flask Integration

## Database Migrations with Alembic

## Errors
+ tables were not populating with fake data, after searching up the error message that popped up, realized it was because i had set gender to a max of 10 characters but one of the options I put was 11. Error was fixed once I replaced it with a new option. 