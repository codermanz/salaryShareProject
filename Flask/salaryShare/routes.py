from salaryShare import app, db
from flask import render_template, url_for, flash, redirect
from salaryShare.models import Field, Location, Company, Job, User_Input, User_Entry
from salaryShare.forms import InsertCompanyForm, ReportUserInformationForm, SearchUsingJob, SearchUsingCompany, SearchUsingLocation, SearchUsingField

@app.route('/')
@app.route('/home')
def home():
    return render_template('home.html', title='Home')

@app.route('/uploadData', methods=['GET', 'POST'])
def uploadData(): 
    companyUploadForm = InsertCompanyForm()
    reportUserInfoForm = ReportUserInformationForm()

    if companyUploadForm.validate_on_submit():
        company = Company(name=companyUploadForm.name.data,
                        country=companyUploadForm.country.data,
                        state=companyUploadForm.state.data,
                        field=companyUploadForm.field.data,
                        standing=companyUploadForm.standing.data)
        db.session.add(company)
        db.session.commit()
        flash(f'Your Company has been entered!', 'success')
        return redirect(url_for('uploadData'))

    if reportUserInfoForm.validate_on_submit():
        flash(f'It went through but route for creation isnt there yet!', 'success')
        return redirect(url_for('uploadData'))

    return render_template('uploadData.html', companyForm=companyUploadForm,
                            userForm=reportUserInfoForm, title='Upload Data')

@app.route('/searchDatabase', methods=['GET', 'POST'])
def searchDatabase():
    companyFilterForm = SearchUsingCompany()
    jobFilterForm = SearchUsingJob()
    fieldFilterForm = SearchUsingField()
    locationFilterForm = SearchUsingLocation()



    if companyFilterForm.validate_on_submit():
        flash(f'It went through but route for query isnt present yet!', 'success')
        return redirect(url_for('searchDatabase'))
    
    if jobFilterForm.validate_on_submit():
        flash(f'It went through but route for query isnt present yet!', 'success')
        return redirect(url_for('searchDatabase'))
    
    if fieldFilterForm.validate_on_submit():
        flash(f'It went through but route for query isnt present yet!', 'success')
        return redirect(url_for('searchDatabase'))
    
    if locationFilterForm.validate_on_submit():
        flash(f'It went through but route for query isnt present yet!', 'success')
        return redirect(url_for('searchDatabase'))

    return render_template('searchDatabase.html', jobQueryForm=jobFilterForm,
                            companyQueryForm=companyFilterForm, fieldQueryForm=fieldFilterForm,
                            locationQueryForm=locationFilterForm, title='Search Database')

@app.route('/aboutUs')
def aboutUs(): 
    return render_template('aboutUs.html')