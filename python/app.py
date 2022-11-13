from flask import Flask , request , jsonify
import joblib
import pandas as pd
from flask.templating import render_template 
import pickle
import numpy as np
# from pydantic import BaseModel
import keras
# from keras.models import load_model


app = Flask(__name__)

@app.route('/')
def index():
    return ("Hello World")

@app.route('/predict/', methods=['GET'])
def predict():
    result=request.args
    data=[[
        float(result["nitrogen"]),
        float(result["phosphorus"]),
        float(result["potassium"]),
        float(result["temperature"]),
        float(result["humidity"]),
        float(result['ph']),
        float(result['rainfall'])
    ]]

    data = np.asarray(data);

    model = joblib.load('crop_predict_model.sav')
    prediction=model.predict(data)
    return jsonify({'prediction': str(prediction)}) 

if __name__ == '__main__':
    app.run()