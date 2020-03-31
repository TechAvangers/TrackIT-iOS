TrackIT
---
Open source native cross-platform mobile application for tracking infections in communities.

<p align = "center">

<img src="https://github.com/TechAvangers/TrackIT-iOS/blob/master/github/1.gif" width="200" height="400" />
<img src="https://github.com/TechAvangers/TrackIT-iOS/blob/master/github/2.gif" width="200" height="400" />


</p>

- [TrackIT](#trackit)
- [Scenario](#scenario)
- [Functionalities](#functionalities)
  * [App functions](#app-functions)
  * [Scanning for devices](#scanning-for-devices)
  * [Emitting service](#emitting-service)
  * [Background syncing](#background-syncing)
- [Stack used](#stack-used)
  * [Libraries used:](#libraries-used)
  * [Programming language](#programming-language)
- [Team](#team)
- [Buy us coffe](#buy-us-coffe)

```Certain development in project, reveal that this is not implementable in scale that we hoped, till the further notice, this project is postponed.```

## Scenario

First of all, we should do at this time is social distancing, but we can't survive without food so we have to expose ourselves to some degree to get groceries among other essentials.


Going to market in these times poses a risk of getting in close contact with someone who can be infected.	Going to a public place in these times poses a risk of getting in close contact with someone who can be infected.
To track proximity connections we can use TrackIT app. When you are grocery shopping app is constantly scanning your environment and stores other devices information to your local database so you don't have to be using data plans. 	To track proximity connections we can use TrackIT app. When you are grocery shopping, turn on the app and it will constantly be scanning your environment and stores other devices information to your local database so you don't have to be using celular data. 


Another person uses an android version of TrackIT too, and it's located at the same place as you are.	Anyone can use TarckIT including android users.
Your device is advertising itself the whole time you are scanning so this other user can record your device as well.	Your device is advertising itself the whole time you are scanning so this other user can record your device as well.


After you connect to the internet ( ```keep in mind that app should at least be in the background not closed```) app connects to a server and syncs your stored sessions.	After you connect to the internet ( ```keep in mind that app should at least be in the background not closed```) app connects to a server and syncs your stored sessions.


Some days later, you have received notification that is stating that you have been in close proximity with someone who has tested **positive** for COVID-19.	Some days later, you have received notification that is stating that you have been in close proximity with someone who has tested **positive** for COVID-19.


Your direct order is to self-quarantine and reports your symptoms trough your government suggested channel.	if you receive such a notification it is a good idea to self-quarantine and report your symptoms trough your government suggested channel.

Functionalities
---
TrackIT mobile app utilizes Bluetooth capability of the device and tracks infections in the community. 
<br>
When application opens the app it utilizes two features simultaneously:

- Creating BLE service and assigning new UUID and saving every service to a local database 
- Start scanning environment for all Bluetooth devices and saving all their data to a local database

### <b>App functions</b>

App functions are divided into two separate parts:
- First part is in charge of ``` scanning for other devices ```
- The second part is in charge of ``` maintaining runnable service ```

### Scanning for devices

TrackIT uses Bluetooth to scan your environment. ``` App must be in the foreground for scanning to be effective because of Apple background policy ```.

The app is built to recognize states of Bluetooth on the device, where most important states are ```.unknown``` ```.on``` ```.off```.

App scans and stores every scanned device and prepares it for syncing with a server.
<br>
All scanned devices that are stored can be seen under ``` Tracked devices ``` segment in ``` Devices ``` tab.

App stores devices:
- name
- uuid
- rssi 
- timestamp ``` yyyy-mm-dd HH:mm:ss ```

Syncing with the server is done automatically in the background as soon as the user connects to the internet. If syncing was not done application will send alert to the user requiring manual sync.

### Emitting service 

Emitting or advertising service is used for a device to advertise itself as peripheral. 
<br>
Advertising device as a peripheral is important because it enables other devices to scan and store UUID of the advertised peripheral.

The flow of starting the service:
- generating UUID
- advertising it to the environment with unique name and UUID
- storing service to a local database

Every stored service can be seen under ``` My devices ``` segment in ```Devices ``` tab.

App stores services ``` generatedID ``` to a local database.

### Background syncing 
```server in development```

The app will sync with the server when it stays in the background. The app can't sync with the server if it was terminated by the user itself.
<br>
For further use of the app, syncing is required.

## Stack used

Application is light-weight because of a limited number of libraries that are used in development. 
<br>
We strived to achieve as many as possible without requiring an external library.
<br><br>
This project has been completely free of CocoaPods and every library was implemented trough Swift Package manager to ensure greater stability.
<br><br>

User interface stability has been achieved mostly using a storyboard.
App user interface follows ``` Human interface guidelines ```

### Libraries used: 
- Lottie ```pulsing animation```
- Realm ```local database storing```
- CoreBluetooth ```Apple built-in framework ```

### Programming language

Project was written in ```Swift 5```.

## Team

![](https://avatars1.githubusercontent.com/u/24845593?s=150&v=4)    |   ![](https://avatars3.githubusercontent.com/u/55641247?s=150&v=4)
:-------------------------:|:-------------------------:
[nedimf](https://github.com/nedimf) | [2020Nonprofit](https://github.com/2020Nonprofit)

## Buy us coffee

We have invested a lot time in building this app and implementing new features to it, so we would really appricate if you would take moment and
<br><br>
<a href="https://www.buymeacoffee.com/nedimf" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" width="150" height="30" ></a>

#### MIT License
```
Copyright (c) 2020 TechAvangers

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
