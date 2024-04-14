import 'package:beer_collection/config/workOut.dart';
import 'package:beer_collection/entities/workout.dart';
import 'package:beer_collection/repository/workout/workout.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:beer_collection/util/get_week_date.dart';
import 'package:beer_collection/view/HealthPage/WorkOutAddPage/model.dart';
import 'package:beer_collection/widgets/error_message.dart';
import 'package:beer_collection/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class WorkOutAddPage extends StatefulWidget {
  const WorkOutAddPage({super.key});

  @override
  State<WorkOutAddPage> createState() => _WorkOutAddPageState();
}

class _WorkOutAddPageState extends State<WorkOutAddPage> {
  RequestWorkOut registryWorkOut = RequestWorkOut();
  RequestWorkOutValidate requestWorkOutValidate = RequestWorkOutValidate();
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> initDb() async {
    await WorkOutDbProvider.setDb();
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        iconTheme: IconThemeData(color: Styles.primaryColor),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light, // for iOS
          statusBarIconBrightness: Brightness.dark, // for Android
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              const LabelText(labelText: '運動した日付と運動内容を入力してください'),
              const Gap(16),
              const LabelText(labelText: '日付を入力してください'),
              TextFormField(
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                controller: _textEditingController,
                onTap: () {
                  _selectDate(context, registryWorkOut);
                },
              ),
              if (requestWorkOutValidate.isInValidRegistryDate)
                const ErrorMessage(errorMessage: '日付が未選択です。日付を選択してください。'),
              const Gap(16),
              const LabelText(labelText: '運動の内容を選択してください'),
              const Gap(8),
              SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      value: registryWorkOut.workOutType,
                      items: workOutTypeList
                          .asMap()
                          .entries
                          .map((workOut) => DropdownMenuItem(
                              value: workOut.key, child: Text(workOut.value)))
                          .toList(),
                      onChanged: (int? value) {
                        setState(() {
                          registryWorkOut.workOutType = value ?? 0;
                        });
                      },
                    ),
                  )),
              Visibility(
                visible: requestWorkOutValidate.isInValidWorkOutType,
                child: const ErrorMessage(
                    errorMessage: '運動の内容が未選択です。運動の内容を選択してください。'),
              ),
              const Gap(16),
              Visibility(
                visible: registryWorkOut.workOutType == 1,
                child: Column(children: [
                  const LabelText(labelText: '負荷の重量を入力してください'),
                  TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('kg'),
                      ),
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        registryWorkOut.load = double.parse(value);
                      });
                    },
                  ),
                  if (requestWorkOutValidate.isInValidLoad)
                    const ErrorMessage(
                        errorMessage: '負荷の重量が未入力です。負荷の重量を入力してください。'),
                  const Gap(16),
                  const LabelText(labelText: '回数を入力してください'),
                  TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('回'),
                      ),
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        registryWorkOut.frequency = int.parse(value);
                      });
                    },
                  ),
                  if (requestWorkOutValidate.isInValidFrequency)
                    const ErrorMessage(errorMessage: '回数が未入力です。回数を入力してください。'),
                ]),
              ),
              Visibility(
                visible: registryWorkOut.workOutType == 0,
                child: Column(
                  children: [
                    const Gap(16),
                    const LabelText(labelText: '時間を入力してください'),
                    TextFormField(
                      decoration: const InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('秒'),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          registryWorkOut.time = int.parse(value);
                        });
                      },
                    ),
                    if (requestWorkOutValidate.isInValidTime)
                      const ErrorMessage(errorMessage: '時間が未入力です。時間を入力してください。'),
                    const Gap(16),
                    const LabelText(labelText: '移動距離を入力してください'),
                    TextFormField(
                      decoration: const InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('km'),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          registryWorkOut.distance = double.parse(value);
                        });
                      },
                    ),
                    if (requestWorkOutValidate.isInValidDistance)
                      const ErrorMessage(
                          errorMessage: '移動距離が未入力です。移動距離を入力してください。'),
                  ],
                ),
              ),
              Visibility(
                visible: registryWorkOut.workOutType == 2,
                child: Column(
                  children: [
                    const Gap(16),
                    const LabelText(labelText: '消費カロリーを入力してください'),
                    TextFormField(
                      decoration: const InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('kcal'),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          registryWorkOut.calorie = double.parse(value);
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Gap(16),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: const StadiumBorder()),
                  onPressed: () {
                    int currentWorkOutType = registryWorkOut.workOutType ?? -1;

                    setState(() {
                      requestWorkOutValidate.checkInputValue(registryWorkOut);
                    });

                    if (requestWorkOutValidate
                        .isInValidData(currentWorkOutType)) {
                      return;
                    }

                    registerWorkOut(registryWorkOut);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    '登録',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ))),
    );
  }

  _selectDate(BuildContext context, RequestWorkOut registryWorkOut) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? newSelectedDate = await showDatePicker(
      context: context,
      locale: const Locale('ja'),
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null && newSelectedDate != selectedDate) {
      setState(() {
        selectedDate = newSelectedDate;
        registryWorkOut.registryDate = dateFormat.format(newSelectedDate);
      });
    }
    _textEditingController.text = dateFormat.format(selectedDate);
  }
}
