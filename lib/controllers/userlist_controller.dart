

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasemap/model/user_model.dart';
import 'package:firebasemap/model/user_request.dart';
import 'package:firebasemap/util/status.dart';
import 'package:get/get.dart';

class UsersController extends GetxController{
  static CollectionReference users =FirebaseFirestore.instance.collection("users");
  var status = Status.INITIAL.obs;

  Stream<List<UserLocationModel>> getAllUsersData() =>
      users.snapshots().map((snapshot) => snapshot.docs
          .map((e) =>
          UserLocationModel.fromMap(e.data() as Map<String, dynamic>, e.id))
          .toList());
}
