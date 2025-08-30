import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class LotteryNumbersSection extends StatelessWidget {
  final Function(int) onNumberTap;

  const LotteryNumbersSection({super.key, required this.onNumberTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.casino,
                  color: AppTheme.accentColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Lottery Numbers (00-99)',
                style: AppTheme.headline4.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Select your lucky numbers from the grid below. Each number represents a unique lottery ball with different colors.',
            style: AppTheme.body2.copyWith(
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Lottery Numbers Grid
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.backgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.borderColor.withValues(alpha: 0.3),
              ),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                childAspectRatio: 1.0,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 100, // Numbers 00-99
              itemBuilder: (context, index) {
                return _buildLotteryBall(index);
              },
            ),
          ),

          const SizedBox(height: 20),

          // Instructions
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.primaryColor.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tap any number to see details. In a real app, you could select numbers for your lottery ticket.',
                    style: AppTheme.caption.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLotteryBall(int number) {
    Color ballColor = _getBallColor(number);
    Color textColor = _getTextColor(number);

    return GestureDetector(
      onTap: () => onNumberTap(number),
      child: Container(
        decoration: BoxDecoration(
          color: ballColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            number.toString().padLeft(2, '0'),
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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

  Color _getTextColor(int number) {
    // Ensure text is readable on different background colors
    if (number == 0) return Colors.black;
    if (number <= 7) return Colors.white;
    if (number <= 14) return Colors.black;
    if (number <= 21) return Colors.white;
    if (number <= 28) return Colors.white;
    if (number <= 35) return Colors.white;
    if (number <= 42) return Colors.white;
    if (number <= 49) return Colors.white;
    if (number <= 56) return Colors.white;
    if (number <= 63) return Colors.black;
    if (number <= 70) return Colors.white;
    if (number <= 77) return Colors.white;
    if (number <= 84) return Colors.white;
    if (number <= 91) return Colors.white;
    return Colors.white;
  }
}
