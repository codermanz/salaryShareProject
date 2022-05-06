from operator import methodcaller
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
    return render_template('home.html')

@app.route('/uploadData', methods=['GET', 'POST'])
def uploadData(): 
    return render_template('uploadData.html')

@app.route('/searchDatabase', methods=['GET', 'POST'])
def searchDatabase(): 
    return render_template('searchDatabase.html')

@app.route('/aboutUs')
def aboutUs(): 
    return render_template('aboutUs.html')