# Mobile AQI Detector

User takes a picture of the sky on iOS clients and send it to the server. After receiving the picture, the server uses support vector machine(SVM) algorithm to differentiate the sky area from the rest part and then infer the air quality index(AQI) from the RGB values of the sky area by a pre-trained linear regression model. Finally, the server returns the estimated AQI to the clients.

Requirements:
-------------
This project was originally developed under the environment:
 * Windows 7 + pycharm
 * iOS 10 + swift 3
 * Debian GNU/Linux 7 + Apache 2.4.23