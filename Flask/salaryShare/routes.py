import os
import secrets
from salaryShare import app
from flask import render_template, url_for
#from salaryShare.models import 
#from salaryShare.forms import

@app.route('/')
@app.route('/home')
def home(): 
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