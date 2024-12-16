import 'package:flutter/material.dart';
import 'package:flutter_practical_project/screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcotroller = TextEditingController();
  TextEditingController confirmpawssword = TextEditingController();
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

  bool hide = true;
  bool hide2 = true;
  String? error_message;
  String? email;
  String? password;
  String? name;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcotroller.dispose();
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
                        "user name",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextFormField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                              size: 15,
                            ),
                            hintText: "Enter your username",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff969696),
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        keyboardType: TextInputType.name,
                        validator: (name) =>
                            name!.isEmpty ? 'please enter name' : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
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
                        height: 5,
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
                        validator: (password) =>
                            password!.length < 8 || password.isEmpty
                                ? 'Password should be at least 8'
                                : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Confirm Passwoed",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextFormField(
                        controller: confirmpawssword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hide2 = !hide2;
                              });
                            },
                            icon: Icon(hide2
                                ? Icons.visibility_off_rounded
                                : Icons.visibility),
                          ),
                          hintText: "Confirm your password",
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff969696),
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: hide2,
                        validator: (confpassword) => confpassword!.isEmpty ||
                                confpassword != passwordcotroller.text
                            ? 'Invalid Confirm password'
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
                        height: 5,
                      ),
                      if (error_message != null)
                        Center(
                          child: Text(
                            error_message!,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.red),
                          ),
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: const Color(0xff20473E),
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              email = emailcontroller.text;
                              name = namecontroller.text;
                              password = passwordcotroller.text;
                            });

                            // التحقق من صحة البيانات
                            if (formstate.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Sign up Successfully!')),
                              );
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => Login(
                                    email: email!,
                                    password: password!,
                                    name: name!)));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please enter Valied data')),
                              );
                            }

                          },
                          child: const Text(
                            "Sign Up",
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
                            child: Text("Already have an account ?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (_) {
                              //   return const Login();
                              // }));
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text("Sign in",
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
