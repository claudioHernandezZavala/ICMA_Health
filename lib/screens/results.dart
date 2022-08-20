import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ResultPage extends StatefulWidget {
  final double bmi;
  const ResultPage({Key? key, required this.bmi}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<Color> gradient = [Colors.green, Colors.blue];
  double elevation = 0;
  Color colorState = Colors.grey;
  String bmiState = "";
  @override
  Widget build(BuildContext context) {
    if (widget.bmi <= 18.5) {
      bmiState = "UnderWeight";
      colorState = const Color(0xFFFEC260);
    }
    if (widget.bmi >= 18.5 && widget.bmi <= 24.9) {
      bmiState = "Healthy weight";
      colorState = const Color(0xFF3FA796);
    }

    if (widget.bmi >= 25.0 && widget.bmi <= 29.9) {
      bmiState = "OverWeight";
      colorState = const Color(0xFFD1512D);
    }
    if (widget.bmi >= 30) {
      bmiState = "Obesity";
      colorState = const Color(0xFFFF1E00);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200.sp,
              child: Card(
                color: const Color(0xFF0F3D3E),
                elevation: 15,
                shadowColor: const Color(0xFFE8F9FD),
                surfaceTintColor: Colors.red,
                margin: const EdgeInsets.all(25),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          axisNameSize: 35,
                          axisNameWidget: const Text(
                            "Risk",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          axisNameSize: 25,
                          axisNameWidget: const Text(
                            "BMI",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, x) {
                              return Text(value.toString(),
                                  style: const TextStyle(color: Colors.white));
                            },
                          ),
                        ),
                      ),
                      gridData: FlGridData(
                        drawVerticalLine: true,
                        verticalInterval: 3,
                        drawHorizontalLine: false,
                        getDrawingVerticalLine: (v) {
                          Color color1 = Colors.grey;
                          if (v.toInt() <= 18) {
                            color1 = Colors.green.withOpacity(0.5);
                          }
                          if (v.toInt() > 18 && v.toInt() <= 24) {
                            color1 = Colors.orange.withOpacity(0.5);
                          }
                          if (v.toInt() >= 25 && v.toInt() <= 29) {
                            color1 = Colors.red.withOpacity(0.5);
                          }
                          return FlLine(
                            color: color1,
                          );
                        },
                      ),
                      borderData: FlBorderData(
                        border: Border.all(color: Colors.green, width: 5),
                      ),
                      maxX: 30,
                      maxY: 20,
                      minX: 0,
                      minY: 0,
                      lineBarsData: [
                        LineChartBarData(
                            shadow: const Shadow(
                                color: Colors.white, blurRadius: 25),
                            spots: [
                              LineBarSpot(
                                LineChartBarData(barWidth: 1),
                                2,
                                const FlSpot(0, 0),
                              ),

                              LineBarSpot(
                                LineChartBarData(barWidth: 1),
                                2,
                                const FlSpot(10, 5),
                              ),
                              LineBarSpot(
                                LineChartBarData(barWidth: 1),
                                2,
                                const FlSpot(15, 8),
                              ),
                              LineBarSpot(
                                LineChartBarData(barWidth: 1),
                                2,
                                const FlSpot(18, 10),
                              ),
                              LineBarSpot(
                                LineChartBarData(barWidth: 1),
                                2,
                                const FlSpot(20, 12),
                              ),

                              LineBarSpot(
                                LineChartBarData(barWidth: 1),
                                2,
                                const FlSpot(22, 14),
                              ),
                              LineBarSpot(
                                LineChartBarData(barWidth: 1),
                                2,
                                const FlSpot(25, 16),
                              ),
                              LineBarSpot(
                                LineChartBarData(barWidth: 1),
                                28,
                                const FlSpot(27, 18),
                              ),
                              LineBarSpot(
                                LineChartBarData(barWidth: 1),
                                2,
                                const FlSpot(30, 20),
                              ),
                              // FlSpot(widget.bmi, 5),
                              // const FlSpot(18.5, 5),
                              // const FlSpot(24.9, 10),
                              // const FlSpot(29.9, 15),
                            ],
                            isCurved: true,
                            gradient: const LinearGradient(
                              colors: [Colors.green, Colors.orange, Colors.red],
                            ),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.green.withOpacity(0.7),
                                  Colors.green.withOpacity(0.7),
                                  Colors.orange.withOpacity(0.7),
                                  Colors.red.withOpacity(0.7)
                                ],
                              ),
                            ),
                            barWidth: 5,
                            dotData: FlDotData(checkToShowDot: (x, y) {
                              return x.x == widget.bmi ? true : false;
                            }))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Your bmi result:",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              widget.bmi.toStringAsFixed(3),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              margin: EdgeInsets.all(10.sp),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: const Color(0xFF0E185F),
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: colorState.withOpacity(0.6),
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/fitness.png",
                        height: 15.w,
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text(
                        bmiState,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: const Color(0xFF413F42),
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: colorState.withOpacity(0.6),
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                    )
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: Table(
                      defaultColumnWidth: const FlexColumnWidth(1),
                      border: TableBorder(
                        top: const BorderSide(color: Colors.orange, width: 2),
                        right: const BorderSide(color: Colors.orange, width: 2),
                        left: const BorderSide(color: Colors.orange, width: 2),
                        bottom:
                            const BorderSide(color: Colors.orange, width: 2),
                        horizontalInside:
                            const BorderSide(color: Colors.orange, width: 2),
                        verticalInside:
                            const BorderSide(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      children: [
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.all(5.sp),
                                child: const Text("0-18.5")),
                            Container(
                              child: const Text("Underweight"),
                              margin: EdgeInsets.all(5.sp),
                            ),
                          ],
                        ),
                        TableRow(children: [
                          Container(
                            child: const Text("18.5-24.9"),
                            margin: EdgeInsets.all(5.sp),
                          ),
                          Container(
                            child: const Text("Healthy"),
                            margin: EdgeInsets.all(5.sp),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: const Text("25.0-29.9"),
                            margin: EdgeInsets.all(5.sp),
                          ),
                          Container(
                            child: const Text("Over Weight"),
                            margin: EdgeInsets.all(5.sp),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: const Text("30 and above"),
                            margin: EdgeInsets.all(5.sp),
                          ),
                          Container(
                            child: const Text("Obesity"),
                            margin: EdgeInsets.all(5.sp),
                          ),
                        ])
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
