# cloud_db_mgmt_pooling_migrations
Gain practical experience in managing a cloud-based MySQL database with a focus on implementing connection pooling and performing database migrations. You will work with both Azure and Google Cloud Platform (GCP) for this assignment.

## Connection Pooling Set Up 

**GCP:**  
+ In SQL, create a new mySQL instance 
+ Create a name and password
+ Cloud DQL edition: Enterprise 
+ Preset: Sandbox 
+ Click "Show Configuration Options" to see drop down
+ Machine Configuration: Shared core, 1 vCPU, 0.614 GB
+ Connections: add network named "Allow All" set to <code>0.0.0.0/0</code>
+ Create Instance
+ After successful instance creation, go to left menu bar and select "Databases"
    + Create a new database
    + Name the database
    + Character set: utf8
    + Coallation: Default

**Azure:** 
+ In Azure Database for MySQL servers, create a new Flexible server
+ select a resource group
+ Compute + storage: standard b1s
+ Availabilty: no preference 
+ Create a username and password 
+ Networking: Select <code>+ Add 0.0.0.0 - 255.255.255.255</code>
+ Review + create
+ After successful instance creation, go to left menu bar and select "Server Parameters":
    + Max_connenctions: 20
    + Connect_timeout: 3
    + require_secure_transport: OFF 
+ In the same menu bar, go to "Databases"
    + Add a new database
    + Name the database
    + Character set: utf8
    + Collation: utf8-general-ci

## Database Schema and Data Creation 

### GCP:

**Create Database Schema:**

+ In Shell environment, first make sure all the necessary packages are installed with <code>pip install sqlalchemy alembic mysql-connector-python pymysql</code>
+ Create a .py file that indicates it is for database creation: [gcpDB.py](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCP/gcpDB.py)
+ Create a .env file to hold login credentials to access the cloud mySQL instance
+ Create a .gitignore file to hide the .env file once the files are pushed to Github
+ Import necessary packages into gcpDB.py file
+ Load in credentials from .env file and create a base
+ create tables with SQLAlchemy
+ Create an engine to connect to the cloud database
    + The GCP URL should be in this format: <code>mysql+pymysql://root:[password]@[public-ip-of-instance]/[db-name]</code>
+ See [gcpDB.py](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCP/gcpDB.py) for a step by step process of the above.
  
**To check if the tables have been successfully created:**

+ Connect to MySQL server with <code>mysql -u root -h[ip-address] -p [password]</code>
+ To select database to use: <code>use [database-name];</code>
+ To see a list of tables in the database: <code>show tables;</code> 
+ To exit from MySQL monitor: <code>exit</code> 

**To Populate Tables With Sample Fake Data:**

+

### Azure: 

## Using MySQL Workbench to Generate ERD

## SQLAlchemy and Flask Integration

## Database Migrations with Alembic

## Errors
+ tables were not populating with fake data, after searching up the error message that popped up, realized it was because i had set gender to a max of 10 characters but one of the options I put was 11. Error was fixed once I replaced it with a new option. 
