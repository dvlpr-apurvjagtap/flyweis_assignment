import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../controllers/vendor_controller.dart';
import 'widgets/hero_header.dart';
import 'widgets/quick_info_section.dart';
import 'widgets/about_section.dart';
import 'widgets/lottery_numbers_section.dart';
import 'widgets/additional_info_section.dart';
import 'widgets/lottery_number_dialog.dart';

class VendorDetailScreen extends StatefulWidget {
  final String vendorId;

  const VendorDetailScreen({super.key, required this.vendorId});

  @override
  State<VendorDetailScreen> createState() => _VendorDetailScreenState();
}

class _VendorDetailScreenState extends State<VendorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Consumer<VendorController>(
        builder: (context, vendorController, child) {
          final vendor = vendorController.allVendors.firstWhere(
            (v) => v.name == widget.vendorId,
            orElse: () => vendorController.allVendors.first,
          );

          return CustomScrollView(
            slivers: [
              // Custom App Bar with Hero Header
              HeroHeader(vendor: vendor),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      // Quick Info Cards
                      const QuickInfoSection(),

                      const SizedBox(height: 32),

                      // About Section
                      AboutSection(vendor: vendor),

                      const SizedBox(height: 32),

                      // Lottery Numbers Section
                      LotteryNumbersSection(onNumberTap: _showNumberDialog),

                      const SizedBox(height: 32),

                      // Additional Info Section
                      const AdditionalInfoSection(),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showNumberDialog(int number) {
    Color ballColor = _getBallColor(number);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LotteryNumberDialog(number: number, ballColor: ballColor);
      },
    );
  }

  Color _getBallColor(int number) {
    // Snooker ball colors for visual variety
    if (number == 0) return Colors.white;
    if (number <= 7) return Colors.red;
    if (number <= 14) return Colors.yellow;
    if (number <= 21) return Colors.green;
    if (number <= 28) return Colors.brown;
    if (number <= 35) return Colors.blue;
    if (number <= 42) return Colors.pink;
    if (number <= 49) return Colors.black;
    if (number <= 56) return Colors.red;
    if (number <= 63) return Colors.yellow;
    if (number <= 70) return Colors.green;
    if (number <= 77) return Colors.brown;
    if (number <= 84) return Colors.blue;
    if (number <= 91) return Colors.pink;
    return Colors.black;
  }
}
