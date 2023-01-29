import 'dart:convert';
import 'dart:developer';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_crypto/screens/info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isChecked = false;
  TextEditingController dataController = TextEditingController();
  TextEditingController dropController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                titleTextWidget(),
                const SizedBox(height: 12.0),
                dropDownButtonWidget(),
                const SizedBox(height: 16.0),
                dataTextFieldWidget(),
                toUpperCheckBoxWidget(),
                const SizedBox(height: 18.0),
                calculateButtonWidget(context),
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
      title: const Text('Data Encryption'),
      backgroundColor: const Color.fromARGB(255, 2, 77, 138),
      actions: [
        IconButton(
          icon: const Icon(Icons.info),
          iconSize: 22.0,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InfoScreen(),
            ),
          ),
        ),
      ],
    );
  }

  Text titleTextWidget() {
    return const Text(
      'Algoritma Seçiniz',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }

  DropdownButtonFormField<String> dropDownButtonWidget() {
    return DropdownButtonFormField(
      items: [
        dropDownMenuItemWidget('SHA-1', 'SHA-1'),
        dropDownMenuItemWidget('SHA-224', 'SHA-224'),
        dropDownMenuItemWidget('SHA-256', 'SHA-256'),
        dropDownMenuItemWidget('SHA-384', 'SHA-384'),
        dropDownMenuItemWidget('SHA-512', 'SHA-512'),
        dropDownMenuItemWidget('SHA-512/224', 'SHA-512/224'),
        dropDownMenuItemWidget('SHA-512/256', 'SHA-512/256'),
        dropDownMenuItemWidget('MD-5', 'MD-5'),
      ],
      onChanged: (String? selectedValue) {
        setState(() {
          dropController.text = selectedValue!;
        });
      },
      decoration: InputDecoration(
        hintText: 'Algoritmalar',
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  DropdownMenuItem<String> dropDownMenuItemWidget(String value, String text) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 47, 85),
        ),
      ),
    );
  }

  TextField dataTextFieldWidget() {
    return TextField(
      controller: dataController,
      maxLines: 10,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'Hesaplanacak Veri',
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  Row toUpperCheckBoxWidget() {
    return Row(
      children: [
        Checkbox(value: _isChecked, onChanged: checkBoxFunction),
        const Text('Büyük Harfe Çevir'),
      ],
    );
  }

  checkBoxFunction(bool? value) {
    if (_isChecked == false) {
      setState(() {
        _isChecked = true;
      });
    } else {
      setState(() {
        _isChecked = false;
      });
    }
  }

  SizedBox calculateButtonWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color.fromARGB(255, 2, 77, 138),
        onPressed: () {
          calculateFunction(dataController.text);
        },
        child: const Text('Hesapla'),
      ),
    );
  }

  calculateFunction(String data) {
    var bytes = utf8.encode(data.toString());
    var bytesConvert;
    if (dropController.text == '' || dataController.text == '') {
    } else {
      switch (dropController.text) {
        case 'SHA-1':
          bytesConvert = sha1.convert(bytes);
          log('SHA-1 $bytesConvert');
          break;
        case 'SHA-224':
          bytesConvert = sha224.convert(bytes);
          log('SHA-224 $bytesConvert');
          break;
        case 'SHA-256':
          bytesConvert = sha256.convert(bytes);
          log('SHA-256 $bytesConvert');
          break;
        case 'SHA-384':
          bytesConvert = sha384.convert(bytes);
          log('SHA-384 $bytesConvert');
          break;
        case 'SHA-512':
          bytesConvert = sha512.convert(bytes);
          log('SHA-512 $bytesConvert');
          break;
        case 'SHA-512/224':
          bytesConvert = sha512224.convert(bytes);
          log('SHA-512/224 $bytesConvert');
          break;
        case 'SHA-512/256':
          bytesConvert = sha512256.convert(bytes);
          log('SHA-512/256 $bytesConvert');
          break;
        case 'MD-5':
          bytesConvert = md5.convert(bytes);
          log('MD-5 $bytesConvert');
          break;
        default:
          break;
      }
      if (_isChecked == true) {
        resultDialogWidget(bytesConvert.toString().toUpperCase());
      } else {
        resultDialogWidget(bytesConvert.toString());
      }
    }
  }

  Future<dynamic> resultDialogWidget(String text) {
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(dropController.text),
            content: Text(
              text,
            ),
            actions: [
              TextButton(
                onPressed: () => FlutterClipboard.copy(text),
                child: const Text('Panoya Kopyala'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Kapat'),
              ),
            ],
          )),
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
            'Developed by ',
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
