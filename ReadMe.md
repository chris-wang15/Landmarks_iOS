## About This App
This App can display well-known landmarks. Users can sort landmarks with categories and get their location. As we all know, the biggest difficulty in learning iOS development is to have a new macbook. This App is programmed by XCode 11.0, swift_UI version is relatively old, so instead of AsyncImage, local images are used directly.

## Tech Stack
Swft + SwiftUI

## Screen Shots
<img width="419" alt="screen-1" src="https://github.com/chris-wang15/Landmarks_iOS/assets/128122102/a34c8b6c-bba7-4c93-ab87-fb1ab49072d5">

<img width="395" alt="screen-2" src="https://github.com/chris-wang15/Landmarks_iOS/assets/128122102/efd0cc04-7787-4026-b281-bf6be7414ef6">

<img width="412" alt="screen-3" src="https://github.com/chris-wang15/Landmarks_iOS/assets/128122102/b1921e31-13a9-43e3-8886-7c9213cd21b1">


## Network Request
Please use the json file in the project root path as the net response.

- How to mock network server
Setp1: Create a new folder and put data files inside it.
Setp2: Open terminal and input following commands:
$ cd ~/XXXDataFolder
$ python -m SimpleHTTPServer
Setp3: Open browser and input following website
Open http://localhost:8000/response.json
