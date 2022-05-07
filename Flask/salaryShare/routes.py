from dataclasses import field
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
    #Mai forms
    companyUploadForm = InsertCompanyForm()
    reportUserInfoForm = ReportUserInformationForm()

    # Upload company info form - validate fields first (ensure foreign key)
    # constraints are met
    if companyUploadForm.validate_on_submit():
        locationVerification(companyUploadForm)
        companyQuery = Company.query.filter_by(name=companyUploadForm.name.data,
                        country=companyUploadForm.country.data,
                        state=companyUploadForm.state.data).first()
        if companyQuery:
            flash(f'Company Already Exists!', 'danger')
            return redirect(url_for('uploadData'))
        else:
            company = Company(name=companyUploadForm.name.data,
                            country=companyUploadForm.country.data,
                            state=companyUploadForm.state.data,
                            field=companyUploadForm.field.data,
                            standing=companyUploadForm.standing.data)
            db.session.add(company)
            db.session.commit()
            flash(f'Your Company has been entered!', 'success')
            return redirect(url_for('uploadData'))
    # Upload user input to the database. Validate all fields to ensure foreign keys
    # constraints are met and no duplicates are created
    if reportUserInfoForm.validate_on_submit():
        # Ensure company exists, if it doesn't show an error 
        companyQuery = Company.query.filter_by(name=reportUserInfoForm.companyName.data, 
                                                country=reportUserInfoForm.companyCountry.data,
                                                state=reportUserInfoForm.companyState.data).first()
        if (not companyQuery):
            flash(f'Company doesn\'t exist, please enter company info first!', 'danger')
            return redirect(url_for('uploadData'))
        # Get or create location foreign key
        locationVerification(reportUserInfoForm)
        # Get or create jobId
        jobID = getJobTuple(reportUserInfoForm)
        # Get or create user input
        userInputID = getUserInput(reportUserInfoForm, jobID)
        # Create User entry
        entry = User_Entry(userInputID=userInputID)
        db.session.add(entry)
        db.session.commit()

        flash(f'Your entry has been stored!', 'success')
        return redirect(url_for('uploadData'))

    return render_template('uploadData.html', companyForm=companyUploadForm,
                            userForm=reportUserInfoForm, title='Upload Data')

# Checks to see if user input with those attributes already exists. If it does, then 
# get that userInputId and return it. Else Create a userInputId with those attributes
# and then its ID back to the caller
def getUserInput(form, jobIDArg):
    userInputID = User_Input.query.filter_by(yearsWorking=form.yearsWorking.data, yearsAtCompany=form.yearsAtCompany.data,
            salary=form.salary.data, negotiated=form.negotiated.data, country=form.inputCountry.data, 
            state=form.inputState.data, companyCountry=form.companyCountry.data,companyState=form.companyState.data,
            companyName=form.companyName.data, jobID=jobIDArg).first()
    if (not userInputID):
        userInputObj = User_Input(yearsWorking=form.yearsWorking.data, yearsAtCompany=form.yearsAtCompany.data,
            salary=form.salary.data, negotiated=form.negotiated.data, country=form.inputCountry.data, 
            state=form.inputState.data, companyCountry=form.companyCountry.data,companyState=form.companyState.data,
            companyName=form.companyName.data, jobID=jobIDArg)
        db.session.add(userInputObj)
        db.session.commit()
    userInputID = User_Input.query.filter_by(yearsWorking=form.yearsWorking.data, yearsAtCompany=form.yearsAtCompany.data,
            salary=form.salary.data, negotiated=form.negotiated.data, country=form.inputCountry.data, 
            state=form.inputState.data, companyCountry=form.companyCountry.data,companyState=form.companyState.data,
            companyName=form.companyName.data, jobID=jobIDArg).first().inputID
    return userInputID

# Checks to see if job with attributes already exists. If it does, it gets it's jobId.
# else if job doesn't exist, then it creates the job and pushes it to DB. Then returns
# this new tuple's jobID
def getJobTuple(form):
    jobObject = Job.query.filter_by(name=form.jobPosition.data, level=form.jobLevel.data,
                commitment=form.jobCommitment.data, shiftTime=form.shiftTime.data,
                locationType=form.locationType.data, field=form.jobField.data).first()
    if (not jobObject):
        jobObject= Job(name=form.jobPosition.data, level=form.jobLevel.data,
                commitment=form.jobCommitment.data, shiftTime=form.shiftTime.data,
                locationType=form.locationType.data, field=form.jobField.data)
        db.session.add(jobObject)
        db.session.commit()
    jobObject = Job.query.filter_by(name=form.jobPosition.data, level=form.jobLevel.data,
                commitment=form.jobCommitment.data, shiftTime=form.shiftTime.data,
                locationType=form.locationType.data, field=form.jobField.data).first().jobID
    return jobObject

