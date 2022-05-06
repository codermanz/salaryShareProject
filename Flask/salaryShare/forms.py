from logging import PlaceHolder
from flask_wtf import FlaskForm
import salaryShare
from wtforms import StringField, SubmitField, IntegerField, SelectField, TextAreaField
from wtforms.validators import Length, DataRequired, EqualTo, ValidationError

#-----------------------------------------Upload Data Page

class InsertCompanyForm(FlaskForm):
    name = StringField('Company Name*', validators=[DataRequired(), Length(max=60)])
    country = StringField('Company Country*', validators=[DataRequired(), Length(max=50)])
    state = StringField('Company State*', validators=[DataRequired(), Length(max=50)])
    standing = StringField('Company Standing', validators=[DataRequired(), Length(max=50)])
    field = StringField('Company Field*', validators=[DataRequired(), Length(max=50)])
    submit = SubmitField('Upload Company Info!')

    #def validate_field(self, field):

class ReportUserInformationForm(FlaskForm):
    jobPosition = StringField('Job Position*', validators=[DataRequired(), Length(max=50)])
    jobLevel = StringField('Job Level', validators=[Length(max=50)])
    jobField = StringField('Job Field', validators=[DataRequired(), Length(max=50)])
    salary = IntegerField('Salary*', validators=[DataRequired()])
    JOB_COMMITMENT_CHOICES = [('1', 'Part-Time'), ('2', 'Full-time')]
    jobCommitment = SelectField('Job Commitment', choices=JOB_COMMITMENT_CHOICES)
    NEGOTIATED_CHOICES = [('1', 'No'), ('2', 'Yes')]
    negotiated = SelectField('Negotiated for Salary?', choices=NEGOTIATED_CHOICES)
    SHIFT_TIME_CHOICES = [('1', 'Day'), ('2', 'Night')] 
    shiftTime = SelectField('Shift Time', choices=SHIFT_TIME_CHOICES)
    inputCountry = StringField('What Country do you work in?*', validators=[DataRequired(), Length(max=50)])
    inputState = StringField('What State do you work in?*', validators=[DataRequired(), Length(max=50)])
    LOCATION_TYPE_CHOICES = [('1', 'In-person'), ('2', 'Remote'), ('3', 'Hybrid')]
    locationType = SelectField('Location Type', choices=LOCATION_TYPE_CHOICES)
    yearsWorking = IntegerField('Years Working*', validators=[DataRequired()])
    yearsAtCompany = IntegerField('Years At Company*', validators=[DataRequired()])
    companyName = StringField('Employer Name*', validators=[DataRequired(), Length(max=60)])
    companyCountry = StringField('Employer\'s HQ Country*', validators=[DataRequired(), Length(max=50)])
    companyState = StringField('Employer\'s HQ State*', validators=[DataRequired(), Length(max=50)])


#-----------------------------------------Search Database Page

class SearchUsingJob(FlaskForm):
    jobName = StringField('Search all Entries for a Job', validators=[DataRequired(), Length(max=50)])

class SearchUsingCompany(FlaskForm):
    name = StringField('Company Name', validators=[DataRequired(), Length(max=60)])
    country = StringField('Company Country', validators=[DataRequired(), Length(max=50)])
    state = StringField('Company State', validators=[DataRequired(), Length(max=50)])

class SearchUsingField(FlaskForm):
    fieldName = StringField('Search all Entries for a Field', validators=[DataRequired(), Length(max=50)])

class SearchUsingLocation(FlaskForm):
    country = StringField('Search all entries for Country', validators=[DataRequired(), Length(max=50)])
    state = StringField('Search all entries for State', validators=[DataRequired(), Length(max=50)])
    