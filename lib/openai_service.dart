import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chatvoice/secrets.dart';

class OpenAIService {
  Future<String> isArtPromptAPI(String prompt) async{
    try{
    final res = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers:{
        'Content-Type' : 'application/json',
        'Authorization' : 'Bearer $openAIAPIKey' ,
      },
      body : jsonEncode({
        "model" : "gpt-3.5-turbo",
        "message" : [{
          'role':'user',
          'content' : ' Does this message want to generate an AI picture ,image,art or anything similar? $prompt . simply anwer with a yes or no',
        }]
      })
     );
     print(res.body);
     if(res.status == 200){
      print('yay');
     }

    }catch(e){
      return e.toString();
    }
  }
}