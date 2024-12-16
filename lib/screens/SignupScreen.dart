import 'package:flutter/material.dart';
import 'package:flutter_practical_project/screens/LoginScreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  String? _email;
  String? _password;
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool hide = true;

  String? validatEmail(String? email) {
    RegExp emailregexp =
        RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$'); // Regullar Exprition
    final isEmailvalid = emailregexp.hasMatch(email ?? '');
    if (!isEmailvalid) {
      return "Please Enter Valid Email";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.amber,
        child: Center(
          child: Column(children: [
            const Icon(
              Icons.person_outlined,
              size: 100,
            ),
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroller,
                      maxLength: 30,
                      maxLines: 1,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(40)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)),
                          prefixIcon: const Icon(Icons.email),
                          prefixIconColor: Colors.blue,
                          hintText: "exampl3@gmail.com",
                          labelText: "Email or Username",
                          labelStyle:
                              const TextStyle(fontSize: 20, color: Colors.black)),
                      keyboardType: TextInputType.emailAddress,
                      validator: validatEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      maxLength: 24,
                      maxLines: 1,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(40)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)),
                          prefixIconColor: Colors.blue,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hide = !hide;
                              });
                            },
                            icon: Icon(hide
                                ? Icons.visibility_off_rounded
                                : Icons.visibility),
                          ),
                          suffixIconColor: Colors.blue,
                          hintText: "Enter your Password",
                          labelText: "Password",
                          labelStyle:
                              const TextStyle(fontSize: 20, color: Colors.black)),
                      obscureText: hide,
                      validator: (password) => password!.length < 8
                          ? 'Password should be at least 8'
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 350,
                      onPressed: () {
                        setState(() {
                          _email = emailcontroller.text;
                          _password = passwordcontroller.text;
                        });
                          if (_formkey.currentState!.validate()) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) {
                              return Loginscreen(email: _email!, password: _password!);
                            }));
                          }
                      },
                      color: Colors.blue,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
