from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://June:Covid19*@covid19-readiness.cwom5umbekrh.us-west-1.rds.amazonaws.com/Combined_gps.csv'
db = SQLAlchemy(app)

