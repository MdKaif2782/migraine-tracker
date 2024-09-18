import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String selectedPeriod = "Daily";

  List<_AttackData> attackData = [
    _AttackData("Sun", 8),
    _AttackData("Mon", 5),
    _AttackData("Tue", 7),
    _AttackData("Wed", 6),
    _AttackData("Thu", 9),
    _AttackData("Fri", 4),
    _AttackData("Sat", 8),
  ];

  List<_ScreenTimeData> screenTimeData = [
    _ScreenTimeData("Sun", 8.4),
    _ScreenTimeData("Mon", 5.2),
    _ScreenTimeData("Tue", 7.3),
    _ScreenTimeData("Wed", 6.5),
    _ScreenTimeData("Thu", 9.9),
    _ScreenTimeData("Fri", 4.03),
    _ScreenTimeData("Sat", 8.01),
  ];


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Report', style: TextStyle(fontWeight: FontWeight.w400)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              child: const PeriodSelectionRow(),
            ),
            const SizedBox(height: 10),
            const StyledTitle(text: 'Recent attack report'),
            const SizedBox(height: 10),
            RecentAttackGraph(data: attackData),
            const SizedBox(height: 20),
            const StyledTitle(text: 'Screen time report'),
            const SizedBox(height: 10),
            ScreenTimeGraph(data: screenTimeData),

          ],
        ),
      ),
    );
  }
}

class RecentAttackGraph extends StatelessWidget {
  const RecentAttackGraph({
    super.key,
    required this.data,
  });

  final List<_AttackData> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey3.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          SizedBox(
            // 70% of the screen width
            height: MediaQuery.of(context).size.width * 0.6,
            child: SfCartesianChart(
                primaryXAxis: const CategoryAxis(),
                // Chart title
                // Enable legend
                legend: const Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries<_AttackData, String>>[
                  LineSeries<_AttackData, String>(
                      dataSource: data,
                      xValueMapper: (_AttackData sales, _) => sales.date,
                      yValueMapper: (_AttackData sales, _) => sales.intensity,
                      name: 'Migraine Intensity',
                      color: CupertinoColors.darkBackgroundGray,
                      // Enable data label
                      dataLabelSettings: const DataLabelSettings(isVisible: true))
                ]),
          ),
        ],
      ),
    );
  }
}

class StyledTitle extends StatelessWidget {
  final String text;

  const StyledTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: CupertinoColors.black,
        ),
      ),
    );
  }
}

class PeriodSelectionRow extends StatefulWidget {
  const PeriodSelectionRow({super.key});

  @override
  State<PeriodSelectionRow> createState() => _PeriodSelectionRowState();
}

class _PeriodSelectionRowState extends State<PeriodSelectionRow> {
  String selectedPeriod = "Daily";

  void _onPeriodSelected(String period) {
    setState(() {
      selectedPeriod = period;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildPeriodButton("Daily"),
        _buildPeriodButton("Weekly"),
        _buildPeriodButton("Monthly"),
        _buildPeriodButton("Yearly"),
      ],
    );
  }

Widget _buildPeriodButton(String period) {
  return Expanded(
    flex: 1,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (kDebugMode) {
            print(period);
          }
          _onPeriodSelected(period);
        },
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selectedPeriod == period ? CupertinoColors.systemGrey3.withOpacity(0.5) : Colors.transparent,
            borderRadius: BorderRadius.only(
              bottomLeft: period == "Daily" ? const Radius.circular(8) : const Radius.circular(0),
              topLeft: period == "Daily" ? const Radius.circular(8) : const Radius.circular(0),
              bottomRight: period == "Yearly" ? const Radius.circular(8) : const Radius.circular(0),
              topRight: period == "Yearly" ? const Radius.circular(8) : const Radius.circular(0),
            ),
            border: Border(
              left: BorderSide(
                color: CupertinoColors.secondaryLabel,
                width: period == "Daily" ? 1 : 0.5,
              ),
              right: BorderSide(
                color: CupertinoColors.secondaryLabel,
                width: period == "Yearly" ? 1 : 0.5,
              ),
              top: const BorderSide(
                color: CupertinoColors.secondaryLabel,
                width: 1,
              ),
              bottom: const BorderSide(
                color: CupertinoColors.secondaryLabel,
                width: 1,
              ),
            ),
          ),
          child: Text(period, style: const TextStyle(color: CupertinoColors.black, fontFamily: "Poppins", fontWeight: FontWeight.w500)),
        ),
      ),
    ),
  );
}
}

class ScreenTimeGraph extends StatelessWidget {
  const ScreenTimeGraph({
    super.key,
    required this.data,
  });

  final List<_ScreenTimeData> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey3.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.6,
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                labelRotation: 45, // Rotate labels for better readability
                majorTickLines: MajorTickLines(size: 0),
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                minimum: 0,
                interval: 1,
                majorTickLines: MajorTickLines(size: 0),
                majorGridLines: MajorGridLines(width: 0.5),
              ),
              series: <CartesianSeries<dynamic, dynamic>>[
                ColumnSeries<_ScreenTimeData, String>(
                  dataSource: data,
                  xValueMapper: (_ScreenTimeData data, _) => data.date,
                  yValueMapper: (_ScreenTimeData data, _) => data.timeInHours,
                  color: CupertinoColors.darkBackgroundGray,
                  name: 'Screen Time (in hours)',
                  spacing: 0.2, // Add gaps between bars
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _AttackData {
  _AttackData(this.date, this.intensity);

  final String date;
  final double intensity;
}

class _ScreenTimeData {
  _ScreenTimeData(this.date, this.timeInHours);

  final String date;
  final double timeInHours;
}