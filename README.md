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
+ See [gcpDB.py](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCP/gcpDB.py) for a step by step process of the above
  
**To check if the tables have been successfully created:**

+ Connect to MySQL server with <code>mysql -u root -h[ip-address] -p [password]</code>
+ To select database to use: <code>use [database-name];</code>
+ To see a list of tables in the database: <code>show tables;</code> 
+ To exit from MySQL monitor: <code>exit</code> 

**To Populate Tables With Sample Fake Data:**

+ Create another .py file that indicates it is for populating the tables: [gcpPopulate.py](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCP/gcpPopulate.py)
+ Import necessary packages into gcpPopulate.py file
+ Load in credentials from .env file and create a database engine
+ Create a session to interact with the database
+ Create a faker instance to fill table with fake information
+ Create functions to generate fake data for the tables in the database
+ Generate and insert fake data
+ Commit the session and close it
+ See [gcpPopulate.py](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCP/gcpPopulate.py) for a step by step process of the above
+ To see if tables have been successfully populated, enter the MySQL monitor again following the steps listed under "**To check if the tables have been successfully created:**"

### Azure: 

**Create Database Schema:**

+ Follow the same steps as for GCP
+ However, the AZURE URL should be in this format: <code>mysql+pymysql://[azure-server-username]:[password]@[server-name]/[db-name]</code>
+ See [azureDB.py](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/Azure/azureDB.py) for the step by step process

**To check if the tables have been successfully created:**

+ Connect to MySQL server with <code>mysql -u [username] -h[server-name] -p [password]</code>
+ Same steps as with GCP

**To Populate Tables With Sample Fake Data:**

+ Same steps as for GCP but with the AZURE URL format

## Using MySQL Workbench to Generate ERD

**To Create Connection:**

+ In Workbench, create a new connection
+ Create a connection name
+ Hostname:
    + GCP: [public-ip-address]
    + AZURE: [server-name]
+ Username:
    + GCP: leave as root
    + AZURE: [server-username]
+ Password: store in vault... and enter respective passwords
+ Select "Test Connection" to see if everything has been entered correctly
+ If successful, click "OK"
+ 
  
**To Generate ERD:**

+ In top menu bar, select "Database"
+ Select "Reverse Engineer..."
+ Stored connection: name of current connection
+ Go "Next"
+ Select Schema
+ Go "Next"
+ Execute and finish
+ Scroll down to tables and double click on the dotted line connecting the tables
+ In Relationships tab, go to "Foreign Key"
+ Under Cardinality, select "One-to-One"
+ Save a picutre of the completed ERD: [GCP ERD](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/Screenshots%20ERD/gcphha5044c.png), [AZURE ERD](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/Screenshots%20ERD/azurehha504c.png)

## SQLAlchemy and Flask Integration

### GCP:

+ Create a new folder for the GCP Flask app and in it, create an app.py file, .env file, and a .gitignore file
    + Load the same GCP URL credentials from before into the .env file and put the .env file into .gitignore
+ In the app.py file, load in the env credentials and create an engine to connect to the GCP database
+ Create an app with Flask with an appropriate amount of routes matching the number of tables in the database
+ See [gcpApp.py](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCPFlask/gcpApp.py) for an example 
+ In the folder, create a "templates" folder to stylize the Flask app
    + [gcpbase.html](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCPFlask/templates/gcpbase.html) stylizes the homepage of the flask app
    + [gcppatients.html](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCPFlask/templates/gcppatients.html) stylizes the patients table page of the flask app
    + [gcppreferences.html](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCPFlask/templates/gcppreferences.html) stylizes the patients' preferences page of the flask app
+ Following the templates created, the finalized Flask app looks like this:
  
  Home page
  ![GCP Homepage](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/Screenshots%20GCP%20Flask/gcpbase.png)
  
  Patients Page
  ![GCP Patientpage](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/Screenshots%20GCP%20Flask/gcppatients.png)

  Preferences Page
  ![GCP Preferencespage](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/Screenshots%20GCP%20Flask/gcppreferences.png)
  

### Azure: 



## Database Migrations with Alembic

## Errors
+ tables were not populating with fake data, after searching up the error message that popped up, realized it was because i had set gender to a max of 10 characters but one of the options I put was 11. Error was fixed once I replaced it with a new option. 
