from flask import Flask
from flaskext.mysql import MySQL
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SECRET_KEY'] = 'f3a808d584825d307bc273994e347085'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:786CanadA@localhost/testFlaskDB'
db = SQLAlchemy(app)

mySQL = MySQL()
mySQL.init_app(app)

from salaryShare import routes