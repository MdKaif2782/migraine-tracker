import 'package:flutter/cupertino.dart';
import 'package:migraine_tracker/screens/app.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Survey',style: TextStyle(fontWeight: FontWeight.w400),),
      ),
      child:
      Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child:
        Column(
          children: [
          const Text('Survey page'),
          const SizedBox(height: 20),
          CupertinoButton.filled(child:const Text("Back",style: TextStyle(color:CupertinoColors.white),),
              onPressed: (){
                Navigator
                    .of(context, rootNavigator: true)
                    .pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (BuildContext context)
                  {return const App();}, ), (_) => false, );
              },
            ),
        ]),
      ),
    );
  }
}
