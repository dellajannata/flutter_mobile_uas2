import 'package:flutter/material.dart';
import 'package:flutter_mobile_uas2/models/mahasiswa.dart';
import 'package:flutter_mobile_uas2/page/list_data.dart';

class ViewMhs extends StatefulWidget {
  final Mahasiswa mahasiswa;
  const ViewMhs({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  State<ViewMhs> createState() => _ViewMahasiswaState();
}

class _ViewMahasiswaState extends State<ViewMhs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details Data Mahasiswa"),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Data Mahasiswa',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: " CabalBold"),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text(
                    'NIM',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46),
                    child: Text(widget.mahasiswa.nim ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Nama',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 34),
                    child: Text(widget.mahasiswa.nama ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Alamat',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(widget.mahasiswa.alamat ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'No. Telp',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(widget.mahasiswa.notelp ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Jenis Kelamin',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(widget.mahasiswa.jk ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListMahasiswaPage()));
            }));
  }
}
