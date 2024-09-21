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
                      HealthChartCircular(width: width, chartData: chartData),
                      StepCard(chartData: chartData, width: width),
                      Container(
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey3.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Opacity(opacity: 0.5,child: Icon(Icons.bedtime, color: CupertinoColors.darkBackgroundGray, size: 24)),
                                const Text('  7h 10m', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Text('6:20AM \n- 1:30PM', style: TextStyle(fontSize: 16,color: CupertinoColors.white, fontWeight: FontWeight.w500)),
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                // Container(
                                //   padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                                //   decoration: BoxDecoration(
                                //     color: CupertinoColors.darkBackgroundGray.withOpacity(0.35),
                                //     borderRadius: BorderRadius.circular(100),
                                //   ),
                                //   child: const Center(child: Text('Record', style: TextStyle(fontSize: 16,color: CupertinoColors.white, fontWeight: FontWeight.w500))),
                                // ),
                                const Row(
                                  children: [
                                    Opacity(opacity: 0.5,child: Icon(Icons.timer_outlined, color: CupertinoColors.darkBackgroundGray, size: 24)),
                                    Opacity(opacity: 0.5,
                                    child: Text(" Record this", style: TextStyle(fontSize: 16, color: CupertinoColors.darkBackgroundGray, fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: width * 0.4,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.darkBackgroundGray.withOpacity(0.35),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: chartData.first.y/100,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: CupertinoColors.darkBackgroundGray,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
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

class StepCard extends StatelessWidget {
  const StepCard({
    super.key,
    required this.chartData,
    required this.width,
  });

  final List<ChartData> chartData;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey3.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${(chartData.first.y*60).toInt()}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const Text('/6000 steps', style: TextStyle(fontSize: 16, color: CupertinoColors.systemGrey)),
            ],
          ),
          const Spacer(),
          //progress bar
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: CupertinoColors.darkBackgroundGray.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("${chartData.first.y.toInt()}%", style: const TextStyle(fontSize: 16,color: CupertinoColors.white, fontWeight: FontWeight.w500)),
              ),
              const SizedBox(height: 5),
              Container(
                width: width * 0.33,
                height: 10,
                decoration: BoxDecoration(
                  color: CupertinoColors.darkBackgroundGray.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: FractionallySizedBox(
                  widthFactor: chartData.first.y/100,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: CupertinoColors.darkBackgroundGray,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HealthChartCircular extends StatelessWidget {
  const HealthChartCircular({
    super.key,
    required this.width,
    required this.chartData,
  });

  final double width;
  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