# Verify whether location referenced in form exists in location table. If it doesnt
# then create it
def locationVerification(form):
    # For Insert Company forms
    if (isinstance(form, InsertCompanyForm)):
        locationQuery = Location.query.filter_by(country=form.country.data, 
                        state=form.state.data).first()
        if (not locationQuery):
            locationQuery = Location(country=form.country.data, 
                        state=form.state.data)
            db.session.add(locationQuery)
            db.session.commit()
    
    # For User Information form
    if (isinstance(form, ReportUserInformationForm)):
        userlocationQuery = Location.query.filter_by(country=form.inputCountry.data, 
                        state=form.inputState.data).first()
        if (not userlocationQuery):
            userlocationQuery = Location(country=form.inputCountry.data, 
                        state=form.inputState.data)
            db.session.add(userlocationQuery)
            db.session.commit()


@app.route('/searchDatabase', methods=['GET', 'POST'])
def searchDatabase():
    jobBasedQuery = []
    companyBasedQuery = []
    fieldBasedQuery = []
    locationBasedQuery = []
    # General query for general view
    generalQuery = db.session.query(User_Entry.entryID, 
                                    User_Input.companyName.label("companyName"),
                                    User_Input.companyCountry.label("companyCountry"), 
                                    User_Input.companyState.label("companyState"), 
                                    Job.name.label("jobName"), 
                                    User_Input.country.label("userCountry"), 
                                    User_Input.state.label("userState"), 
                                    User_Input.salary).\
                            select_from(User_Entry).\
                            join(User_Input, User_Entry.userInputID == User_Input.inputID).\
                            join(Company, User_Input.companyName == Company.name and \
                                User_Input.companyCountry == Company.country and \
                                User_Input.companyState == Company.state).\
                            join(Job, User_Input.jobID == Job.jobID).order_by(User_Entry.entryID).all()
    
    companyFilterForm = SearchUsingCompany()
    jobFilterForm = SearchUsingJob()
    fieldFilterForm = SearchUsingField()
    locationFilterForm = SearchUsingLocation()
    # All form validation
    if jobFilterForm.submit1.data and jobFilterForm.validate_on_submit():
        jobQuery = Job.query.filter_by(name=jobFilterForm.jobName.data).first()
        if (not jobQuery):
            flash(f'Unfortunetly, no entries for that job exist', 'danger')
            return redirect(url_for('searchDatabase'))
        flash(f'Job entries with your requirements displayed. Please use drop down to view the entries!', 'success')
        jobBasedQuery = db.session.query(User_Entry.entryID,
                                    Job.name.label("jobName"),
                                    Job.level.label("jobLevel"),
                                    User_Input.companyName.label("companyName"),
                                    User_Input.companyCountry.label("companyCountry"), 
                                    User_Input.companyState.label("companyState"), 
                                    User_Input.country.label("userCountry"), 
                                    User_Input.state.label("userState"), 
                                    User_Input.salary).\
                            select_from(User_Entry).\
                            join(User_Input, User_Entry.userInputID == User_Input.inputID).\
                            join(Company, User_Input.companyName == Company.name and \
                                User_Input.companyCountry == Company.country and \
                                User_Input.companyState == Company.state).\
                            join(Job, User_Input.jobID == Job.jobID).where(Job.name == jobFilterForm.jobName.data).distinct(User_Entry.entryID).order_by(Job.name).all()
        return render_template('searchDatabase.html', jobQueryForm=jobFilterForm,
                            companyQueryForm=companyFilterForm, fieldQueryForm=fieldFilterForm,
                            locationQueryForm=locationFilterForm, title='Search Database', generalQuery=generalQuery,
                            jobBasedQuery=jobBasedQuery, companyBasedQuery=companyBasedQuery, fieldBasedQuery=fieldBasedQuery
                            , locationBasedQuery=locationBasedQuery)
        

    if companyFilterForm.submit2.data and companyFilterForm.validate_on_submit():
        companyQuery = Company.query.filter_by(name=companyFilterForm.name.data,
                                        country=companyFilterForm.companyCountry.data,
                                        state=companyFilterForm.companyState.data).first()
        if (not companyQuery):
            flash(f'Unfortunetly, no entries for that company exist', 'danger')
            return redirect(url_for('searchDatabase'))
        companyBasedQuery = db.session.query(User_Entry.entryID, 
                                    User_Input.companyName.label("companyName"),
                                    User_Input.companyCountry.label("companyCountry"), 
                                    User_Input.companyState.label("companyState"),  
                                    User_Input.country.label("userCountry"), 
                                    User_Input.state.label("userState"), 
                                    Job.name.label("jobName"),
                                    User_Input.salary).\
                            select_from(User_Entry).\
                            join(User_Input, User_Entry.userInputID == User_Input.inputID).\
                            join(Company, User_Input.companyName == Company.name and \
                                User_Input.companyCountry == Company.country and \
                                User_Input.companyState == Company.state).\
                            join(Job, User_Input.jobID == Job.jobID).where(Company.name==companyFilterForm.name.data,\
                                Company.country==companyFilterForm.companyCountry.data,\
                                Company.state==companyFilterForm.companyState.data).distinct(User_Entry.entryID).order_by(User_Input.companyName).all()
        flash(f'Company entries with your requirements displayed. Please use drop down to view the entries!', 'success')
        return render_template('searchDatabase.html', jobQueryForm=jobFilterForm,
                            companyQueryForm=companyFilterForm, fieldQueryForm=fieldFilterForm,
                            locationQueryForm=locationFilterForm, title='Search Database', generalQuery=generalQuery,
                            jobBasedQuery=jobBasedQuery, companyBasedQuery=companyBasedQuery, fieldBasedQuery=fieldBasedQuery
                            , locationBasedQuery=locationBasedQuery)
    
    if fieldFilterForm.submit3.data and fieldFilterForm.validate_on_submit():
        fieldQuery = Field.query.filter_by(name=fieldFilterForm.fieldName.data).first()
        if (not fieldQuery):
            flash(f'Unfortunetly, no entries for that field exist', 'danger')
            return redirect(url_for('searchDatabase'))
        fieldBasedQuery = db.session.query(User_Entry.entryID, 
                                    Job.field.label("fieldName"),
                                    User_Input.companyName.label("companyName"),
                                    User_Input.companyCountry.label("companyCountry"), 
                                    User_Input.companyState.label("companyState"),  
                                    Job.name.label("jobName"),
                                    User_Input.salary).\
                            select_from(User_Entry).\
                            join(User_Input, User_Entry.userInputID == User_Input.inputID).\
                            join(Company, User_Input.companyName == Company.name and \
                                User_Input.companyCountry == Company.country and \
                                User_Input.companyState == Company.state).\
                            join(Job, User_Input.jobID == Job.jobID).\
                            join(Field, Field.name == Job.field).\
                            filter(Field.name==fieldFilterForm.fieldName.data).distinct(User_Entry.entryID).order_by(Job.name).all()
        flash(f'Job entries in your selected field are displayed. Please use drop down to view the entries!', 'success')
        return render_template('searchDatabase.html', jobQueryForm=jobFilterForm,
                            companyQueryForm=companyFilterForm, fieldQueryForm=fieldFilterForm,
                            locationQueryForm=locationFilterForm, title='Search Database', generalQuery=generalQuery,
                            jobBasedQuery=jobBasedQuery, companyBasedQuery=companyBasedQuery, fieldBasedQuery=fieldBasedQuery
                            , locationBasedQuery=locationBasedQuery)
    
    if locationFilterForm.submit4.data and locationFilterForm.validate_on_submit():
        locationQuery = Company.query.filter_by(country=locationFilterForm.country.data,
                                        state=locationFilterForm.state.data).first()
        if (not locationQuery):
            flash(f'Unfortunetly, no entries for that location exist', 'danger')
            return redirect(url_for('searchDatabase'))
        locationBasedQuery = db.session.query(User_Entry.entryID, 
                                    User_Input.companyName.label("companyName"),
                                    User_Input.companyCountry.label("companyCountry"), 
                                    User_Input.companyState.label("companyState"), 
                                    User_Input.country.label("userCountry"), 
                                    User_Input.state.label("userState"), 
                                    Job.name.label("jobName"),
                                    User_Input.salary).\
                            select_from(User_Entry).\
                            join(User_Input, User_Entry.userInputID == User_Input.inputID).\
                            join(Company, User_Input.companyName == Company.name and \
                                User_Input.companyCountry == Company.country and \
                                User_Input.companyState == Company.state).\
                            join(Job, User_Input.jobID == Job.jobID).\
                            join(Location, User_Input.country==Location.country and User_Input.state==Location.state).\
                            filter(User_Input.country==locationFilterForm.country.data, \
                                User_Input.state==locationFilterForm.state.data).distinct(User_Entry.entryID).order_by(Job.name).all()
        flash(f'Job entries at your selected location are displayed. Please use drop down to view the entries!', 'success')
        return render_template('searchDatabase.html', jobQueryForm=jobFilterForm,
                            companyQueryForm=companyFilterForm, fieldQueryForm=fieldFilterForm,
                            locationQueryForm=locationFilterForm, title='Search Database', generalQuery=generalQuery,
                            jobBasedQuery=jobBasedQuery, companyBasedQuery=companyBasedQuery, fieldBasedQuery=fieldBasedQuery
                            , locationBasedQuery=locationBasedQuery)

    return render_template('searchDatabase.html', jobQueryForm=jobFilterForm,
                            companyQueryForm=companyFilterForm, fieldQueryForm=fieldFilterForm,
                            locationQueryForm=locationFilterForm, title='Search Database', generalQuery=generalQuery,
                            jobBasedQuery=jobBasedQuery, companyBasedQuery=companyBasedQuery, fieldBasedQuery=fieldBasedQuery
                            , locationBasedQuery=locationBasedQuery)

@app.route('/aboutUs')
def aboutUs(): 
    return render_template('aboutUs.html')