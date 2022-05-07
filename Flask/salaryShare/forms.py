from flask_wtf import FlaskForm
from salaryShare import db
from salaryShare.models import Field, Location
from wtforms import StringField, SubmitField, IntegerField, SelectField
from wtforms.validators import Length, DataRequired

#-----------------------------------------Upload Data Page

class InsertCompanyForm(FlaskForm):
    name = StringField('Company Name*', validators=[DataRequired(), Length(max=60)])
    country = StringField('Company Country*', validators=[DataRequired(), Length(max=50)])
    state = StringField('Company State*', validators=[DataRequired(), Length(max=50)])
    STANDING_CHOICES = [(''), ('Corporate'), ('Public'), ('Private'), ('Non-profit')]
    standing = SelectField('Company Standing', choices=STANDING_CHOICES)
    field = StringField('Company Field*', validators=[DataRequired(), Length(max=50)])
    submit = SubmitField('Upload Company Info!')

    def validate_field(self, field):
        fieldQuery = Field.query.filter_by(name=field.data).first()
        if (not fieldQuery):
            fieldQuery = Field(name=field.data)
            db.session.add(fieldQuery)
            db.session.commit()


class ReportUserInformationForm(FlaskForm):
    jobPosition = StringField('Job Position*', validators=[DataRequired(), Length(max=50)])
    jobLevel = StringField('Job Level', validators=[Length(max=50)])
    jobField = StringField('Job Field', validators=[DataRequired(), Length(max=50)])
    salary = IntegerField('Salary*', validators=[DataRequired()])
    JOB_COMMITMENT_CHOICES = [(''), ('Part-Time'), ('Full-time')]
    jobCommitment = SelectField('Job Commitment', choices=JOB_COMMITMENT_CHOICES)
    NEGOTIATED_CHOICES = [(''), ('No'), ('Yes')]
    negotiated = SelectField('Negotiated for Salary?', choices=NEGOTIATED_CHOICES)
    SHIFT_TIME_CHOICES = [(''), ('Day'), ('Night')] 
    shiftTime = SelectField('Shift Time', choices=SHIFT_TIME_CHOICES)
    inputCountry = StringField('What Country do you work in?*', validators=[DataRequired(), Length(max=50)])
    inputState = StringField('What State do you work in?*', validators=[DataRequired(), Length(max=50)])
    LOCATION_TYPE_CHOICES = [(''), ('On-site'), ('Remote'), ('Hybrid')]
    locationType = SelectField('Location Type', choices=LOCATION_TYPE_CHOICES)
    yearsWorking = IntegerField('Years Working*', validators=[DataRequired()])
    yearsAtCompany = IntegerField('Years At Company*', validators=[DataRequired()])
    companyName = StringField('Employer Name*', validators=[DataRequired(), Length(max=60)])
    companyCountry = StringField('Employer\'s HQ Country*', validators=[DataRequired(), Length(max=50)])
    companyState = StringField('Employer\'s HQ State*', validators=[DataRequired(), Length(max=50)])
    submit = SubmitField('Report your info!')

    def validate_jobField(self, jobField):
        fieldQuery = Field.query.filter_by(name=jobField.data).first()
        if (not fieldQuery):
            fieldQuery = Field(name=jobField.data)
            db.session.add(fieldQuery)
            db.session.commit()

#-----------------------------------------Search Database Page

class SearchUsingJob(FlaskForm):
    jobName = StringField('Search all Entries for a Job', validators=[DataRequired(), Length(max=50)])
    submit1 = SubmitField('Search')

class SearchUsingCompany(FlaskForm):
    name = StringField('Company Name', validators=[DataRequired(), Length(max=60)])
    companyCountry = StringField('Company Country', validators=[DataRequired(), Length(max=50)])
    companyState = StringField('Company State', validators=[DataRequired(), Length(max=50)])
    submit2 = SubmitField('Search')

class SearchUsingField(FlaskForm):
    fieldName = StringField('Search all Entries for a Field', validators=[DataRequired(), Length(max=50)])
    submit3 = SubmitField('Search')

class SearchUsingLocation(FlaskForm):
    country = StringField('Search all entries for Country', validators=[DataRequired(), Length(max=50)])
    state = StringField('Search all entries for State', validators=[DataRequired(), Length(max=50)])
    submit4 = SubmitField('Search')