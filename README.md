# AQI Detector

AQI Detector is an interesting IOS application that can help the user to know the real-time AQI at the user's location. User can simply takes a picture to the sky using IOS devices and then upload the picture to the server. At the server side, the relative program will process the picture and uses a SVM algorithm to differentiate the sky area from the rest part and then infer the air quality index(AQI) from the RGB values of the sky area by a pre-trained linear regression model. After finishing the calculation, the server will return the result to the user and the user can know the AQI on the device's screen.

Environments:
-------------
This project was originally developed under the environment:
 * The AQI algorithm is developed under windows 7 and pycharm, using python to develop.
 * The application on IOS is developed using swift3, supporting IOS 10 and various of IOS devices.
 * The environments of the server are Debian GNU/Linux 7 and Apache 2.4.23.
 
Demo:
-------------
The following picture illustrate the procedure that a user takes a picture to the sky, upload the picture and then obtain the AQI result.
![](https://github.com/Zihua-Liu/AQI-Detector/blob/master/Demo/Picture1.jpg)
![](https://github.com/Zihua-Liu/AQI-Detector/blob/master/Demo/Picture1.jpg)
![](https://github.com/Zihua-Liu/AQI-Detector/blob/master/Demo/Picture1.jpg)
