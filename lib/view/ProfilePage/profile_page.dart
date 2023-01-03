import 'package:beer_collection/widgets/common_back_button_widget.dart';
import 'package:beer_collection/widgets/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
        child: Column(
          children: [
            const Gap(100),
            SizedBox(
                width: 350,
                height: 250,
                child: Image.asset('assets/images/profile.png')),
            const Gap(16),
            ListItem(isEnabled: false, title: '名前', name: 'タロー'),
            const Gap(16),
            ListItem(isEnabled: false, title: '身長', name: '170.3', unit: 'cm'),
            const Gap(16),
            ListItem(
                isEnabled: false, title: '体重', name: '65.4', unit: 'kg'),
            const Gap(8),
            const Text('(他のユーザーに公開されることは一切ありません)', style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
