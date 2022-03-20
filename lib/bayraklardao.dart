


import 'package:untitled52/bayraklar.dart';

import 'VeritabaniYardimcisi.dart';


class bayraklardao
{

  Future <List<bayraklar>> tumBayraklar () async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar");
    
    return List.generate(maps.length, (index){

      var satir = maps[index];

      
     // var k = kategoriler(satir["kategori_id"], satir["kategori_ad"] );
     // var y = yonetmenler(satir["yonetmen_id"],satir["yonetmen_ad"] );
      
      return bayraklar(satir["bayrak_id"],satir["bayrak_ad"] , satir["bayrak_resim"],);
    });
  }

  Future <List<bayraklar>> rasgele5Getir () async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (index){

      var satir = maps[index];


      // var k = kategoriler(satir["kategori_id"], satir["kategori_ad"] );
      // var y = yonetmenler(satir["yonetmen_id"],satir["yonetmen_ad"] );

      return bayraklar(satir["bayrak_id"],satir["bayrak_ad"] , satir["bayrak_resim"],);
    });
  }

  Future <List<bayraklar>> rasgele3Getir (int bayrak_id) async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (index){

      var satir = maps[index];


      // var k = kategoriler(satir["kategori_id"], satir["kategori_ad"] );
      // var y = yonetmenler(satir["yonetmen_id"],satir["yonetmen_ad"] );

      return bayraklar(satir["bayrak_id"],satir["bayrak_ad"] , satir["bayrak_resim"],);
    });
  }



}