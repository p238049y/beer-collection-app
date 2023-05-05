import 'package:beer_collection/util/get_week_date.dart';
import 'package:beer_collection/view/HealthPage/WorkOutAddPage/work_out_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'model.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Scaffold(
        body: ListView.builder(
          itemCount: healthList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Slidable(
                child: ListTile(
                  minLeadingWidth: 120.0,
                  leading: convertTypeToIcon(healthList[index]['workOutType']),
                  title: Text(convertDateFormat(healthList[index]['registryDate'], 'yyyy/MM/dd'), maxLines: 1, overflow: TextOverflow.ellipsis),
                  trailing: Text('${healthList[index]['calorie']}kcal', maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
              ),
            );
          }
        )
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'beerRecordAdd',
            backgroundColor: Colors.grey,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WorkOutAddPage()));
            },
            child: const Icon(Icons.add),
          ),
        ]
      )
    );
  }
}