**EV Enhance iOS**

This project is built during a hackathon - Hackomania 2024.

The iOS application is written in Swift and serves as the front-end facing application which interacts with the [backend services ](https://github.com/carsontham/ev-enhance) API.
The goal of this project is tackle the problem statement of enhancing EV charging experience. 

EV Enhance aims to create an API-centric app that allows for a one-stop platform for all the different major EV companies. 
The MVP aims to onboard all EV Partners and interface them to one platform.

**To run the iOS app:**
```
Download ios-ev-enhance.xcodeproj and run the app on iPhone 12 emulator.
```

**To run backend service - Download the backend repo [here](https://github.com/carsontham/ev-enhance).**

Run the following command to migrate data which spins up a postgresql container:
```
make start-and-migrate
```
To run the backend service:
```
make server  
```

