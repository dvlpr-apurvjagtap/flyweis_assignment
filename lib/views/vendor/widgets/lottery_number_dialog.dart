import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class LotteryNumberDialog extends StatelessWidget {
  final int number;
  final Color ballColor;

  const LotteryNumberDialog({
    super.key,
    required this.number,
    required this.ballColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ballColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              number.toString().padLeft(2, '0'),
              style: TextStyle(
                color: ballColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Number ${number.toString().padLeft(2, '0')}',
            style: AppTheme.headline4.copyWith(color: AppTheme.textPrimary),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This is number ${number.toString().padLeft(2, '0')} from the lottery grid.',
            style: AppTheme.body1.copyWith(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 12),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Got it!',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
