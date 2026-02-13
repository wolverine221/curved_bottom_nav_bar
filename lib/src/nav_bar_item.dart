import 'package:flutter/material.dart';

/// Model class for bottom navigation bar items
class NavBarItem {
  /// The icon to display for this item
  /// Can be IconData, String (asset path), or Widget
  final dynamic icon;
  
  /// The label text for this item
  final String label;
  
  /// Optional: Custom widget to use instead of default icon
  final Widget? customIcon;

  const NavBarItem({
    required this.icon,
    required this.label,
    this.customIcon,
  });
}
