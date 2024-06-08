import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  bool statusObsecure = true;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: const Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [Icon(Icons.star), Icon(Icons.do_not_touch)],
      ),
      body: ListView(
        children: [
          // Image.asset('lib/assets/images/Google-flutter.png'),
          Image.network(
              'https://coaching.course-net.com/img/logo_course_net_dark.a81c3f77.png'),
          Container(
            height: MediaQuery.sizeOf(context).height / 2,
            child: Card(
              elevation: 5,
              shadowColor: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.red)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: TextFormField(
                      controller: emailField,
                      keyboardType: TextInputType.emailAddress,
                      // onChanged: (value) {
                      //   setState(() {
                      //     email = value;
                      //   });
                      // },
                      decoration: InputDecoration(
                          hintText: 'Masukkan Email',
                          labelText: 'Email',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: TextFormField(
                      controller: passwordField,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: statusObsecure,
                      decoration: InputDecoration(
                          hintText: 'Masukkan Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  statusObsecure = !statusObsecure;
                                });
                              },
                              icon: Icon(statusObsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          ))),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        loginProcess();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
          Text('Email Anda : $email')
        ],
      ),
    );
  }

  void loginProcess() {
    setState(() {
      email = emailField.text;
    });
  }
}
