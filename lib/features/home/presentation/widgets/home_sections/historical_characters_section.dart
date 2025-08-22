import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/custom_header_txt.dart';
import 'package:dalel/features/home/presentation/widgets/custom_list_view.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalCharacters),
        SizedBox(height: 16),
        CustomCategoryListView(),
        SizedBox(height: 32),
      ],
    );
  }
}