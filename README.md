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

**GCP:** 
+ In Shell environment, first make sure all the necessary packages are installed with <code>pip install sqlalchemy alembic mysql-connector-python pymysql</code>
+ create a .py file that indicates it is for database creation: [gcpDB.py](https://github.com/joyc3lin/cloud_db_mgmt_pooling_migrations/blob/main/GCP/gcpDB.py)
+ Import necessary packages into file: 
  
```python
from sqlalchemy import create_engine, inspect, Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
import os 
from dotenv import load_dotenv
```
+ create tables with SQLAlchemy:

```python
class Patient(Base):
    __tablename__ = 'patients'

    id = Column(Integer, primary_key=True)
    first_name = Column(String(50), nullable=False)
    last_name = Column(String(50), nullable=False)
    date_of_birth = Column(Date, nullable=False)
    gender = Column(String(10), nullable=False)
    email = Column(String(100))
    language_spoken = Column(String(100))


    preferences = relationship('Preferences', back_populates='patient')

class Preferences(Base):
    __tablename__ = 'patient_preferences'

    id = Column(Integer, primary_key=True)
    patient_id = Column(Integer, ForeignKey('patients.id'), nullable=False)
    favorite_food = Column(String(200), nullable=False)
    favorite_shows = Column(String(200))
    hobbies = Column(String(200))
    toothpaste_flavor = Column(String(100))    

    patient = relationship('Patient', back_populates='preferences') 
```
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
