import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sosyal_medya_uygulamasi/GonderiKarti.dart';
import 'package:sosyal_medya_uygulamasi/profilSayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sociaword',
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.grey, size: 32.0),
        ),
        title: Text(
          "Sociaword",
          style: TextStyle(fontSize: 20.0, color: Colors.grey),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showModalBottomSheet(context: context, builder: (BuildContext context){
                return Column(
                  children: [
                    duyuru("Kamil seni takip etti","3 dk önce"),
                    duyuru("Beyza sana mesaj gönderdi","1 hafta önce"),
                    duyuru("Kamil seni takip etti","3 dk önce"),
                  ],
                );
              });
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.purple[300],
              size: 32.0,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 3.0),
                blurRadius: 5.0,
              )
            ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                profilKartiOlustur("Rumeysa",
                    "https://cdn.pixabay.com/photo/2019/11/03/20/11/portrait-4599553__340.jpg","Rumeysa Taş","https://cdn.pixabay.com/photo/2021/12/27/01/30/christmas-6896107_960_720.jpg"),
                profilKartiOlustur("İbrahim",
                    "https://cdn.pixabay.com/photo/2014/04/12/14/59/portrait-322470__340.jpg","İbrahim Cura","https://cdn.pixabay.com/photo/2021/12/23/16/38/animal-6889575__340.jpg"),
                profilKartiOlustur("Şükran",
                    "https://cdn.pixabay.com/photo/2016/03/26/22/13/man-1281562__340.jpg","Şükran Gündüz","https://cdn.pixabay.com/photo/2021/12/19/10/42/old-6880626__340.jpg"),
                profilKartiOlustur("Cem",
                    "https://cdn.pixabay.com/photo/2017/04/06/19/34/girl-2209147__340.jpg","Cem Ak","https://cdn.pixabay.com/photo/2021/12/21/14/47/castle-6885449__340.jpg"),
                profilKartiOlustur("İsmail Efe",
                    "https://imgrosetta.mynet.com.tr/file/13216595/13216595-1080xauto.jpg","İsmail Efe","https://cdn.pixabay.com/photo/2021/11/09/15/32/christmas-6781762__340.jpg"),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GonderiKarti(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2019/11/03/20/11/portrait-4599553__340.jpg",
            gonderResimLinki:
                "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159_960_720.jpg",
            isimSoyad: "Rumeysa Taş",
            gecenSure: "1 saat önce",
            aciklama: "Bulamadım",
          ),
          GonderiKarti(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2019/11/03/20/11/portrait-4599553__340.jpg",
            gonderResimLinki:
                "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159_960_720.jpg",
            isimSoyad: "Rumeysa Taş",
            gecenSure: "1 saat önce",
            aciklama: "Bulamadım",
          ),
          GonderiKarti(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2019/11/03/20/11/portrait-4599553__340.jpg",
            gonderResimLinki:
                "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159_960_720.jpg",
            isimSoyad: "Rumeysa Taş",
            gecenSure: "1 saat önce",
            aciklama: "Bulamadım",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.purple[300],
        child: Icon(Icons.add_a_photo,color: Colors.white,),
      ),
    );
  }

  Padding duyuru(String mesaj, String gecenSure) {
    return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(mesaj),
                        Text(gecenSure),
                      ],
                    ),
                  );
  }

  Widget profilKartiOlustur(String kullaniciAdi, String resimLinki,String isimSoyad,String kapakResimLinki) {
    return Material(
      child: InkWell(
        onTap: () async {
      bool donenVeri= await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProfilSayfasi(profilResimLinki: resimLinki,kullaniciAdi: kullaniciAdi, isimSoyad: isimSoyad,kapakResimLinki: kapakResimLinki,)));
      if(donenVeri){
        print("döndü");
      }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                              image: NetworkImage(resimLinki), fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(height: 4.0),
              Text(
                kullaniciAdi,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
