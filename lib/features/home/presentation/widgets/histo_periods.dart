import 'package:flutter/material.dart';
import 'package:dalel/features/home/presentation/widgets/histo_period_item.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [HistoricalPeriodItem(), HistoricalPeriodItem()],
    );
  }
}
