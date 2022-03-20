
import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  int dogruSayisi;


  SonucEkrani({required this.dogruSayisi});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Text("Doğru Sayısı: ${widget.dogruSayisi}, Yanlış Sayısı: ${5-widget.dogruSayisi}",style: TextStyle(fontSize: 25),),
            Text("% ${((widget.dogruSayisi*100)/5).toInt()} Başarı",style: TextStyle(fontSize: 30, color: Colors.pink),),
            SizedBox(width: 200, height: 50,
              child: ElevatedButton(onPressed: ()
              {
                Navigator.pop(context);
               // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayisi: 3)));
              }, child: Text("Tekrar Dene")),
            ),

          ],
        ),
      ),

    );
  }
}
