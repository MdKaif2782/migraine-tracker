import 'package:flutter/cupertino.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthState();
}

class _HealthState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        child: Center(
          child: Text('Health page'),
        )
    );
  }
}
