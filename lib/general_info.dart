// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'component/custom_drawer_widget.dart';

class GeneralInfo extends StatefulWidget {
  const GeneralInfo({super.key});

  @override
  _GeneralInfoState createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  bool isWidgetVisible1 = false;
  bool isWidgetVisible2 = false;
  bool isWidgetVisible3 = false;
  bool isWidgetVisible4 = false;
  bool isWidgetVisible5 = false;
  String question1 = "Öğrencinin ortaokuldaki başarısı liseye geçişte etkili oluyor mu?";
  String answer1 =
      "Merkezi sınavla girilecek okullarda ortaokul notlarının önemi yok.Sınavsız kayıt yapılacak liselerde başvuru kontenjandan fazla değilse öğrencilerin tercihlerine yerleşecek ancak başvurunun kontenjandan fazla olması durumunda Ortaokul Başarı Puanı (OBP) etkin olacak. OBP’ye 5. sınıf dahil değil. OBP, öğrencinin 6,7,8. sınıf başarı puanlarının ortalaması alınarak hesaplanacak. Öğrenci bu puanın üstünlüğüne göre okula yerleşecek. OBP eşit ise sırasıyla öncelikle 8 inci, 7 nci ve 6 ncı sınıf yılsonu başarı puanı yüksek olana, yine eşitliğin bozulmaması hâlinde ise yaşı küçük olana öncelik verilecek. ";
  String question2 = "Hangi okullara merkezi sınav puanıyla girilecek?";
  String answer2 =
      "Fen liseleri, sosyal bilimler liseleri, proje uygulayan eğitim kurumları ile mesleki ve teknik Anadolu liselerinin Anadolu teknik programlarına merkezi sınav puanıyla girilecek.";
  String question3 = "Sınavsız girilen okullara kayıtta öncelik neler?";
  String answer3 =
      "İlk öncelik öğrencinin devam ettiği ortaokuldur. il/ilçe millî eğitim müdürlüğünce ortaokul ve liseler birbirleri ile eşleştirilecek ve çocuğunuz ilk önce okulunun eşleştiği okullar için tercihte bulunacaktır. Tercih ettiği okula müracaat kontenjandan fazla değilse oraya yerleştirilecek.Başvurunun kontenjandan fazla olması durumunda 9 uncu sınıflarda sırasıyla; OBP, 8 inci, 7 nci ve 6 ncı sınıf yılsonu başarı puanı yüksek olana, eşitliğin bozulmaması hâlinde yaşı küçük olana öncelik verilecek.";
  String question4 = "Kayıt alanındaki tercih ettiği okula yerleşemeyen öğrenci ne olacak?";
  String answer4 =
      "Ortaöğretim kayıt alanı içindeki okullara yerleşemeyen öğrenciler aynı merkez ilçe/ilçedeki diğer ortaöğretim kayıt alanlarındaki boş kontenjanı bulunan okullara tercihe ve OBP üstünlüğüne bağlı olarak yerleştirilecek";
  String question5 = "Öğrenciler nakil yapabilecek mi?";
  String answer5 =
      "Ortaöğretim kurumları arasında nakil hakkı olup buna ilişkin yönetmelikte ayrıntılı düzenleme yapılmıştır. Sınavsız kayıt yapan okullar açısından Okul türlerinin her birinin kendi arasında her sınıf seviyesinde, Okul türleri arasında 10 uncu sınıf sonuna kadar nakil hakkı vardır.";

  @override
  Widget build(BuildContext context) {
    const String title = "Genel Bilgiler";
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isWidgetVisible1 = !isWidgetVisible1;
                });
              },
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      child: Text(
                        textAlign: TextAlign.left,
                        question1,
                        style: const TextStyle(
                            color: Colors.black, fontFamily: 'ArialBlack', fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            if (isWidgetVisible1)
              Card(
                color: Colors.amber,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          textAlign: TextAlign.left,
                          answer1,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'ArialBlack',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),

            InkWell(
              onTap: () {
                setState(() {
                  isWidgetVisible2 = !isWidgetVisible2;
                });
              },
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      child: Text(
                        textAlign: TextAlign.left,
                        question2,
                        style: const TextStyle(
                            color: Colors.black, fontFamily: 'ArialBlack', fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            if (isWidgetVisible2)
              Card(
                color: Colors.amber,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          textAlign: TextAlign.left,
                          answer2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'ArialBlack',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),

            InkWell(
              onTap: () {
                setState(() {
                  isWidgetVisible3 = !isWidgetVisible3;
                });
              },
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      child: Text(
                        textAlign: TextAlign.left,
                        question3,
                        style: const TextStyle(
                            color: Colors.black, fontFamily: 'ArialBlack', fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            if (isWidgetVisible3)
              Card(
                color: Colors.amber,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          textAlign: TextAlign.left,
                          answer3,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'ArialBlack',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),

            InkWell(
              onTap: () {
                setState(() {
                  isWidgetVisible4 = !isWidgetVisible4;
                });
              },
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      child: Text(
                        textAlign: TextAlign.left,
                        question4,
                        style: const TextStyle(
                            color: Colors.black, fontFamily: 'ArialBlack', fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            if (isWidgetVisible4)
              Card(
                color: Colors.amber,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          textAlign: TextAlign.left,
                          answer4,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'ArialBlack',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),

            InkWell(
              onTap: () {
                setState(() {
                  isWidgetVisible5 = !isWidgetVisible5;
                });
              },
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      child: Text(
                        textAlign: TextAlign.left,
                        question5,
                        style: const TextStyle(
                            color: Colors.black, fontFamily: 'ArialBlack', fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            if (isWidgetVisible5)
              Card(
                color: Colors.amber,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          textAlign: TextAlign.left,
                          answer5,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'ArialBlack',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),

            //question(context, isWidgetVisible1, question1),
            //answer(isWidgetVisible1, answer1),
            //question(context, isWidgetVisible2, question2),
            //answer(isWidgetVisible2, answer2),
            //question(context, isWidgetVisible3, question3),
            //answer(isWidgetVisible3, answer3),
          ],
        ),
      ),
    );
  }

  InkWell question(BuildContext context, bool isWidgetVisible, String question) {
    return InkWell(
      onTap: () {
        setState(() {
          isWidgetVisible = !isWidgetVisible;
        });
      },
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Row(children: [
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              child: Text(
                textAlign: TextAlign.left,
                question,
                style: const TextStyle(
                    color: Colors.black, fontFamily: 'ArialBlack', fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget answer(bool isWidgetVisible, String answer) {
    if (isWidgetVisible) {
      return Card(
        color: Colors.amber,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  textAlign: TextAlign.left,
                  answer,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'ArialBlack',
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
