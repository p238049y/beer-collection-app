import 'package:beer_collection/entities/user.dart';
import 'package:beer_collection/repository/user/user.dart';
import 'package:beer_collection/view/ProfilePage/ProfileAddPage/profile_add_page.dart';
import 'package:beer_collection/view/ProfilePage/ProfileEditPage/profile_edit_page.dart';
import 'package:beer_collection/widgets/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<UserView> userList = [];
  UserView userDate = UserView(0, '未登録', 0, 0);

  Future<void> initDb() async {
    await UserDbProvider.setDb();
    userList = await UserDbProvider.getUserData();
    if (userList.isNotEmpty) {
      userDate = userList[0];
    }
    setState(() {});
  }

  Future<void> reBuild() async {
    userList = await UserDbProvider.getUserData();
    if (userList.isNotEmpty) {
      userDate = userList[0];
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: userDate.id == 0
              ? [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProfileAddPage()));
                    },
                  ),
                ]
              : [
                  IconButton(
                    icon: const Icon(Icons.create),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfileEditPage(userDate: userDate)));
                    },
                  ),
                ],
          iconTheme: const IconThemeData(color: Colors.blueGrey),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: reBuild(),
          builder: (context, snapshot) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          width: 350,
                          height: 250,
                          child: Image.asset('assets/images/profile.png')),
                      const Gap(16),
                      ListItem(
                          isEnabled: false,
                          title: '名前',
                          name: userDate.userName),
                      const Gap(16),
                      ListItem(
                          isEnabled: false,
                          title: '身長',
                          name: userDate.height.toString(),
                          unit: 'cm'),
                      const Gap(16),
                      ListItem(
                          isEnabled: false,
                          title: '体重',
                          name: userDate.weight.toString(),
                          unit: 'kg'),
                      const Gap(8),
                      const Text('(他のユーザーに公開されることは一切ありません)',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
