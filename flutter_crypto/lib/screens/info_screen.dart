import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/sha-256.png',
            ),
            scale: 3,
            opacity: 0.1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                titleTextWidget('Secure Hashing Nedir?'),
                const SizedBox(height: 10.0),
                textWidget(
                    '''\tSecure Hashing, şifreleme alanında geliştirilmiş olan algoritmalardan yararlanarak siz kullanıcılarımızın verilerini en güvenilir şekilde şifrelemeyi gerçekleştirmektedir. 
                    \nSizlere sunulan:'''),
                const SizedBox(height: 8.0),
                textListWidget('SHA-1'),
                textListWidget('SHA-224'),
                textListWidget('SHA-256'),
                textListWidget('SHA-384'),
                textListWidget('SHA-512'),
                textListWidget('SHA-512/224'),
                textListWidget('SHA-512/256'),
                textListWidget('MD-5'),
                const SizedBox(height: 8.0),
                textWidget(
                    '''şifreleme algoritmalarından bir tanesini seçtikten sonra verilerinizi girerek şifreleme işlemini gerçekleştirebilirsiniz. 
                    \nDilerseniz verilerinizi girdikten sonra 'Büyük Harfe Çevir' kutucuğuna tıklayarak şifreleme sonuçunuzu büyük harflere çevirebilirsiniz. Şifreleme işleminiz sona erdiği zaman sizi açılır pencere karşılayacaktır. Sonuçlarınız bu açılır pencere ile size sunulmaktadır.
                    \nŞifrelemiş olduğunuz sonuçlarınızı panonıza kopyalayabilirsiniz veyahut paylaşma özelliği ile istediğiniz şekilde paylaşabilrsiniz.
                    '''),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: bottomTextWidget(),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      title: const Text('Uygulama Hakkında'),
      backgroundColor: const Color.fromARGB(255, 2, 77, 138),
    );
  }

  Row textListWidget(String text) {
    return Row(
      children: [
        const SizedBox(width: 40.0),
        const Icon(
          Icons.circle,
          size: 7.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(fontSize: 20.0),
          textScaleFactor: 1.05,
        )
      ],
    );
  }

  Text titleTextWidget(String data) {
    return Text(
      data,
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      textScaleFactor: 1.1,
    );
  }

  Text textWidget(String data) {
    return Text(
      data,
      style: const TextStyle(fontSize: 18.0),
      textAlign: TextAlign.justify,
      textScaleFactor: 1.1,
    );
  }

  Padding bottomTextWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.copyright,
            size: 13.0,
          ),
          SizedBox(width: 5.0),
          Text(
            '2023 - Developed by ',
            style: TextStyle(fontSize: 12.0),
          ),
          Text(
            'Hüseyin ADIGÜZEL',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
