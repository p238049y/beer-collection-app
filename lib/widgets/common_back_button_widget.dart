import 'package:beer_collection/util/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonBackButton extends StatelessWidget with PreferredSizeWidget {
  const CommonBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 80,
      iconTheme: IconThemeData( color: Styles.primaryColor ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light, // for iOS
        statusBarIconBrightness: Brightness.dark, // for Android
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
