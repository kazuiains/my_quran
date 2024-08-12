import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_quran/app/config/app_colors.dart';

class BaseTopAppBarView {
  static flat(
    BuildContext context, {
    Key? key,
    Widget? leading,
    bool? automaticallyImplyLeading,
    Widget? title,
    List<Widget>? actions,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    double? scrolledUnderElevation,
    bool Function(ScrollNotification)? notificationPredicate,
    Color? shadowColor,
    Color? surfaceTintColor,
    ShapeBorder? shape,
    Color? foregroundColor,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    bool? primary,
    bool? centerTitle,
    bool? excludeHeaderSemantics,
    double? toolbarOpacity,
    double? bottomOpacity,
    double? toolbarHeight,
    double? leadingWidth,
    TextStyle? toolbarTextStyle,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
    bool? forceMaterialTransparency,
    Clip? clipBehavior,
    bool isDark = false,
    double? elevation,
    Color? backgroundColor,
    double? titleSpacing,
    double? paddingLeft,
    double? paddingRight,
    bool? useContentPadding,
  }) {
    ThemeData theme = Theme.of(context);
    IconThemeData? defaultIconTheme = theme.iconTheme;
    TextStyle? defaultTitleTextStyle = theme.textTheme.titleLarge;
    TextStyle? defaultToolbarTextStyle = theme.textTheme.bodyMedium;

    return AppBar(
      key: key,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      title: useContentPadding ?? true
          ? Padding(
              padding: EdgeInsets.only(
                left: paddingLeft ?? 16,
              ),
              child: title,
            )
          : title,
      actions: useContentPadding ?? true
          ? _actions(
              actions,
              whiteSpace: paddingRight,
            )
          : actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      elevation: elevation ?? 0,
      scrolledUnderElevation: scrolledUnderElevation,
      notificationPredicate:
          notificationPredicate ?? defaultScrollNotificationPredicate,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      backgroundColor: backgroundColor ?? Colors.transparent,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme ??
          defaultIconTheme.copyWith(
            color: isDark ? AppColors.white : AppColors.black,
          ),
      actionsIconTheme: actionsIconTheme ??
          defaultIconTheme.copyWith(
            color: isDark ? AppColors.white : AppColors.black,
          ),
      primary: primary ?? true,
      centerTitle: centerTitle,
      excludeHeaderSemantics: excludeHeaderSemantics ?? false,
      toolbarOpacity: toolbarOpacity ?? 1.0,
      bottomOpacity: bottomOpacity ?? 1.0,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      toolbarTextStyle: toolbarTextStyle ??
          defaultToolbarTextStyle?.copyWith(
            color: isDark ? AppColors.white : AppColors.black,
          ),
      titleTextStyle: titleTextStyle ??
          defaultTitleTextStyle?.copyWith(
            color: isDark ? AppColors.white : AppColors.black,
          ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
      forceMaterialTransparency: forceMaterialTransparency ?? false,
      clipBehavior: clipBehavior,
      titleSpacing: titleSpacing ?? 0,
    );
  }

  static List<Widget> _actions(
    List<Widget>? actions, {
    double? whiteSpace,
  }) {
    List<Widget> result = [];
    if (actions != null && actions.isNotEmpty) {
      result.addAll(actions);
      result.add(
        SizedBox(
          width: whiteSpace ?? 16,
        ),
      );
    }
    return result;
  }
}
