import 'package:flutter/material.dart';
import 'package:mais_devagar/app/modules/core/utils/app_colors.dart';

class IndicatorPages extends StatelessWidget {
  final ValueNotifier<double> indexPage;
  final int pagesQuantity;
  IndicatorPages({
    required this.indexPage,
    required this.pagesQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pagesQuantity,
        (index) => _buildItemIndicator(index: index, indexPage: indexPage),
      ),
    );
  }
}

Widget _buildItemIndicator(
    {required int index, required ValueNotifier<double> indexPage}) {
  return Container(
    height: 30,
    width: 30,
    alignment: Alignment.center,
    child: ValueListenableBuilder(
      valueListenable: indexPage,
      builder: (context, value, child) {
        return AnimatedContainer(
          height: index == value ? 13 : 10,
          width: index == value ? 13 : 10,
          decoration: BoxDecoration(
            color: index == value ? AppColors.darkBlue : AppColors.pink,
            shape: BoxShape.circle,
          ),
          duration: const Duration(milliseconds: 300),
        );
      },
    ),
  );
}
