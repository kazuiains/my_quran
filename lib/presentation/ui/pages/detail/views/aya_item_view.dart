import 'package:flutter/material.dart';
import 'package:my_quran/app/config/app_colors.dart';
import 'package:my_quran/app/config/app_constants.dart';
import 'package:my_quran/app/config/app_strings.dart';
import 'package:my_quran/domain/entities/response/aya.dart';

class AyaItemView extends StatelessWidget {
  final void Function()? onPlay;
  final void Function()? onShare;
  final void Function()? onSave;
  final Aya? aya;

  const AyaItemView({
    super.key,
    this.onPlay,
    this.onShare,
    this.onSave,
    this.aya,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      overlayColor: WidgetStateProperty.all<Color>(
        AppColors.cultured,
      ),
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    child: Container(
                      width: 35,
                      height: 35,
                      color: AppColors.primary,
                      alignment: Alignment.center,
                      child: Text(
                        aya?.number.toString() ?? "",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      AssetsConstants.iconShareOff,
                      width: 18,
                      height: 18,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      AssetsConstants.iconPlayOff,
                      width: 18,
                      height: 18,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      AssetsConstants.iconSaveOff,
                      width: 18,
                      height: 18,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                aya?.arabicText ?? AppStrings.defaultNullValue,
                style: const TextStyle(fontSize: 28),
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                aya?.latinText ?? AppStrings.defaultNullValue,
                style: TextStyle(height: 1.5, color: AppColors.primaryDark),
              ),
            ),
            Text(
              aya?.indonesianText ?? AppStrings.defaultNullValue,
              style: TextStyle(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
