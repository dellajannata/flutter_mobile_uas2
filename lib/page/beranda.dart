import 'package:flutter/material.dart';
import 'package:flutter_mobile_uas2/MyHeaderDrawer.dart';
import 'package:flutter_mobile_uas2/page/list_data.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.blue, title: const Text("Polinema")),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(children: [
            const MyHeaderDrawer(),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text("Beranda",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Beranda();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: Text("Daftar Mahasiswa",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return ListMahasiswaPage();
                }));
              },
            ),
          ]),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Selamat Datang",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Politeknik Negeri Malang",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ClipRRect(
                          child: SizedBox(
                        width: 1500,
                        height: 200,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Image.asset(
                            'assets/img/1.png',
                            height: 700,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Graha Politeknik Negeri Malang",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ClipRRect(
                          child: SizedBox(
                        width: 1500,
                        height: 200,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Image.asset(
                            'assets/img/2.png',
                            height: 700,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Gedung Sipil",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
