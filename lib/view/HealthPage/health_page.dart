import 'package:beer_collection/entities/workout.dart';
import 'package:beer_collection/repository/workout/workout.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:beer_collection/util/get_week_date.dart';
import 'package:beer_collection/view/HealthPage/WorkOutAddPage/work_out_add_page.dart';
import 'package:beer_collection/view/HealthPage/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  List<WorkOutView> workOutList = [];

  Future<void> initDb() async {
    await WorkOutDbProvider.setDb();
    workOutList = await WorkOutDbProvider.getWorkOutList();
    setState(() {});
  }

  Future<void> reBuild() async {
    workOutList = await WorkOutDbProvider.getWorkOutList();
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
        body: FutureBuilder(
      future: reBuild(),
      builder: (context, snapshot) => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Styles.fitnessColor, Styles.orangeColor],
          begin: const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        )),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Container()),
                        IconButton(
                          icon:
                              Icon(Icons.add, size: 30, color: Styles.bgColor),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const WorkOutAddPage()));
                          },
                        ),
                      ],
                    ),
                    const Gap(8),
                    Text('ワークアウト',
                        style: TextStyle(
                            fontSize: 25,
                            color: Styles.bgColor,
                            fontWeight: FontWeight.bold)),
                    const Gap(50),
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Styles.fitnessColor,
                                  Styles.fitnessColor.withOpacity(0.5)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                size: 20,
                                color: Styles.bgColor,
                              ),
                              const Gap(5),
                              Text('2000 kcal',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Styles.bgColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(50),
                  ]),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                children: [
                  const Gap(30),
                  Row(
                    children: const [
                      Gap(20),
                      Text('これまでの記録',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Gap(20),
                    ],
                  ),
                  const Gap(20),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          itemCount: workOutList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                child: Slidable(
                                    endActionPane: ActionPane(
                                      extentRatio: 0.25,
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (value) async {
                                            await WorkOutDbProvider.deleteData(
                                                workOutList[index].id);
                                            reBuild();
                                          },
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: '削除',
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(
                                      height: 90,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: 80,
                                                  height: 80,
                                                  child: convertTypeToIcon(
                                                      workOutList[index]
                                                          .workOutType)),
                                              const Gap(10),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${workOutList[index].calorie.toStringAsFixed(2)}kcal',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Gap(5),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3),
                                                      child: Text(
                                                          convertDateFormat(
                                                              workOutList[index]
                                                                  .registryDate,
                                                              'yyyy/MM/dd'),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[500],
                                                          ))),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )));
                          }))
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
