import 'dart:convert';
import 'dart:developer';
import 'package:clipboard/clipboard.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto/web/app_colors.dart';
import 'package:flutter_crypto/web/app_styles.dart';
import 'package:flutter_crypto/web/responsive_widget.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  bool _isChecked = false;
  TextEditingController dataController = TextEditingController();
  TextEditingController dropController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: AppColors.mainBlueColor,
                      child: Center(
                        child: Text(
                          'Data Encryption',
                          style: ralewayStyle.copyWith(
                            fontSize: 48.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.032
                        : height * 0.12),
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Let’s',
                                style: ralewayStyle.copyWith(
                                  fontSize: 25.0,
                                  color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Start 👇',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.blueDarkColor,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "Hello, Encrypt your data by \nchoosing your algorithm." /*  'Hey, Enter your details to get sign in \nto your account.' */,
                        style: ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Algorithm" /*  'Email' */,
                          style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child:
                            dropDownButtonWidget(), /* TextFormField(
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.blueDarkColor,
                            fontSize: 12.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppIcons.emailIcon),
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: "Select Algorithm" /*  'Enter Email' */,
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor.withOpacity(0.5),
                              fontSize: 12.0,
                            ),
                          ),
                        ), */
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Data/Data to be Encrypted" /*  'Password' */,
                          style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 150.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: TextField(
                          controller: dataController,
                          maxLines: 9,
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.blueDarkColor,
                            fontSize: 12.0,
                          ),
                          // obscureText: true,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                            /*  suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppIcons.eyeIcon),
                            ), */
                            prefixIcon: const IconButton(
                              onPressed: null,
                              icon: Icon(Icons
                                  .data_array_rounded) /* Image.asset(AppIcons.lockIcon) */,
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: "Enter Data" /* 'Enter Password' */,
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor.withOpacity(0.5),
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            checkBoxFunction(_isChecked);
                          },
                          child: Text(
                            "Capitalize All !" /* 'Forgot Password?' */,
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: _isChecked == true
                                  ? AppColors.mainBlueColor
                                  : Colors.red[900],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            calculateFunction(dataController.text);
                          },
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: AppColors.mainBlueColor,
                            ),
                            child: Text(
                              "Encrypt" /* 'Sign In' */,
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
      style: ralewayStyle.copyWith(
        fontWeight: FontWeight.w400,
        color: AppColors.blueDarkColor,
        fontSize: 12.0,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: const IconButton(
          onPressed: null,
          icon: Icon(Icons.code_rounded),
          /*  Image.asset("assets/images/1471299.png" /* AppIcons.emailIcon */), */
        ),
        contentPadding: const EdgeInsets.only(top: 16.0),
        hintText: "Select Algorithm" /*  'Enter Email' */,
        hintStyle: ralewayStyle.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.blueDarkColor.withOpacity(0.5),
          fontSize: 12.0,
        ),
      ),
      /* decoration: InputDecoration(
        hintText: 'Algoritmalar',
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ), */
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

  calculateFunction(String data) {
    var bytes = utf8.encode(data.toString());
    var bytesConvert;
    if (dropController.text == '' || dataController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('There are empty fields!'),
        ),
      );
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
            title: Text(
              dropController.text,
              style: const TextStyle(color: AppColors.mainBlueColor),
            ),
            content: Text(
              text,
            ),
            actions: [
              TextButton(
                onPressed: () => FlutterClipboard.copy(text),
                child: const Text(
                  'Copy',
                  style: TextStyle(color: AppColors.mainBlueColor),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.red[900]),
                ),
              ),
            ],
          )),
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
}
