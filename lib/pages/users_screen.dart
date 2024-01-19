import 'package:firebasemap/controllers/userlist_controller.dart';
import 'package:firebasemap/model/user_model.dart';
import 'package:firebasemap/model/user_model.dart';
import 'package:firebasemap/pages/all_users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'map_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("userlist", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<UserLocationModel>>(
            stream: Get.find<UsersController>().getAllUsersData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                );
              } else if (snapshot.hasData) {
                var list = snapshot.data ?? [];
                return Column(
                  children: [
                    Container(
                      width: 220,
                      height: 50,
                      margin: EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAll(AllFilialsMape(list));
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                        child: const Text(
                          "all users",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: buildUserItem(list, index),
                          );
                        }),
                  ],
                );
              } else {
                return Center(
                  child: Text("Error"),
                );
              }
            }),
      ),
    );
  }

  Card buildUserItem(List<UserLocationModel> list, int index) {
    return Card(
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  child: Icon(
                                    Icons.supervised_user_circle_outlined,

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        list[index].name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                    onTap: () async {
                                      Get.to( MapScreen(long: list[index].long,lat: list[index].lat,),
                                          transition: Transition.downToUp,
                                          duration: const Duration(
                                              milliseconds: 100),
                                          curve: Curves.bounceInOut);
                                    },
                                    child: const Icon(Icons.location_city_outlined))

                              ],
                            ),
                          ),
                        );
  }
}
