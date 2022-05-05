from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, BooleanField, TextAreaField
from wtforms.validators import Length, DataRequired, EqualTo, ValidationError

class InsertCompanyForm(FlaskForm):
    name = StringField('Company Name', validators=[DataRequired(), Length(max=60)])
    country = StringField('Company Name', validators=[DataRequired(), Length(max=50)])
    state = StringField('Company Name', validators=[DataRequired(), Length(max=50)])
    standing = StringField('Company Name', validators=[DataRequired(), Length(max=50)])
    field = StringField('Company Name', validators=[DataRequired(), Length(max=50)])
    submit = SubmitField('Insert Company')

    #def validate_location(self, country, state):
    
    #def validate_field(self, field):

    #def validate_already_existing(self, name, country, state):
