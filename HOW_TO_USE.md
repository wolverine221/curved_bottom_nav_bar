# How to Use This Package in Your Project

## Quick Integration Guide

### Step 1: Add Package to Your Project

#### Option A: Local Path (Recommended for Testing)

1. Copy the `curved_bottom_nav_bar` folder to your project directory
2. Your project structure should look like:
   ```
   your_project/
   ├── curved_bottom_nav_bar/  ← The package folder
   ├── lib/
   ├── pubspec.yaml
   └── ...
   ```

3. Add to your `pubspec.yaml`:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     flutter_screenutil: ^5.9.0
     curved_bottom_nav_bar:
       path: ./curved_bottom_nav_bar
   ```

#### Option B: From GitHub (After Uploading)

```yaml
dependencies:
  curved_bottom_nav_bar:
    git:
      url: https://github.com/yourusername/curved_bottom_nav_bar.git
```

### Step 2: Install Dependencies

Run in terminal:
```bash
flutter pub get
```

### Step 3: Import the Package

In your Dart file:
```dart
import 'package:curved_bottom_nav_bar/curved_bottom_nav_bar.dart';
```

### Step 4: Replace Your Existing Bottom Navigation

#### BEFORE (Your Current Code):
```dart
CustomCurvedBottomNavBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
)
```

#### AFTER (Using the Package):
```dart
CurvedBottomNavBar(
  items: [
    NavBarItem(icon: Icons.home, label: 'Home'),
    NavBarItem(icon: Icons.upload, label: 'Upload'),
    NavBarItem(icon: Icons.settings, label: 'Settings'),
  ],
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  // Optional: Add your custom colors from theme
  backgroundColor: appColor.cardBg,
  selectedColor: appColor.appPrimary,
  selectedSecondaryColor: appColor.appPrimarySecondary,
  unselectedColor: appColor.appPrimaryDarker.withOpacity(0.5),
)
```

### Step 5: For Asset Icons (Like Your Original Code)

If you're using asset images:

```dart
CurvedBottomNavBar(
  items: [
    NavBarItem(
      icon: AppIcons.movie,  // Your asset path
      label: 'Home',
    ),
    NavBarItem(
      icon: AppIcons.series,
      label: 'Upload',
    ),
    NavBarItem(
      icon: AppIcons.settings,
      label: 'Profile',
    ),
  ],
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
)
```

## Complete Example for Your Watchman App

Based on your original code, here's how to integrate:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_bottom_nav_bar/curved_bottom_nav_bar.dart';
import 'package:watchman/core/app_icons.dart';
import 'package:watchman/core/app_theme/app_colors.dart';

class YourScreen extends StatefulWidget {
  const YourScreen({super.key});

  @override
  State<YourScreen> createState() => _YourScreenState();
}

class _YourScreenState extends State<YourScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppColors appColor = theme.extension<AppColors>()!;

    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: CurvedBottomNavBar(
        items: [
          NavBarItem(
            icon: AppIcons.movie,
            label: "Home",
          ),
          NavBarItem(
            icon: AppIcons.series,
            label: "Upload",
          ),
          NavBarItem(
            icon: AppIcons.settings,
            label: "Profile",
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // Use your existing theme colors
        backgroundColor: appColor.cardBg,
        selectedColor: appColor.appPrimary,
        selectedSecondaryColor: appColor.appPrimarySecondary,
        unselectedColor: appColor.appPrimaryDarker.withOpacity(0.5),
        shadowColor: Colors.black12,
      ),
    );
  }

  Widget _buildBody() {
    // Your existing body logic
    switch (_currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return UploadScreen();
      case 2:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}
```

## Migration Checklist

- [ ] Copy package folder to your project
- [ ] Add dependency to pubspec.yaml
- [ ] Run `flutter pub get`
- [ ] Import the package
- [ ] Replace `CustomCurvedBottomNavBar` with `CurvedBottomNavBar`
- [ ] Convert your items to `NavBarItem` list
- [ ] Test the navigation
- [ ] Customize colors if needed
- [ ] Remove old widget file (optional)

## Customization Options

You can customize these properties:

```dart
CurvedBottomNavBar(
  items: items,                      // Required
  currentIndex: _currentIndex,       // Required
  onTap: (index) {},                // Required
  backgroundColor: Colors.white,     // Optional
  selectedColor: Colors.blue,        // Optional
  selectedSecondaryColor: Colors.lightBlue, // Optional
  unselectedColor: Colors.grey,      // Optional
  shadowColor: Colors.black12,       // Optional
  height: 75,                        // Optional
  floatingButtonSize: 60,            // Optional
  iconSize: 24,                      // Optional
  curveDepth: 35,                    // Optional
  animationDuration: Duration(milliseconds: 300), // Optional
  labelTextStyle: TextStyle(...),    // Optional
  selectedLabelTextStyle: TextStyle(...), // Optional
)
```

## Testing

Run the example app to see it in action:

```bash
cd curved_bottom_nav_bar/example
flutter pub get
flutter run
```

## Troubleshooting

### Error: "Package not found"
- Make sure the path in pubspec.yaml is correct
- Run `flutter pub get` again

### Error: "ScreenUtil not initialized"
- Wrap your MaterialApp with ScreenUtilInit (see example/lib/main.dart)

### Icons not showing
- Check if asset paths are correct
- Make sure assets are declared in pubspec.yaml

## Support

For more examples and detailed documentation, check:
- `README.md` - Package overview
- `USAGE_GUIDE.md` - Comprehensive examples
- `example/` - Working example app

## Next Steps

1. Try the basic example first
2. Customize colors to match your app theme
3. Add more items if needed (2-5 items supported)
4. Experiment with different icon types

Happy coding! 🚀
