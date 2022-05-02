# SRPlayer
A music player made for iOS devices using SwiftUI.

### Features
- Designed using MVVM pattern
- Uses custom Tabbar
- Swipable action in player

### Tools used
- XCode 13.2.1
- Swift 5.5
- SwiftUI

### Explanation
The data of songs is stored in local `songs.json` file. It is parsed to create List in Home tab. The design pattern followed is MVVM (Model-View-ViewModel). A global kind of `PlayerViewModel` class is there which manages the state related player view. A custom tabbar is used instead of built-in `TabView`.
