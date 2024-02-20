import 'package:chatvoice/pallete.dart';
import 'package:flutter/material.dart';
import 'package:chatvoice/feature_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thierry"),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: Column(
        children: [
         Stack(
  children: [
    Container(
      height: 120,
      width: 120,
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: Pallete.assistantCircleColor,
        shape: BoxShape.circle,
      ),
    ),
    Positioned(
      top: 4,
      left: 4,
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
  ],
),


          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
            decoration: BoxDecoration(
              border: Border.all(color: Pallete.borderColor,
              )
            ),

            child:const  Padding(
              padding:  EdgeInsets.all(8.0),
              child:  Text(
                "Good Morning , what task  can I do for yout?",
                style: TextStyle(
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
            margin:const EdgeInsets.only(
              top: 10,
              left: 22,
            ),
            child: const Text(
              "Here are a few feature",
              style: TextStyle(
                fontFamily: 'Cera Pro',
                color: Pallete.mainFontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const   Column(
          children:[
              FeatureBox(
              color:Pallete.firstSuggestionBoxColor,
              headerText: 'ChatGPT',
              descriptionText: 'A smarter way to stay organized and informed with ChatGPT',
            )
          ]
          
          )
        ],
      ),
    );
  }
}
