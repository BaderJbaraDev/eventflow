
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ConceptNotice extends StatelessWidget {
  const ConceptNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.science_outlined,
            color: Color(0xFF9A641B),
            size: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Portfolio demo: bookings and tickets are simulated. '
              'No real payments or event admission are supported.',
              style: TextStyle(
                color: Color(0xFF80551D),
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
