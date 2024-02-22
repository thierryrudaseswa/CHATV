import 'package:chatvoice/pallete.dart';
import 'package:flutter/material.dart';
import 'package:chatvoice/feature_box.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';
  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }
  Future<void> initSpeechToText() async{
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async{
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }
   Future<void> stopListening() async{
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result){
    setState(() {
      lastWords = result.recognizedWords;
    });
  }
  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thierry"),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                width: 120,
                margin: const EdgeInsets.only(top: 4),
                decoration: const  BoxDecoration(
                  color: Pallete.assistantCircleColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    height: 112,
                    width: 112,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/virtualAssistant.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
            decoration: BoxDecoration(
              border: Border.all(color: Pallete.borderColor),
            ),
            child:const  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Good Morning, what task can I do for you?",
                style:TextStyle(
                  fontFamily: 'Cera Pro',
                  color: Pallete.mainFontColor,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 10, left: 22),
            child: const Text(
              "Here are a few features",
              style: TextStyle(
                fontFamily: 'Cera Pro',
                color: Pallete.mainFontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FeatureBox(
            color: Pallete.firstSuggestionBoxColor,
            headerText: 'ChatGPT',
            descriptionText: 'A smarter way to stay organized and informed with ChatGPT',
          ),
          FeatureBox(
            color: Pallete.secondSuggestionBoxColor,
            headerText: 'Dall-E',
            descriptionText: 'Get inspired and stay creative with your personal assistant AI',
          ),
          FeatureBox(
            color: Pallete.thirdSuggestionBoxColor,
            headerText: 'Smart Voice Assistant',
            descriptionText: 'Get the best of both worlds with a voice with assistant powered AI',
          ),
        ],
      ),
      floatingActionButton:
       FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async{
if( await speechToText.hasPermission && speechToText.isNotListening){
  await startListening();
}else if(speechToText.isListening){
  await stopListening();
}
else{
  initSpeechToText();
}
        },
        child: const Icon(Icons.mic),
       )
      ,
    );
  }
}
