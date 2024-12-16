import 'package:flutter/material.dart';
import 'package:flutter_practical_project/screens/HomeScreen.dart';
import 'package:flutter_practical_project/screens/signup.dart';

class Login extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  const Login(
      {super.key,
      required this.email,
      required this.password,
      required this.name});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? inputEmail;
  String? inputPassword;
  bool hide = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcotroller = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

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
      appBar: AppBar(),
      body: Form(
        key: formstate,
        child: ListView(
          children: [
            SizedBox(
              width: 100,
              height: 200,
              child: Image.asset("assets/images/logo.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: const Color(0xffFBD57D),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                              size: 15,
                            ),
                            hintText: "Enter your email",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff969696),
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        keyboardType: TextInputType.emailAddress,
                        validator: validatEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Passwoed",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextFormField(
                        controller: passwordcotroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                          hintText: "Enter your password",
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff969696),
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: hide,
                        validator: (password) => password!.length < 8
                            ? 'Password should be at least 8'
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff363636),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: const Color(0xff20473E),
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              inputEmail = emailcontroller.text;
                              inputPassword = passwordcotroller.text;
                            });
                            if (formstate.currentState!.validate() ||
                                inputEmail == widget.email ||
                                inputPassword == widget.password) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Log in Successfully!')),
                              );
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Homescreen(
                                      email: widget.email,
                                      name: widget.name,
                                      password: widget.password,
                                      )));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please enter Valied data')),
                              );
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Don't have an account ?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return const Signup();
                              }));
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Sign Up",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
