import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/vendor.dart';

class HeroHeader extends StatelessWidget {
  final Vendor vendor;

  const HeroHeader({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 60,
      floating: false,
      pinned: true,
      backgroundColor: AppTheme.primaryColor,
      foregroundColor: Colors.white,
      title: Text(
        vendor.name,
        style: AppTheme.headline3.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
