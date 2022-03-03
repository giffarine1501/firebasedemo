import 'package:firebasedemo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register by Firestore Database'),
      ),
      body: ListView(
        children: [
          txt(),
          name(),
          email(),
          password(),
          submit(),
        ],
      ),
    );
  }

  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  Future<void> addUser() {
    return users
        .add({
          'Name': _name.text,
          'Email': _email.text,
          'Password': _password.text,
        })
        .then((value) => print("Data has been successfully"))
        .catchError((error) => print("Failed to add data: $error"));
  }

  Container txt() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      alignment: Alignment.center,
      child: const Text(
        'Register',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }

  Container submit() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          registerWithEmail(_email.text, _password.text);
          addUser();
        },
        child: const Text(
          "Register",
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 50),
        ),
      ),
    );
  }

  Container password() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextFormField(
        controller: _password,
        obscureText: true,
        decoration: InputDecoration(
          label: Text(
            'Enter your password',
            style: TextStyle(color: Colors.grey[800], fontSize: 18),
          ),
          prefixIcon: const Icon(Icons.key),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.green,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  Container email() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextFormField(
        controller: _email,
        decoration: InputDecoration(
          label: Text(
            'Enter your Email',
            style: TextStyle(color: Colors.grey[800], fontSize: 18),
          ),
          prefixIcon: const Icon(Icons.mail),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.green,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  Container name() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: TextFormField(
        controller: _name,
        decoration: InputDecoration(
          label: Text(
            'Enter your name',
            style: TextStyle(color: Colors.grey[800], fontSize: 18),
          ),
          prefixIcon: const Icon(Icons.person),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}