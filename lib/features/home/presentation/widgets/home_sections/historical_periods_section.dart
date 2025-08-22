import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/custom_header_txt.dart';
import 'package:dalel/features/home/presentation/widgets/histo_periods.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalPeriods),
        SizedBox(height: 16),
        HistoricalPeriods(),
        SizedBox(height: 32),
      ],
    );
  }
}