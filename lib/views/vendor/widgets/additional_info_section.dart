import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection({super.key});

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
                  color: AppTheme.secondaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.contact_support,
                  color: AppTheme.secondaryColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Additional Information',
                style: AppTheme.headline4.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Info Items
          _buildInfoItem(
            icon: Icons.schedule,
            title: 'Operating Hours',
            value: 'Monday - Sunday: 9:00 AM - 10:00 PM',
            color: AppTheme.secondaryColor,
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            icon: Icons.payment,
            title: 'Payment Methods',
            value: 'Cash, Card, Digital Payments',
            color: AppTheme.accentColor,
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            icon: Icons.security,
            title: 'Security',
            value: 'Licensed and Regulated Vendor',
            color: AppTheme.successColor,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTheme.caption.copyWith(
                  color: AppTheme.textTertiary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTheme.body2.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
