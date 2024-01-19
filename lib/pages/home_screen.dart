import 'package:firebasemap/pages/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 50,),
            Container(
              width: 220,
              height: 50,
              margin: EdgeInsets.only(top: 25),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(UsersScreen());
                },
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.black)),
                child: const Text(
                  "Users",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
