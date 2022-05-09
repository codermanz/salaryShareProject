from flask import Flask
from flaskext.mysql import MySQL
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SECRET_KEY'] = 'f3a808d584825d307bc273994e347085'
#app.config['CLEARDB_DATABASE_URL'] = 'mysql://bdf26979b4a1ae:6bc19c7a@us-cdbr-east-05.cleardb.net/heroku_d6c2a95ae429b99?'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://bdf26979b4a1ae:6bc19c7a@us-cdbr-east-05.cleardb.net/heroku_d6c2a95ae429b99?'
db = SQLAlchemy(app)

mySQL = MySQL()
mySQL.init_app(app)

from salaryShare import routes