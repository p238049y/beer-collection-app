import 'package:beer_collection/entities/user.dart';
import 'package:beer_collection/repository/user/user.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:beer_collection/widgets/common_back_button_widget.dart';

class ProfileAddPage extends StatefulWidget {
  const ProfileAddPage({Key? key}) : super(key: key);

  @override
  State<ProfileAddPage> createState() => _ProfileAddPageState();
}

class _ProfileAddPageState extends State<ProfileAddPage> {
  RequestUser registryUser = RequestUser();

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
                Center(
                    child: Container(
                  width: 350,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 200,
                  ),
                )),
                const Gap(16),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: '名前',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder()),
                  onChanged: (String value) {
                    setState(() {
                      registryUser.userName = value;
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
                  onChanged: (String value) {
                    setState(() {
                      registryUser.height = double.parse(value);
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
                  onChanged: (String value) {
                    setState(() {
                      registryUser.weight = double.parse(value);
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
                          await UserDbProvider.insertUserData(registryUser);
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
