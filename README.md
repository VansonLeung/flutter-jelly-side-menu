# flutter_jellysidemenu

A side menu that animates like a jelly!

It is a Flutter equivalent of one of my React Native showcase demo `react-native-jelly-side-menu`
- https://github.com/VansonLeung/react-native-jelly-side-menu


## Demo Showcase



https://github.com/VansonLeung/flutter-jelly-side-menu/assets/1129695/9d64a878-857f-4704-854c-d27c36a52649


## Prerequisites
  - dart sdk: '>=2.17.0 <4.0.0'
  - flutter: ">=1.17.0"

## Installation

Add to pubspec.yaml: 
```yaml
flutter_jellysidemenu: ^1.0.0
```

## Usage

```dart
import JellySideMenu from 'react-native-jelly-side-menu'

...
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [

          JellySideMenu(
            controller: jellySideMenuSvgController,
            width: width,
            height: height,
            child: ...   // place your own side menu widgets here
          ),

        ]
      ),
    );
  }
}

```



### Milestones
```
☐ Toggle via controller function support
☐ Add Essential control parameters support (enable/disable menu, enable/disable gesture, set default state)
☐ Add Callback support (onWillOpen(state), onDidOpen(state), onWillClose(state), onDidClose(state))
☐ Add Menu State check function (getState() => State)
☐ Add Fine tune control parameters support (thresholds of dragging, menu width, bounce tension & friction)
☐ Add Side menu docking direction support (top, left, right, bottom)
☐ Cater device orientation change
☐ Performance improvement
