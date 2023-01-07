import 'package:beer_collection/entities/user.dart';
import 'package:beer_collection/repository/user/user.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:beer_collection/widgets/common_back_button_widget.dart';

class ProfileEditPage extends StatefulWidget {
  final UserView userDate;
  const ProfileEditPage({Key? key, required this.userDate}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  Future<void> initDb() async {
    await UserDbProvider.setDb();
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
      appBar: const CommonBackButton(),
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
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: '名前',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder()),
                  initialValue: widget.userDate.userName,
                  onChanged: (String value) {
                    setState(() {
                      widget.userDate.userName = value;
                    });
                  },
                ),
                const Gap(16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '身長',
                    labelStyle: TextStyle(
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  initialValue: widget.userDate.height.toString(),
                  onChanged: (String value) {
                    setState(() {
                      widget.userDate.height = double.parse(value);
                    });
                  },
                ),
                const Gap(16),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: '体重',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder()),
                  initialValue: widget.userDate.weight.toString(),
                  onChanged: (String value) {
                    setState(() {
                      widget.userDate.weight = double.parse(value);
                    });
                  },
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Ink(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: const Icon(Icons.add_task),
                        onPressed: () async {
                          await UserDbProvider.updateUserData(widget.userDate);
                          Navigator.of(context).pop();
                        },
                        iconSize: 32.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
