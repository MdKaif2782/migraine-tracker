import 'package:flutter/cupertino.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: const Column(
          children: [
            Text('Report page'),
          ],
        ),
      ),
    );
  }
}
