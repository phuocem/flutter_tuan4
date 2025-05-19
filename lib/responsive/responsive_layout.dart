import 'package:flutter/material.dart';
import 'package:flutter_tuan4/responsive/desktop_layout.dart';
import 'package:flutter_tuan4/responsive/mobile_layout.dart';
import 'package:flutter_tuan4/responsive/tablet_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 550) {
          return MobileLayout();
        } else if (constraint.maxWidth < 1100) {
          return TabletLayout();
        } else {
          return DesktopLayout();
        }
      },
    );
  }
}
