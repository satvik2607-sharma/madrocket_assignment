import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madrocket_assignment/features/auth/auth_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Subash Stationary',
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/logo.jpg'),
                ),
                SizedBox(
                  height: 20,
                ),
                login
                    ? Container()
                    : TextFormField(
                        key: ValueKey('fullname'),
                        decoration: InputDecoration(
                            hintText: 'Enter Full Name',
                            hintStyle: GoogleFonts.aBeeZee(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Full Name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            fullname = value!;
                          });
                        },
                      ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  key: ValueKey('email'),
                  decoration: InputDecoration(
                      hintText: 'Enter Email',
                      hintStyle: GoogleFonts.aBeeZee(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please Enter valid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  key: ValueKey('password'),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle: GoogleFonts.aBeeZee(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Please Enter Password of min length 6';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          login
                              ? AuthServices.signinUser(
                                  email, password, context)
                              : AuthServices.signupUser(
                                  email, password, fullname, context);
                        }
                      },
                      child: Text(login ? 'Login' : 'Signup')),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        login = !login;
                      });
                    },
                    child: Text(login
                        ? "Don't have an account? Signup"
                        : "Already have an account? Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
