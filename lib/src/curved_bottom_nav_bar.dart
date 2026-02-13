import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'curved_nav_bar_painter.dart';
import 'nav_bar_item.dart';

/// A beautiful curved bottom navigation bar with floating selected icon animation
class CurvedBottomNavBar extends StatefulWidget {
  /// The list of navigation items
  final List<NavBarItem> items;

  /// The currently selected index
  final int currentIndex;

  /// Callback when an item is tapped
  final Function(int) onTap;

  /// Background color of the navigation bar (ignored if backgroundGradient is provided)
  final Color? backgroundColor;

  /// Background gradient for the navigation bar (takes priority over backgroundColor)
  final Gradient? backgroundGradient;

  /// Color of the selected item (floating button background)
  final Color? selectedColor;

  /// Secondary color for gradient effect on floating button
  final Color? selectedSecondaryColor;

  /// Gradient for the floating button (takes priority over selectedColor/selectedSecondaryColor)
  final Gradient? floatingButtonGradient;

  /// Color of unselected items
  final Color? unselectedColor;

  /// Shadow color for the navigation bar
  final Color? shadowColor;

  /// Height of the navigation bar
  final double? height;

  /// Size of the floating button
  final double? floatingButtonSize;

  /// Size of icons
  final double? iconSize;

  /// Text style for labels
  final TextStyle? labelTextStyle;

  /// Text style for selected label
  final TextStyle? selectedLabelTextStyle;

  /// Duration of the animation
  final Duration? animationDuration;

  /// Curve depth for the floating button
  final double? curveDepth;

  const CurvedBottomNavBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    super.key,
    this.backgroundColor,
    this.backgroundGradient,
    this.selectedColor,
    this.selectedSecondaryColor,
    this.floatingButtonGradient,
    this.unselectedColor,
    this.shadowColor,
    this.height,
    this.floatingButtonSize,
    this.iconSize,
    this.labelTextStyle,
    this.selectedLabelTextStyle,
    this.animationDuration,
    this.curveDepth,
  }) : assert(items.length >= 2 && items.length <= 5,
            'Items must be between 2 and 5');

  @override
  State<CurvedBottomNavBar> createState() => _CurvedBottomNavBarState();
}

class _CurvedBottomNavBarState extends State<CurvedBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void didUpdateWidget(CurvedBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      setState(() {
        _selectedIndex = widget.currentIndex;
      });
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = widget.height ?? 75.h;
    final floatingButtonSize = widget.floatingButtonSize ?? 60.w;
    final iconSize = widget.iconSize ?? 24.h;
    final backgroundColor = widget.backgroundColor ?? theme.cardColor;
    final selectedColor = widget.selectedColor ?? theme.primaryColor;
    final selectedSecondaryColor =
        widget.selectedSecondaryColor ?? theme.primaryColor;
    final unselectedColor =
        widget.unselectedColor ?? theme.disabledColor.withAlpha(128);
    final shadowColor = widget.shadowColor ?? Colors.black12;

    return SizedBox(
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Background with curve
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, height),
            painter: CurvedNavBarPainter(
              selectedIndex: _selectedIndex,
              itemCount: widget.items.length,
              shadowColor: shadowColor,
              color: widget.backgroundGradient == null ? backgroundColor : null,
              gradient: widget.backgroundGradient,
              curveDepth: widget.curveDepth ?? 35.0,
            ),
          ),

          // Floating circular button
          Positioned(
            top: -(floatingButtonSize / 3),
            left: _calculateFloatingButtonPosition(
              MediaQuery.of(context).size.width,
              widget.items.length,
              floatingButtonSize,
            ),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: 0.8 + (_animation.value * 0.2),
                  child: Container(
                    width: floatingButtonSize,
                    height: floatingButtonSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: widget.floatingButtonGradient ?? LinearGradient(
                        colors: [
                          selectedColor,
                          selectedSecondaryColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: selectedColor.withAlpha(77),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: _buildIcon(
                        widget.items[_selectedIndex],
                        iconSize * 1.2,
                        Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom nav items
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(widget.items.length, (index) {
                  final isSelected = _selectedIndex == index;
                  final item = widget.items[index];
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        widget.onTap(index);
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Icon - hide when selected (shown in floating button)
                            if (!isSelected)
                              _buildIcon(item, iconSize, unselectedColor)
                            else
                              SizedBox(height: iconSize),

                            SizedBox(height: 5.h),

                            // Label
                            Text(
                              item.label,
                              style: isSelected
                                  ? (widget.selectedLabelTextStyle ??
                                      TextStyle(
                                        color: selectedColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                      ))
                                  : (widget.labelTextStyle ??
                                      TextStyle(
                                        color: unselectedColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                      )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(NavBarItem item, double size, Color color) {
    if (item.customIcon != null) {
      return SizedBox(
        width: size,
        height: size,
        child: item.customIcon,
      );
    }

    if (item.icon is IconData) {
      return Icon(
        item.icon as IconData,
        size: size,
        color: color,
      );
    }

    if (item.icon is String) {
      return Image.asset(
        item.icon as String,
        height: size,
        width: size,
        color: color,
      );
    }

    if (item.icon is Widget) {
      return SizedBox(
        width: size,
        height: size,
        child: item.icon as Widget,
      );
    }

    return Icon(Icons.error, size: size, color: color);
  }

  double _calculateFloatingButtonPosition(
    double screenWidth,
    int itemCount,
    double buttonSize,
  ) {
    final itemWidth = screenWidth / itemCount;
    return (_selectedIndex * itemWidth) + (itemWidth / 2) - (buttonSize / 2);
  }
}
