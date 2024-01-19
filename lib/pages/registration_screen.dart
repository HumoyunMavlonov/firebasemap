import 'package:firebasemap/controllers/registercontroller.dart';
import 'package:firebasemap/model/user_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/location_service.dart';
import '../util/app_lat_long.dart';
import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<AppLatLong> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    return location;
  }

  @override
  void initState() {
    super.initState();
    _initPermission();
  }

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150,),
          buildnameEdit(),
          Container(
            margin: const EdgeInsets.only(top: 25),
            width: 200,
            height: 45,
            child: ElevatedButton(
                onPressed: () async {
                  var location = await _fetchCurrentLocation();
                  Get.find<RegisterController>().register(UserLocationRequest(
                      name: nameController.text,
                      lat: location.lat.toString(),
                      long: location.long.toString()));

                  Get.offAll(const HomeScreen(),
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceInOut);
                  Get.snackbar(
                    "",
                    "You registered successfully!",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }


  Padding buildnameEdit() {
    return Padding(
      padding: const EdgeInsets.only(top: 15,  left: 25, right: 25),
      child: TextField(
        controller: nameController,
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          hintText: "Name",
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
