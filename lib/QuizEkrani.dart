
import 'dart:collection';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:untitled52/bayraklar.dart';
import 'package:untitled52/bayraklardao.dart';

import 'SonucEkrani.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({Key? key}) : super(key: key);

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {


  var sorular = <bayraklar>[];
  var yanlissecenekler = <bayraklar>[];
   bayraklar dogruSoru = bayraklar(2,"ff","gg");
  var tumSecenekler = HashSet<bayraklar>();

   int soruSayac = 0;
   int dogruSayac = 0;
   int yanlisSayac = 0;

   String bayrakresimAdi = "placeholder.png";
   String buttonAyazi ="";
    String buttonByazi ="";
   String buttonCyazi ="";
    String buttonDyazi ="";


    Future <void> sorulariAl () async
    {
      sorular = await bayraklardao().rasgele5Getir();
      sorulariYukle();
    }

  Future <void> sorulariYukle () async
  {
    yanlissecenekler = await bayraklardao().rasgele3Getir(dogruSoru.bayrak_id);
    dogruSoru = sorular[soruSayac];
    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlissecenekler[0]);
    tumSecenekler.add(yanlissecenekler[1]);
    tumSecenekler.add(yanlissecenekler[2]);


    buttonAyazi = tumSecenekler.elementAt(0).bayrak_ad;
    buttonByazi = tumSecenekler.elementAt(1).bayrak_ad;
    buttonCyazi = tumSecenekler.elementAt(2).bayrak_ad;
    buttonDyazi = tumSecenekler.elementAt(3).bayrak_ad;


    bayrakresimAdi = dogruSoru.bayrak_resim;

    setState(() {});

  }


  void soruSayacKontrol()
  {
    soruSayac ++;
    if(soruSayac !=5)
      {
        sorulariYukle();
      }
    else
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayisi: dogruSayac)));
      }
  }


  void dogruKontrol(String buttonYazi)
  {

     if(dogruSoru.bayrak_ad == buttonYazi)
      {
        dogruSayac++;
      }
      else
        {
          yanlisSayac++;
        }


  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   //sorulariYukle();
    sorulariAl();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Doğru: $dogruSayac", style:  TextStyle(fontSize: 18),),
                  Text("Yanlış: $yanlisSayac", style:  TextStyle(fontSize: 18)),
                ],
              ),

           soruSayac != 5 ? Text("${soruSayac+1}. Soru",style: TextStyle(fontSize: 30),)
            : Text("5. Soru",style: TextStyle(fontSize: 30),),
            Image.asset("images/$bayrakresimAdi",width: 350,),

          SizedBox(width: 200, height: 50,
            child: ElevatedButton(onPressed: ()
                {
                  dogruKontrol(buttonAyazi);
                  soruSayacKontrol();
                }, child: Text(buttonAyazi)),
          ),

            SizedBox(width: 200, height: 50,
              child: ElevatedButton(onPressed: ()
              {
                dogruKontrol(buttonByazi);
                soruSayacKontrol();
              }, child: Text(buttonByazi)),
            ),

            SizedBox(width: 200, height: 50,
              child: ElevatedButton(onPressed: ()
              {
                dogruKontrol(buttonCyazi);
                soruSayacKontrol();
              }, child: Text(buttonCyazi)),
            ),


            SizedBox(width: 200, height: 50,
              child: ElevatedButton(onPressed: ()
              {
                dogruKontrol(buttonDyazi);
                soruSayacKontrol();
              }, child: Text(buttonDyazi)),
            )


          ],
        ),
      ),

    );
  }
}
