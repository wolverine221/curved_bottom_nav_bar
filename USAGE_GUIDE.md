# Usage Guide

## Installation

### Option 1: From Local Path (Development)

Add to your `pubspec.yaml`:

```yaml
dependencies:
  curved_bottom_nav_bar:
    path: ../curved_bottom_nav_bar
```

### Option 2: From Git Repository

```yaml
dependencies:
  curved_bottom_nav_bar:
    git:
      url: https://github.com/yourusername/curved_bottom_nav_bar.git
      ref: main
```

### Option 3: From pub.dev (After Publishing)

```yaml
dependencies:
  curved_bottom_nav_bar: ^1.0.0
```

Then run:
```bash
flutter pub get
```

## Quick Start

### Step 1: Import the Package

```dart
import 'package:curved_bottom_nav_bar/curved_bottom_nav_bar.dart';
```

### Step 2: Create NavBarItems

```dart
final List<NavBarItem> items = [
  NavBarItem(icon: Icons.home, label: 'Home'),
  NavBarItem(icon: Icons.search, label: 'Search'),
  NavBarItem(icon: Icons.person, label: 'Profile'),
];
```

### Step 3: Add to Your Scaffold

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: _buildBody(),
    bottomNavigationBar: CurvedBottomNavBar(
      items: items,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    ),
  );
}
```

## Examples

### Example 1: Basic Implementation

```dart
import 'package:flutter/material.dart';
import 'package:curved_bottom_nav_bar/curved_bottom_nav_bar.dart';

class BasicExample extends StatefulWidget {
  @override
  _BasicExampleState createState() => _BasicExampleState();
}

class _BasicExampleState extends State<BasicExample> {
  int _currentIndex = 0;

  final items = [
    NavBarItem(icon: Icons.home, label: 'Home'),
    NavBarItem(icon: Icons.search, label: 'Search'),
    NavBarItem(icon: Icons.person, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedBottomNavBar(
        items: items,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
```

### Example 2: With Asset Images

```dart
// Add to pubspec.yaml:
// flutter:
//   assets:
//     - assets/icons/

final items = [
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

### Example 3: Custom Styling

```dart
CurvedBottomNavBar(
  items: items,
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  
  // Colors
  backgroundColor: Color(0xFF1A1A2E),
  selectedColor: Color(0xFF0F3460),
  selectedSecondaryColor: Color(0xFF16213E),
  unselectedColor: Colors.grey.shade400,
  shadowColor: Colors.black38,
  
  // Sizes
  height: 85,
  floatingButtonSize: 68,
  iconSize: 28,
  curveDepth: 42,
  
  // Animation
  animationDuration: Duration(milliseconds: 350),
  
  // Text Styles
  labelTextStyle: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  ),
  selectedLabelTextStyle: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Color(0xFF0F3460),
  ),
)
```

### Example 4: With Custom Widgets

```dart
final items = [
  NavBarItem(
    icon: Icons.home,
    label: 'Home',
    customIcon: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.lightBlue],
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.home, color: Colors.white, size: 24),
    ),
  ),
  NavBarItem(
    icon: Icons.search,
    label: 'Search',
  ),
];
```

### Example 5: Dynamic Color Changes

```dart
class DynamicColorExample extends StatefulWidget {
  @override
  _DynamicColorExampleState createState() => _DynamicColorExampleState();
}

class _DynamicColorExampleState extends State<DynamicColorExample> {
  int _currentIndex = 0;

  final List<Color> _colors = [
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedBottomNavBar(
        items: [
          NavBarItem(icon: Icons.home, label: 'Home'),
          NavBarItem(icon: Icons.search, label: 'Search'),
          NavBarItem(icon: Icons.favorite, label: 'Favorite'),
          NavBarItem(icon: Icons.person, label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedColor: _colors[_currentIndex],
        selectedSecondaryColor: _colors[_currentIndex].withOpacity(0.7),
      ),
    );
  }
}
```

### Example 6: Integration with PageView

```dart
class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: [
          HomePage(),
          SearchPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CurvedBottomNavBar(
        items: [
          NavBarItem(icon: Icons.home, label: 'Home'),
          NavBarItem(icon: Icons.search, label: 'Search'),
          NavBarItem(icon: Icons.person, label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
```

### Example 7: E-commerce App Style

```dart
final items = [
  NavBarItem(icon: Icons.home, label: 'Home'),
  NavBarItem(icon: Icons.category, label: 'Categories'),
  NavBarItem(icon: Icons.shopping_cart, label: 'Cart'),
  NavBarItem(icon: Icons.person, label: 'Account'),
];

CurvedBottomNavBar(
  items: items,
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  backgroundColor: Colors.white,
  selectedColor: Color(0xFFFF6B6B),
  selectedSecondaryColor: Color(0xFFFF8E8E),
  unselectedColor: Color(0xFF9E9E9E),
  height: 75,
  floatingButtonSize: 62,
  iconSize: 25,
)
```

## Best Practices

### 1. Initialize ScreenUtil

Always initialize `flutter_screenutil` in your main app:

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          // Your app
        );
      },
    );
  }
}
```

### 2. Use 2-5 Items

The navigation bar works best with 2 to 5 items:

```dart
// ✅ Good
final items = [
  NavBarItem(icon: Icons.home, label: 'Home'),
  NavBarItem(icon: Icons.search, label: 'Search'),
  NavBarItem(icon: Icons.person, label: 'Profile'),
];

// ❌ Too many items
final tooManyItems = [
  // 6+ items will throw an assertion error
];
```

### 3. Asset Management

When using asset images, ensure they're properly declared:

```yaml
# pubspec.yaml
flutter:
  assets:
    - assets/icons/
```

### 4. State Management

Use proper state management for production apps:

```dart
// Using Provider
class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
```

## Troubleshooting

### Issue: Icons not displaying

**Solution**: Ensure assets are declared in `pubspec.yaml` and run `flutter pub get`

### Issue: Responsive sizing issues

**Solution**: Initialize `ScreenUtilInit` properly in your app

### Issue: Animation not smooth

**Solution**: Increase `animationDuration` or check device performance

### Issue: Colors not matching theme

**Solution**: Use `Theme.of(context)` to access theme colors

## Advanced Customization

### Custom Curve Shapes

Modify `CurvedNavBarPainter` to create different curve shapes:

```dart
// Create your own painter
class MyCustomPainter extends CurvedNavBarPainter {
  // Override paint method for custom shapes
}
```

### Custom Animations

Override animation controller for different effects:

```dart
// In your state class
_animationController = AnimationController(
  vsync: this,
  duration: Duration(milliseconds: 500),
);

_animation = CurvedAnimation(
  parent: _animationController,
  curve: Curves.elasticOut, // Try different curves
);
```

## Tips

1. **Performance**: The package is optimized with `RepaintBoundary` considerations
2. **Accessibility**: Add semantic labels for better accessibility
3. **Testing**: The package includes widget tests
4. **Dark Mode**: Use theme colors for automatic dark mode support

## Support

For issues, questions, or contributions:
- GitHub: https://github.com/yourusername/curved_bottom_nav_bar
- Issues: https://github.com/yourusername/curved_bottom_nav_bar/issues
