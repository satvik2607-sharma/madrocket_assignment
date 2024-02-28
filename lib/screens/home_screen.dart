import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madrocket_assignment/features/auth/ui/login.dart';
import 'package:madrocket_assignment/vendor1/vendor1_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => LoginForm()));
                  },
                  child: Text('Yes'))
            ],
          );
        });
  }

  final List<String> quantity = ['Low', 'Medium', 'High'];
  String quantity1 = '';
  String quantity2 = '';
  String quantity3 = '';

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!!',
                style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please select the quantity of each item',
                style: GoogleFonts.aBeeZee(color: Colors.grey),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'PEN',
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 9,
              ),
              DropdownButtonFormField2(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                items: quantity
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select the quantity';
                  }
                },
                onChanged: (value) {
                  setState(() {
                    quantity1 = value.toString();
                  });
                },
                onSaved: (newValue) {
                  quantity1 = newValue.toString();
                },
              ),
              SizedBox(
                height: 25,
              ),
              Text('PENCIL',
                  style:
                      GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20)),
              SizedBox(
                height: 9,
              ),
              DropdownButtonFormField2(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                items: quantity
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select the quantity';
                  }
                },
                onChanged: (value) {
                  setState(() {
                    quantity2 = value.toString();
                  });
                },
                onSaved: (newValue) {
                  quantity2 = newValue.toString();
                },
              ),
              SizedBox(
                height: 25,
              ),
              Text('BOOKS',
                  style:
                      GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20)),
              SizedBox(
                height: 15,
              ),
              DropdownButtonFormField2(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                items: quantity
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select the quantity';
                  }
                },
                onChanged: (value) {
                  setState(() {
                    quantity3 = value.toString();
                  });
                },
                onSaved: (newValue) {
                  quantity3 = newValue.toString();
                },
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Vendor1HomeScreen(quantity1: quantity1)));
                      },
                      child: Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}
