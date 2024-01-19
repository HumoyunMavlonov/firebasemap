

  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebasemap/model/user_request.dart';
  import 'package:firebasemap/util/status.dart';
  import 'package:get/get.dart';

  class RegisterController extends GetxController{
    static CollectionReference users =FirebaseFirestore.instance.collection("users");
    var status = Status.INITIAL.obs;

    Future<void> register(UserLocationRequest userLocationRequest) async{
      try{
        await users.doc().set(userLocationRequest.toMap());
      }catch(e){
        print(e);

      }
    }
  }
