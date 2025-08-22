import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/custom_header_txt.dart';
import 'package:dalel/features/home/presentation/widgets/custom_list_view.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalSouvenirs),
        SizedBox(height: 16),
        CustomCategoryListView(),
      ],
    );
  }
}
