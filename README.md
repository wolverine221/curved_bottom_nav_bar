# Curved Bottom Nav Bar

A beautiful and customizable curved bottom navigation bar with a floating selected icon animation for Flutter applications.

![Demo](https://via.placeholder.com/800x200.png?text=Curved+Bottom+Nav+Bar+Demo)

## Features

✨ Beautiful curved design with floating selected icon  
🎨 Fully customizable colors and styles  
🔄 Smooth animations  
📱 Responsive design with flutter_screenutil  
🎯 Support for Icons, Image Assets, and Custom Widgets  
⚡ Easy to implement  

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  curved_bottom_nav_bar: ^1.0.0
```

Or install it from your local path:

```yaml
dependencies:
  curved_bottom_nav_bar:
    path: ../curved_bottom_nav_bar
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Example

```dart
import 'package:flutter/material.dart';
import 'package:curved_bottom_nav_bar/curved_bottom_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<NavBarItem> _items = [
    NavBarItem(
      icon: Icons.home,
      label: 'Home',
    ),
    NavBarItem(
      icon: Icons.search,
      label: 'Search',
    ),
    NavBarItem(
      icon: Icons.person,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: CurvedBottomNavBar(
        items: _items,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return Center(child: Text('Home Page'));
      case 1:
        return Center(child: Text('Search Page'));
      case 2:
        return Center(child: Text('Profile Page'));
      default:
        return Container();
    }
  }
}
```

### Using Asset Images

```dart
final List<NavBarItem> _items = [
  NavBarItem(
    icon: 'assets/icons/home.png',
    label: 'Home',
  ),
  NavBarItem(
    icon: 'assets/icons/search.png',
    label: 'Search',
  ),
  NavBarItem(
    icon: 'assets/icons/profile.png',
    label: 'Profile',
  ),
];
```

### Customization

```dart
CurvedBottomNavBar(
  items: _items,
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  backgroundColor: Colors.white,
  selectedColor: Colors.blue,
  selectedSecondaryColor: Colors.blueAccent,
  unselectedColor: Colors.grey,
  shadowColor: Colors.black26,
  height: 80,
  floatingButtonSize: 65,
  iconSize: 26,
  curveDepth: 40,
  animationDuration: Duration(milliseconds: 400),
  labelTextStyle: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  selectedLabelTextStyle: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  ),
)
```

### Using Custom Widgets

```dart
final List<NavBarItem> _items = [
  NavBarItem(
    icon: Icons.home,
    label: 'Home',
    customIcon: Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.home, color: Colors.white),
    ),
  ),
  // ... more items
];
```

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `items` | `List<NavBarItem>` | **Required** | List of navigation items (2-5 items) |
| `currentIndex` | `int` | **Required** | Currently selected index |
| `onTap` | `Function(int)` | **Required** | Callback when item is tapped |
| `backgroundColor` | `Color?` | `theme.cardColor` | Background color of nav bar |
| `selectedColor` | `Color?` | `theme.primaryColor` | Color of selected item |
| `selectedSecondaryColor` | `Color?` | `theme.primaryColor` | Secondary color for gradient |
| `unselectedColor` | `Color?` | `theme.disabledColor` | Color of unselected items |
| `shadowColor` | `Color?` | `Colors.black12` | Shadow color |
| `height` | `double?` | `75.h` | Height of nav bar |
| `floatingButtonSize` | `double?` | `60.w` | Size of floating button |
| `iconSize` | `double?` | `24.h` | Size of icons |
| `curveDepth` | `double?` | `35.0` | Depth of the curve |
| `animationDuration` | `Duration?` | `300ms` | Animation duration |
| `labelTextStyle` | `TextStyle?` | Auto | Style for labels |
| `selectedLabelTextStyle` | `TextStyle?` | Auto | Style for selected label |

## NavBarItem Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `icon` | `dynamic` | Yes | IconData, String (asset path), or Widget |
| `label` | `String` | Yes | Label text for the item |
| `customIcon` | `Widget?` | No | Custom widget to use instead of default icon |

## Requirements

- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0
- flutter_screenutil: ^5.9.0

## License

MIT License - see LICENSE file for details

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Author

Your Name - [@yourusername](https://github.com/yourusername)

## Support

If you like this package, please give it a ⭐ on [GitHub](https://github.com/yourusername/curved_bottom_nav_bar)!
