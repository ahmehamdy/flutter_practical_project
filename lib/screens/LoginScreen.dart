import 'package:flutter/material.dart';
import 'package:flutter_practical_project/screens/SignupScreen.dart';

final _formkey = GlobalKey<FormState>();

class Loginscreen extends StatefulWidget {
  final String email;
  final String password;
  const Loginscreen({super.key, required this.email, required this.password});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool hide = true;
  String? error_message;

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
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          children: [
            const Icon(
              Icons.lock_open_outlined,
              size: 150,
              color: Colors.white,
            ),
            const Text(
              "Fast Food App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Form(
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
                                  borderSide:
                                      const BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.circular(40)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              prefixIcon: const Icon(Icons.email),
                              prefixIconColor: Colors.blue,
                              hintText: "exampl3@gmail.com",
                              labelText: "Email or Username",
                              labelStyle: const TextStyle(
                                  fontSize: 20, color: Colors.black)),
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
                                  borderSide:
                                      const BorderSide(color: Colors.green),
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
                              labelStyle: const TextStyle(
                                  fontSize: 20, color: Colors.black)),
                          obscureText: hide,
                          validator: (password) => password!.length < 8
                              ? 'Password should be at least 8'
                              : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (error_message != null)
                          Text(
                            error_message!,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.red),
                          ),
                        const SizedBox(
                          height: 50,
                        ),
                        MaterialButton(
                          height: 50,
                          minWidth: 350,
                          onPressed: () {
                            if (emailcontroller.text == widget.email &&
                                passwordcontroller.text == widget.password) {
                              setState(() {
                                error_message = null;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Login Successful!')),
                              );
                            } else {
                              // فشل تسجيل الدخول
                              setState(() {
                                error_message = 'Invalid email or password';
                              });
                            }
                          },
                          color: Colors.blue,
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20),
                          child: Row(
                            children: [
                              const Text(
                                "Don't Have An Acount? ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (_) {
                                    return const Signupscreen();
                                  }));
                                },
                                child: const Text(
                                  "Register Now",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
