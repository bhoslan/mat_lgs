import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mat_lgs/view/generalInfo/general_info.dart';
import 'package:mat_lgs/view/generalState/general_state.dart';
import 'package:mat_lgs/view/home_page.dart';
import 'package:mat_lgs/view/login/login_page.dart';
import 'package:mat_lgs/view/test/test_info_page.dart';
import 'package:mat_lgs/view/trueFalse/true_false_info_page.dart';
import 'package:mat_lgs/view/video/video_info_page.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    Key? key,
  }) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        children: [
          Container(
            width: 250,
            height: 150,
            color: Colors.blueGrey.shade900,
            child: DrawerHeader(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Image.asset(
                    "assets/images/goal2.png",
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 25,
            ),
            title: Text(
              "Anasayfa",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const SizedBox(
                width: 24,
                height: 24,
                child: Icon(
                  Icons.video_library,
                  //color: Colors.black,
                )),
            title: Text(
              "Videolar",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoInfoPage()));
            },
          ),
          ListTile(
            leading: const SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                Icons.radio_button_checked,
              ),
            ),
            title: Text(
              "Testler",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TestInfoPage()));
            },
          ),
          ListTile(
            leading: const SizedBox(
                width: 24,
                height: 24,
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: Icon(Icons.done),
                    ),
                    SizedBox(
                      width: 8,
                      height: 8,
                      child: Icon(Icons.close),
                    )
                  ],
                )),
            title: Text(
              "Doğru-Yanlış",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TrueFalseInfoPage()));
            },
          ),
          ListTile(
            leading: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "assets/images/bar-chart.png",
                  color: Colors.grey,
                )),
            title: Text(
              "Genel Durum",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const GeneralState()));
            },
          ),
          ListTile(
            leading: const SizedBox(width: 24, height: 24, child: Icon(Icons.info)),
            title: Text(
              "Genel Bilgiler",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const GeneralInfo()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const SizedBox(
              width: 24,
              height: 24,
              child: Icon(Icons.logout),
            ),
            title: Text(
              "Çıkış Yap",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              _auth.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
