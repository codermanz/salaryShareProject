from salaryShare import db
from sqlalchemy import ForeignKeyConstraint, UniqueConstraint, ForeignKey, Identity

# Currently using __tablename__ to reference an already created DB. 

class Field(db.Model):

    __tablename__ = 'FIELD'
    name = db.Column('NAME', db.String(50), primary_key=True)

    # Relationships
    companies = db.relationship('Company', backref='companyField', lazy=True)
    jobs = db.relationship('Job', backref='jobField', lazy=True)

    def __repr__(self):
        return f"Field('{self.name}')"

class Location(db.Model):
    __tablename__ = 'LOCATION'

    country = db.Column('COUNTRY', db.String(50), primary_key=True)
    state = db.Column('STATE', db.String(50), primary_key=True)

    #Relationships
    companies = db.relationship('Company', backref='companyLocation', lazy=True)
    users = db.relationship('User_Input', backref='userLocation', lazy=True)

    def __repr__(self):
        return f"Location('{self.country}', '{self.state}')"

class Company(db.Model):
    __tablename__ = 'COMPANY'
    name = db.Column('COMPANY_NAME', db.String(60), primary_key=True)
    standing = db.Column('COMPANY_STANDING', db.Text, nullable=True)

    #Foreign Keys
    country = db.Column('COMPANY_COUNTRY', db.String(50), primary_key=True)
    state = db.Column('COMPANY_STATE', db.String(50), primary_key=True)
    __table_args__ = (ForeignKeyConstraint([country, state], 
                                            ['LOCATION.COUNTRY', 'LOCATION.STATE']), 
                                            {})
    field = db.Column('COMPANY_FIELD', db.String(50), ForeignKey('FIELD.NAME'), nullable=False)

    #Relationships
    userInputs = db.relationship('User_Input', backref='company', lazy=True)

    def __repr__(self):
        return f"Company('{self.name}', '{self.country}', '{self.state}', '{self.standing}', '{self.field}')"

class Job(db.Model):
    __tablename__ = 'JOB'
    jobID = db.Column('JOB_ID', db.Integer, Identity(1, cycle=True), primary_key=True)

    name = db.Column('JOB_NAME', db.String(50), nullable=False)
    level = db.Column('JOB_LEVEL', db.String(50), nullable=True)
    commitment = db.Column('JOB_COMMITMENT', db.String(50), nullable=True)
    shiftTime = db.Column('JOB_SHIFT_TIME', db.String(50), nullable=True)
    locationType = db.Column('JOB_LOCATION_TYPE', db.String(50), nullable=True)

    #Foreign Keys
    field = db.Column('JOB_FIELD', db.String(50), ForeignKey('FIELD.NAME'), nullable=False)

    #Relationships
    userInputs = db.relationship('User_Input', backref='userJob', lazy=True)

    def __repr__(self):
        return f"Job('{self.name}', '{self.level}', '{self.commitment}', '{self.shiftTime}', '{self.locationType}', , '{self.field}')"

class User_Input(db.Model):
    __tablename__ = 'USER_INPUT'
    inputID = db.Column('INPUT_ID', db.Integer, Identity(1, cycle=True), primary_key=True)
    yearsWorking = db.Column('YEARS_WORKING', db.Integer, nullable=False)
    yearsAtCompany = db.Column('YEARS_AT_COMPANY', db.Integer, nullable=False)
    salary = db.Column('SALARY', db.Integer, nullable=False)
    negotiated = db.Column('NEGOTIATED', db.String(3), nullable=True)

    #Foreign Keys
        #User Location
    country = db.Column('USER_COUNTRY', db.String(50))
    state = db.Column('USER_STATE', db.String(50))
    __table_args__ = (ForeignKeyConstraint([country, state], 
                                            ['LOCATION.COUNTRY', 'LOCATION.STATE']),
                                            {})
    
        #Company
    companyName = db.Column('USER_COMPANY_NAME', db.String(60), nullable=False)
    companyCountry = db.Column('USER_COMPANY_COUNTRY', db.String(50), nullable=False)
    companyState = db.Column('USER_COMPANY_STATE', db.String(50), nullable=False)
    __table_args__ = (ForeignKeyConstraint([companyName, companyCountry, companyState] , 
                                            ['COMPANY.COMPANY_NAME', 'COMPANY.COMPANY_COUNTRY', 'COMPANY.COMPANY_STATE']),
                                            {})
        #Job
    jobID = db.Column('USER_JOB_ID', db.Integer, ForeignKey('JOB.JOB_ID'), nullable=False)

    # Unique constraint on columns (see logical design)
    __table_args__ = (UniqueConstraint(yearsWorking, yearsAtCompany, salary, negotiated,
                                        jobID, country, state, companyName, companyCountry,
                                        companyState), 
                                        {})

    #Relationships
    userEntries = db.relationship('User_Entry', backref='userInput', lazy=True)

    def __repr__(self):
        return f"User_Input('{self.inputID}', '{self.yearsAtCompany}', '{self.yearsAtCompany}', '{self.salary}', '{self.negotiated}', '{self.country}', '{self.state}', '{self.companyName}', '{self.companyCountry}', '{self.companyState}', '{self.jobID}')"

class User_Entry(db.Model):
    __tablename__ = 'USER_ENTRY'
    entryID = db.Column('ENTRY_ID', db.Integer, Identity(1, cycle=True),  primary_key=True)
    userInputID = db.Column('USER_INPUT_ID', db.Integer, ForeignKey('USER_INPUT.INPUT_ID'), nullable = False)

    def __repr__(self):
        return f"User_Entry('{self.entryID}', '{self.userInputID}')"