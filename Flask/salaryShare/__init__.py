from flask import Flask

app = Flask(__name__)
app.config['SECRET_KEY'] = 'f3a808d584825d307bc273994e347085'

from salaryShare import routes