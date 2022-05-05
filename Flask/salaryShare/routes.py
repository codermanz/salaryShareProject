import os
import secrets
from unicodedata import name
from salaryShare import app
from flask import render_template, url_for
from salaryShare.models import Field, Location, Company, Job, User_Input, User_Entry
from salaryShare.forms import InsertCompanyForm

@app.route('/')
@app.route('/home')
def home():
    locations = Location.query.filter_by(country='United States').first()
    fields = Field.query.filter_by(name='Technology').first()
    jobs = Job.query.filter_by(name='Software Developer').first()
    companies = Company.query.filter_by(name='Apple').first()
    userInputs = User_Input.query.filter_by(negotiated='Yes').first()
    userEntries = User_Entry.query.filter_by(entryID=1).first()
    print(locations)
    print(fields)
    print(jobs)
    print(companies)
    print(userInputs)
    print(userEntries)
    return render_template('home.html')

@app.route('/uploadData')
def uploadData(): 
    return render_template('uploadData.html')

@app.route('/searchDatabase')
def searchDatabase(): 
    return render_template('searchDatabase.html')

@app.route('/aboutUs')
def aboutUs(): 
    return render_template('aboutUs.html')