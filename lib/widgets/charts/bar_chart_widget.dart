import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample1 extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
        child: AspectRatio(
          aspectRatio: 2,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black54,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Center(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          'Decision Tree',
                          style: TextStyle(
                              color: const Color(0xffaa4cfc),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Naive Bayes',
                          style: TextStyle(
                              color: const Color(0xff4af699),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: BarChart(
                              mainBarData(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.white] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 100,
            colors: [
              Color(0xffaa4cfc),
              Color(0xffaa4cfc),
              Color(0xff4af699),
              Color(0xff4af699)
            ],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 63.6905, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 66.6666, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String model;
              switch (group.x.toInt()) {
                case 0:
                  model = 'Decision Tree';
                  break;
                case 1:
                  model = 'Decision Tree';
                  break;
                case 2:
                  model = 'Naive Bayes';
                  break;
                case 3:
                  model = 'Naive Bayes';
                  break;
              }
              return BarTooltipItem(model + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.white));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Training';
              case 1:
                return 'Testing';
              case 2:
                return 'Training';
              case 3:
                return 'Testing';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  // BarChartData randomData() {
  //   return BarChartData(
  //     barTouchData: BarTouchData(
  //       enabled: false,
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: SideTitles(
  //         showTitles: true,
  //         getTextStyles: (value) => const TextStyle(
  //             color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
  //         margin: 16,
  //         getTitles: (double value) {
  //           switch (value.toInt()) {
  //             case 0:
  //               return 'Decision Tree';
  //             case 1:
  //               return 'Decision Tree';
  //             case 2:
  //               return 'Naive Bayes';
  //             case 3:
  //               return 'Naive Bayes';
  //             default:
  //               return '';
  //           }
  //         },
  //       ),
  //       leftTitles: SideTitles(
  //         showTitles: false,
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: false,
  //     ),
  //     barGroups: List.generate(4, (i) {
  //       switch (i) {
  //         case 0:
  //           return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
  //               barColor: widget.availableColors[
  //                   Random().nextInt(widget.availableColors.length)]);
  //         case 1:
  //           return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
  //               barColor: widget.availableColors[
  //                   Random().nextInt(widget.availableColors.length)]);
  //         case 2:
  //           return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
  //               barColor: widget.availableColors[
  //                   Random().nextInt(widget.availableColors.length)]);
  //         case 3:
  //           return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
  //               barColor: widget.availableColors[
  //                   Random().nextInt(widget.availableColors.length)]);
  //         default:
  //           return null;
  //       }
  //     }),
  //   );
  // }
}
