import 'package:flutter/material.dart';
import 'package:my_quran/app/config/app_colors.dart';
import 'package:my_quran/app/config/app_strings.dart';
import 'package:my_quran/app/config/constants/assets_constants.dart';
import 'package:my_quran/domain/entities/response/sura.dart';

class SuraItemView extends StatelessWidget {
  final void Function()? onTap;
  final Sura? sura;

  const SuraItemView({
    super.key,
    this.onTap,
    this.sura,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStateProperty.all<Color>(
        AppColors.cultured,
      ),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AssetsConstants.imageBackgroundSuraNumber,
                    ),
                  ),
                  Text(
                    sura?.number.toString() ?? AppStrings.zeroValue,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 1.5,
                    ),
                    child: Text(
                      sura?.nameLatin ?? AppStrings.defaultNullValue,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    "${sura?.dropOffPlace ?? AppStrings.defaultNaValue} - ${sura?.numberOfVerses ?? AppStrings.zeroValue} Ayat",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                sura?.name ?? AppStrings.defaultNullValue,
                style: TextStyle(
                    fontSize: 26,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
