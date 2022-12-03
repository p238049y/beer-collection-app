import 'package:beer_collection/util/app_styles.dart';
import 'package:flutter/material.dart';

class CommonBackButton extends StatelessWidget with PreferredSizeWidget{
  const CommonBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        leading:  TextButton(
          child: Text(
          '< back',
          style: TextStyle(
            color: Styles.primaryColor,
            fontWeight: FontWeight.bold, 
            fontSize: 15.0
          ),  
        ),
        onPressed: () => Navigator.of(context).pop(),
        )
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}