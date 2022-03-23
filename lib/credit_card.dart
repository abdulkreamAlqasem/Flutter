import 'dart:ui';

import 'package:flutter/material.dart';
import "package:flutter/services.dart";

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

class Credit_card extends StatelessWidget {
  Credit_card({Key? key}) : super(key: key);
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
    } else {
      print("invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("بطاقة الائتمانية"),
        ),
      ),
      body: Form(
        key: formstate,
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: "أدخل الأسم الموجود على البطاقة",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)))),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19),
                  new CardNumberInputFormatter()
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "أدخل الرقم الموجود على البطاقة",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)))),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              Expanded(
                child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                    ],
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        labelText: "أدخل تاريخ إنتهاء البطاقة",
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)))),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "رمز امان البطاقة",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1))),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: send,
                child: Center(
                  child: Text("المتابعة للدفع"),
                )),
          )
        ]),
      ),
    );
  }
}
