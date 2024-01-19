

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasemap/model/user_request.dart';

class AppRepository{

  static CollectionReference users = FirebaseFirestore.instance.collection("users");

  static void register(UserLocationRequest userLocationRequest){
    try{
       users.doc().set(userLocationRequest);
    }catch(e){
      print(e);
    }
  }

}
