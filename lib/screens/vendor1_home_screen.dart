import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Vendor1HomeScreen extends StatefulWidget {
  var quantity1;
  Vendor1HomeScreen({
    Key? key,
    required this.quantity1,
  }) : super(key: key);

  @override
  State<Vendor1HomeScreen> createState() => _Vendor1HomeScreenState();
}

class _Vendor1HomeScreenState extends State<Vendor1HomeScreen> {
  Future<void> showAlertDialog() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Log Out!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text('Are you sure you want to logout?')],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                  child: Text('No')),
              TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                  child: Text('Yes'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showAlertDialog();
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!!',
                style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pen',
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${widget.quantity1}",
                    style: GoogleFonts.aBeeZee(color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
