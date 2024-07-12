import 'package:flutter/material.dart';
import 'package:team_quiz_app/screens/category_screen.dart';
import 'package:team_quiz_app/utils/globals.dart';
import '../utils/icons.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 45, 112, 48),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      alien,
                      height: 100,
                      width: 150,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 2 / 3,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: userNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username field can not be empty';
                            } else if (value.length < 3) {
                              return 'Username must be more than or equal to 3 characters';
                            }
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'username',
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password field can not be empty';
                            } else if (value.length < 6) {
                              return 'password must be more than or equal to 6 characters';
                            }
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: const Icon(Icons.visibility_off),
                              hintText: 'password',
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Spacer(),
                            const Text("New to quiz app?"),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                maximumSize: const Size(300, 40),
                                minimumSize: const Size(200, 40),
                                elevation: 10,
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                userName = userNameController.text;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        CategoryScreen(),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        Image.asset(
                          fingerprint,
                          height: 40,
                          width: 50,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Use touch id',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (val) {}),
                            const Text('Remember me'),
                            const Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Forget password'))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}