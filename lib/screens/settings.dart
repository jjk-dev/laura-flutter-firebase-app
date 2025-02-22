import 'package:app/screens/edit_profile.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_dialogs/material_dialogs.dart';
import '../providers/auth_service.dart';
import './login.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  void requestLogOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
        (Route<dynamic> route) => false);

    await Future.delayed(const Duration(seconds: 2), () {
      prefs.remove("user_id");
    });

    await Authentication.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 50),
                const Text(
                  'User name',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  '${currentUser!.displayName}',
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Email',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  '${currentUser!.email}',
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                ),
                const SizedBox(height: 50),
                IconsButton(
                  padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                  text: '프로필 수정',
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfile()),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            height: 10,
            color: Colors.black12,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50),
                const Text(
                  'Laura v1.0',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                const SizedBox(height: 50),
                IconsButton(
                  padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                  text: '로그아웃',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  textStyle: const TextStyle(color: Colors.grey, fontSize: 20),
                  onPressed: () {
                    Dialogs.materialDialog(
                      msg: '로그아웃 하시겠습니까?',
                      // title: '로그아웃',
                      context: context,
                      actions: [
                        IconsButton(
                          text: '취소',
                          iconData: Icons.cancel_outlined,
                          color: Colors.grey,
                          textStyle: const TextStyle(color: Colors.white),
                          iconColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        IconsButton(
                          text: '로그아웃',
                          iconData: Icons.logout,
                          color: Colors.redAccent,
                          textStyle: const TextStyle(color: Colors.white),
                          iconColor: Colors.white,
                          onPressed: () {
                            requestLogOut();
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
