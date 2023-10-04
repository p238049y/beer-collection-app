import 'package:beer_collection/entities/workout.dart';
import 'package:beer_collection/repository/workout/workout.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
