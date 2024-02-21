import 'package:chatvoice/pallete.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
   final String descriptionText;
  const FeatureBox({super.key,required this.color,required this.headerText,required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              headerText,
              style:const  TextStyle(
                fontFamily: 'Cera Pro',
                color: Pallete.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
             Padding(

               padding: const EdgeInsets.symmetric(vertical: 20).copyWith(left: 15),
               child: Text(
                descriptionText,
                style: const  TextStyle(
                  fontFamily: 'Cera Pro',
                  color: Pallete.blackColor,
                ),
                           ),
             )
          ],
        ),
      ),
    );
  }
}