import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String selectedPeriod = "Daily";

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
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 16),
              child: const Text("Recent attack report",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.black)),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey3.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Column(
                children: [
                  Text("No recent attack"),
                ],
              ),
            )
          ],
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

class _AttackData {
  _AttackData(this.date, this.intensity);

  final String date;
  final double intensity;
}