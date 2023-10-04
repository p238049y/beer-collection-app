import 'package:beer_collection/config/workOut.dart';
import 'package:beer_collection/entities/workout.dart';
import 'package:beer_collection/repository/workout/workout.dart';
import 'package:beer_collection/util/get_week_date.dart';
import 'package:beer_collection/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WorkOutDetailPage extends StatefulWidget {
  final int workOutId;
  const WorkOutDetailPage({super.key, required this.workOutId});

  @override
  State<WorkOutDetailPage> createState() => _WorkOutDetailPageState();
}

class _WorkOutDetailPageState extends State<WorkOutDetailPage> {
  WorkOutDetailView workoutDetail =
      WorkOutDetailView(-1, -1, '', -1, 0.0, -1, -1, 0.0);

  Future<void> initDb() async {
    await WorkOutDbProvider.setDb();
    workoutDetail = await WorkOutDbProvider.getWorkOutDetail(widget.workOutId);
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
        actions: [
          IconButton(
            icon: const Icon(Icons.create),
            onPressed: () {},
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
        child: Column(children: [
          DisplayTextField(
            title: '記録日',
            text: workoutDetail.registryDate,
          ),
          const Gap(16),
          DisplayTextField(
            title: '種目',
            text: convertToWorkOutName(workoutDetail.workOutType),
          ),
          const Gap(16),
          Visibility(
              visible: workoutDetail.workOutType == 1,
              child: Column(children: [
                DisplayTextField(
                  title: '負荷の重量',
                  text: '${workoutDetail.load} kg',
                ),
                const Gap(16),
                DisplayTextField(
                  title: '回数',
                  text: '${workoutDetail.frequency} 回',
                ),
              ])),
          Visibility(
              visible: workoutDetail.workOutType == 0,
              child: Column(children: [
                DisplayTextField(
                  title: '運動時間',
                  text: convertDisplayTime(workoutDetail.time),
                ),
                const Gap(16),
                DisplayTextField(
                  title: '移動距離',
                  text: '${workoutDetail.distance} km',
                ),
              ])),
          Visibility(
              visible: workoutDetail.workOutType == 2,
              child: Column(children: [
                DisplayTextField(
                  title: '消費カロリー',
                  text: '${workoutDetail.calorie} kcal',
                ),
              ])),
        ]),
      ),
    );
  }
}

class DisplayTextField extends StatelessWidget {
  final String title;
  final String text;

  const DisplayTextField({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LabelText(labelText: title),
      TextFormField(
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
          labelText: text,
          enabled: false,
        ),
      )
    ]);
  }
}
