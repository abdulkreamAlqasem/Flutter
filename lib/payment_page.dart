import 'package:flutter/material.dart';
import 'package:payment_page/credit_card.dart';

class Payment_page extends StatefulWidget {
  Payment_page({Key? key}) : super(key: key);

  @override
  State<Payment_page> createState() => _Payment_pageState();
}

class _Payment_pageState extends State<Payment_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("طرق الدفع"),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: ListTile(
                  title: Text(
                    "بطاقة الائتمانية",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.credit_card),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Credit_card();
                    }));
                  })),
          Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "نقد",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.money),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              )),
          Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "طلب خدمة تطوعية",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.volunteer_activism_rounded),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              )),
        ],
      )),
    );
  }
}
