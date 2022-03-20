

import 'package:flutter/material.dart';

import 'QuizEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
              Text("QUIZE HOŞGELDİNİZ.", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(

                  onPressed: ()
                  {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => QuizEkrani()));
                  }, child: Text("Quiz Ekranı")),
            )

          ],
        ),
      ),

    );
  }
}
