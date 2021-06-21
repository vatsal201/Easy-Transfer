import 'package:easy_transfer/send.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatelessWidget {
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xFF667eea), Color(0xFF764ba2)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 80, 0, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'File',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white,
                            fontFamily: 'Comfortaa'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Transfer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white,
                            fontFamily: 'Comfortaa'),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                prefixIcon: Icon(Icons.person,
                                    color: Colors.white, size: 30),
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Comfortaa'),
                                hintText: 'e.g. Viraj',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Comfortaa')),
                            validator: (text) {
                              if (text.isEmpty)
                                return 'Username can\'t be empty.';
                              else if (text.length < 3)
                                return 'Username must be at least 3 characters.';
                              else if (text.length > 10)
                                return 'Username must be less than 10 characters.';
                              else
                                return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      child: Text('Continue',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF667eea))),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          var nameEntered = nameController.text;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Send(userName1: nameEntered)),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
