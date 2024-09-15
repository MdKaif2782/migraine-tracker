import 'package:flutter/cupertino.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child:
      Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child:
        const Column(
          children: [
          Text('Survey page'),
        ]),
      ),
    );
  }
}
