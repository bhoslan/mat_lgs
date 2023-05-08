import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mat_lgs/view/general_state.dart';
import 'package:mat_lgs/view/home_page.dart';
import 'package:mat_lgs/view/login/login_page.dart';

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
                  )),
            )),
          ),
          ListTile(
            leading: const Icon(Icons.home, size: 25),
            title: Text(
              "Anasayfa",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "assets/images/open-book.png",
                  color: Colors.grey,
                )),
            title: Text(
              "Soru ve Konu Takibi",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "assets/images/openbook.png",
                  color: Colors.grey,
                )),
            title: Text(
              "2020 Örnek Sorular",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "assets/images/openbook2.png",
                  color: Colors.grey,
                )),
            title: Text(
              "2021 Örnek Sorular",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "assets/images/dart.png",
                  color: Colors.grey,
                )),
            title: Text(
              "Günlük Hedefler",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "assets/images/calculator.png",
                  color: Colors.grey,
                )),
            title: Text(
              "Puan Hesapla",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {},
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
            leading: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "assets/images/information.png",
                  color: Colors.grey,
                )),
            title: Text(
              "Genel Sorular",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {},
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
