import 'package:flutter/material.dart';
import 'package:sosyal_medya_uygulamasi/GonderiKarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final isimSoyad;
  final kullaniciAdi;
  final kapakResimLinki;
  final profilResimLinki;

  const ProfilSayfasi({this.isimSoyad, this.kullaniciAdi, this.kapakResimLinki, this.profilResimLinki}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 230.0,
                //color: Colors.yellow,
              ),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                    //color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage(
                            kapakResimLinki),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                left: 20.0,
                bottom: 0.0,
                child: Hero(
                  tag: kullaniciAdi,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        image: DecorationImage(
                            image: NetworkImage(
                                profilResimLinki),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                top: 190.0,
                left: 145.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isimSoyad,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      kullaniciAdi,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[200],
                      border: Border.all(width: 2.0, color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Takip Et",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context,true);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.yellow,
                  ))
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sayac("Takipçi","25K"),
                  sayac("Takip","500"),
                  sayac("Paylaşım","75")
                ],
              ),
            ),
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
    );
  }

  Column sayac(String baslik, String sayi) {
    return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sayi,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 1.0,),
                    Text(
                      baslik,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                      ),
                    ),
                  ],
                );
  }
}
