import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_uas2/page/beranda.dart';
import 'package:flutter_mobile_uas2/models/mahasiswa.dart';
import 'package:flutter_mobile_uas2/page/list_data.dart';
import 'package:flutter_mobile_uas2/service/mahasiswaSevice.dart';

class formMhs extends StatefulWidget {
  const formMhs({Key? key}) : super(key: key);

  State<formMhs> createState() => _formMhs();
}

class _formMhs extends State<formMhs> {
  var nimController = TextEditingController();
  var namaController = TextEditingController();
  var alamatController = TextEditingController();
  var noTelpController = TextEditingController();
  var jkController = TextEditingController();
  bool _validateNim = false;
  bool _validateNama = false;
  bool _validateAlamat = false;
  bool _validateNoTelp = false;
  bool _validateJk = false;
  var _mhsService = MhsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Polinema"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListMahasiswaPage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          const Text(
            'Form Data Mahasiswa',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "CabalBold"),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: nimController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  labelText: 'NIM',
                  hintText: 'Masukkan NIM Anda',
                  errorText: _validateNim ? 'NIM tidak boleh kosong' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: namaController,
              decoration: InputDecoration(
                  labelText: 'Nama',
                  hintText: 'Masukkan Nama Lengkap Anda',
                  errorText: _validateNama ? 'Nama tidak boleh kosong' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: alamatController,
              maxLines: 4,
              decoration: InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'Masukkan Alamat Anda',
                  errorText:
                      _validateAlamat ? 'Alamat tidak boleh kosong' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: noTelpController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  labelText: 'No.Telp',
                  hintText: 'Masukkan No.Telp Anda',
                  errorText:
                      _validateNoTelp ? 'No.Telp tidak boleh kosong' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              hint: Text('Jenis Kelamin'),
              items: [
                DropdownMenuItem(
                  child: Text('Laki - Laki'),
                  value: "Laki - Laki",
                ),
                DropdownMenuItem(
                  child: Text('Perempuan'),
                  value: "Perempuan",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  jkController.text = value.toString();
                });
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 6.0,
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 2 - 35,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  // biar hapus semua value yang udah di isi
                  onPressed: () async {
                    setState(() {
                      nimController.text.isEmpty
                          ? _validateNim = true
                          : _validateNim = false;
                      namaController.text.isEmpty
                          ? _validateNama = true
                          : _validateNama = false;
                      alamatController.text.isEmpty
                          ? _validateAlamat = true
                          : _validateAlamat = false;
                      noTelpController.text.isEmpty
                          ? _validateNoTelp = true
                          : _validateNoTelp = false;
                      jkController.text.isEmpty
                          ? _validateJk = true
                          : _validateJk = false;
                    });
                    if (_validateNim == false &&
                        _validateNama == false &&
                        _validateAlamat == false &&
                        _validateNoTelp == false &&
                        _validateJk == false) {
                      var _mhs = Mahasiswa();
                      _mhs.nim = nimController.text;
                      _mhs.nama = namaController.text;
                      _mhs.alamat = alamatController.text;
                      _mhs.notelp = noTelpController.text;
                      _mhs.jk = jkController.text;
                      var result = await _mhsService.SaveMhs(_mhs);
                      Navigator.pop(context, result);
                    }
                  },
                  child: Text('Save Data'),
                ),
              ),
              const SizedBox(
                width: 26,
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 2 - 35,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  // biar hapus semua value yang udah di isi
                  onPressed: () {
                    nimController.text = '';
                    namaController.text = '';
                    alamatController.text = '';
                    noTelpController.text = '';
                    jkController.text = '';
                  },
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListMahasiswaPage()));
        },
      ),
    );
  }
}
