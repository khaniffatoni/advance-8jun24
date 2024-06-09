import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  bool statusObsecure = true;
  String? email;
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
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 2,
            child: Card(
              elevation: 5,
              shadowColor: Colors.amber,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.red)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: TextFormField(
                        controller: emailField,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == '') {
                            return 'Isi field ini';
                          } else if (!value!.contains('@')) {
                            return 'Bukan email, silahkan input ulang';
                          }
                          return null;
                        },
                        // onChanged: (value) {
                        //   setState(() {
                        //     email = value;
                        //   });
                        // },
                        decoration: const InputDecoration(
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
                        validator: (value) {
                          if (value == '') {
                            return 'Isi field ini';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Masukkan Password',
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    statusObsecure = !statusObsecure;
                                  });
                                },
                                icon: Icon(statusObsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            border: const OutlineInputBorder(
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
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Text('Email Anda : ${email ?? '-'}')
        ],
      ),
    );
  }

  void loginProcess() {
    if (_formKey.currentState!.validate()) {
      Fluttertoast.showToast(
          msg: 'Success',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.green);
    }
    
    // if (emailField.text.isEmpty || passwordField.text.isEmpty) {
    // example : toast
    // Fluttertoast.showToast(
    //     msg: 'Lengkapi semua field isian!!',
    //     toastLength: Toast.LENGTH_SHORT,
    //     backgroundColor: Colors.red);
    // example : snackbar
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text('Lengkapi semua field isian!!!'),
    //   backgroundColor: Colors.red,
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    //   action: SnackBarAction(
    //       label: 'Dismiss',
    //       onPressed: () => ScaffoldMessenger.of(context).clearSnackBars()),
    // ));
    // example : alert dialog
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       content: Text('Lengkapi semua field isian!!!'),
    //       actions: [
    //         TextButton(
    //             onPressed: () => Navigator.pop(context),
    //             child: Text('Dismiss'))
    //       ],
    //     );
    //   },
    // );
    // } else {}
  }
}
