import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundscape/core/theme/theme_extensions/color_palette.dart';
import '../../../../provider/category_provider.dart';

class CategoryMenu extends StatelessWidget {
  final List<String> categories = ["All", "Rain", "Water", "Wind", "Instrument"];

  CategoryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              bool isSelected = provider.selectedCategory == category;
              return GestureDetector(
                onTap: () => provider.selectCategory(context,category),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                      colors: AppColors.gradiantButton,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                        : null,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.whiteColor.withOpacity(0.08),width: 2),
                    color: isSelected ? null : Colors.transparent,
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
