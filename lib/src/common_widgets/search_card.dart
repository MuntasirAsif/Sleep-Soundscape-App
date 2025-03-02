import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../core/constant/icons.dart';
import '../../core/constant/spacing.dart';
import '../../core/theme/theme_extensions/color_palette.dart';
import '../provider/search_provider.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.toggleSearch();
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInToLinear,
            switchOutCurve: Curves.bounceOut,
            child: provider.isOpen
                ? SizedBox(
                    width: AppSpacing.screenWidth(context) * 0.9,
                    child: TextFormField(
                      controller: provider.controller,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            AppIcons.searchIcon,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        provider.toggleSearch();
                      },
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.pagePadding,
                      vertical: AppSpacing.pagePadding * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.searchIcon,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
