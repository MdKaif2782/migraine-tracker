import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migraine_tracker/screens/report.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthState();
}

class _HealthState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    // display height and width of the screen
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final List<ChartData> chartData = [
      ChartData('Steps', 4500/6000*100, Colors.blue),
      ChartData('Workout', 60/90*100, Colors.green),
      ChartData('Calories', 300/500*100, Colors.red),
      ChartData('Journey', 120/180*100, Colors.orange),
    ];

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Health', style: TextStyle(fontWeight: FontWeight.w400)),
        ),
        child: SafeArea(
          child: Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(delegate: SliverChildListDelegate(
                    [
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                        height: width * 0.45,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey3.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CountTitle(title: 'steps',count: '4500', icon: Icons.directions_run, color: Colors.blue),
                                  CountTitle(title: 'mins',count: '60', icon: Icons.directions_run, color: Colors.green),
                                  CountTitle(title: 'Cal',count: '300', icon: Icons.local_fire_department, color: Colors.red),
                                  CountTitle(title: 'mins',count: '120', icon: Icons.directions_bus, color: Colors.orange),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: width * 0.33,
                              child: SfCircularChart(
                                borderWidth: 0,
                                margin: const EdgeInsets.all(0),
                                series: <CircularSeries>[
                                  RadialBarSeries<ChartData, String>(
                                    dataSource: chartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    pointColorMapper: (ChartData data, _) => data.color,
                                    maximumValue: 100, // Set maximum value to 100 for percentage
                                    cornerStyle: CornerStyle.bothCurve,
                                    radius: '100%',
                                    gap: '5%',
                                    trackColor: CupertinoColors.systemGrey4,
                                    opacity: 0.8,
                                    dataLabelSettings: const DataLabelSettings(isVisible: false),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                  )),
                ],
              )
          )
        )
    );
  }
}

class CountTitle extends StatelessWidget {
  const CountTitle({
    this.title,
    super.key, this.count, this.icon, this.color,
  });

  final title;
  final count;
  final icon;
  final color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        Text('  $count', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        Text(' $title', style: const TextStyle(fontSize: 16,color: CupertinoColors.systemGrey, fontWeight: FontWeight.w400)),
      ],
    );
  }

}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
