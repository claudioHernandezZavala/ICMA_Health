import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import './results.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  bool visible = false;
  double weight = 0;
  double height = 0;
  int age = 1;
  List<String> weightNotations = ["Kg", "Lb"];
  List<String> heightNotations = ["M", "Cm"];

  bool manSelected = true;
  bool womanSelected = false;
  TextEditingController heightController = TextEditingController(text: "0");
  TextEditingController weightController = TextEditingController(text: "0");
  // ignore: prefer_typing_uninitialized_variables
  var weightValue;
  var heightValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    heightController.dispose();
    weightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.drag_handle_rounded),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 25.sp, right: 25.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.sp,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "BMI Calculator",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (womanSelected) {
                        setState(() {
                          womanSelected = false;
                          manSelected = true;
                        });
                      }
                    },
                    child: Container(
                      width: 35.w,
                      padding: const EdgeInsets.all(0),
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        border: Border.all(
                            color: manSelected ? Colors.red : Colors.white,
                            width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.check_box,
                              color: manSelected ? Colors.red : Colors.grey,
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.man_sharp,
                              color: Colors.white,
                              size: 20.w,
                            ),
                          ),
                          const Text(
                            "Male",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (manSelected) {
                        setState(() {
                          manSelected = false;
                          womanSelected = true;
                        });
                      }
                    },
                    child: Container(
                      width: 35.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        border: Border.all(
                            color: womanSelected ? Colors.red : Colors.white,
                            width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.check_box,
                                color:
                                    womanSelected ? Colors.red : Colors.grey),
                          ),
                          Center(
                            child: Icon(
                              Icons.woman,
                              color: Colors.white,
                              size: 20.w,
                            ),
                          ),
                          const Text(
                            "Female",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              //weight============================
              const Text("Weight"),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              weight--;
                              weightController.value =
                                  TextEditingValue(text: weight.toString());
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50.sp,
                          child: TextField(
                            controller: weightController,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              weight++;
                              weightController.value =
                                  TextEditingValue(text: weight.toString());
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.black,
                      underline: const SizedBox(),
                      items: weightNotations
                          .map(
                            (String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          weightValue = value!;
                        });
                      },
                      value: weightValue,
                      dropdownColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.sp,
              ),
              const Text("Height"),
              SizedBox(
                height: 10.sp,
              ),
              //height===============================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              height--;
                              heightController.value =
                                  TextEditingValue(text: height.toString());
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 50.sp,
                            child: TextField(
                              controller: heightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  focusColor: Colors.transparent,
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              height++;
                              heightController.value =
                                  TextEditingValue(text: height.toString());
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              height++;
                              heightController.value =
                                  TextEditingValue(text: height.toString());
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.black,
                      underline: const SizedBox(),
                      items: heightNotations
                          .map(
                            (String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          heightValue = value!;
                        });
                      },
                      value: heightValue,
                      dropdownColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.sp,
              ),
              const Text("Age"),
              SizedBox(
                height: 10.sp,
              ),
              Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (age != 1) {
                          setState(() {
                            age--;
                          });
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      age.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          age++;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => ResultPage(
                            bmi: bmiCalcultator(
                                double.parse(weightController.text),
                                double.parse(heightController.text)))));
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange)),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double bmiCalcultator(double weight, double height) {
    double bmi = 0;
    double weightToUse = 0;
    double heightToUse = 0;
    // double heightNew = height * height;
    if (weightValue == "Lb") {
      weightToUse = weight * 703;
    } else {
      weightToUse = weight;
    }
    if (heightValue == "Cm") {
      heightToUse = height / 100;
      heightToUse *= heightToUse;
    } else {
      heightToUse = height * height;
    }
    return bmi = weightToUse / heightToUse;
  }
}
