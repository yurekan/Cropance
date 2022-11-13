from flask import Flask , request , jsonify
import joblib
import pandas as pd
from flask.templating import render_template 
import pickle
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

    model = keras.models.load_model('Crop_Model.h5')
    prediction=model.predict(data)
    return jsonify({'prediction': str(prediction)}) 

if __name__ == '__main__':
    app.run()