import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_uas2/models/mahasiswa.dart';
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
  String? jk;
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
        title: Text("Form Mahasiswa"),
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
                fontFamily: " CabalBold"),
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
                  errorText: _validateNim ? 'Value Can\'t Be Empty' : null,
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
                  errorText: _validateNama ? 'Value Can\'t Be Empty' : null,
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
                  errorText: _validateAlamat ? 'Value Can\'t Be Empty' : null,
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
                  errorText: _validateNoTelp ? 'Value Can\'t Be Empty' : null,
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
                  jk = value.toString();
                });
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                ),
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
                    jk == null ? _validateJk = true : _validateJk = false;
                  });
                  if (_validateNim == false &&
                      _validateNama == false &&
                      _validateAlamat == false &&
                      _validateJk == false &&
                      _validateNoTelp == false) {
                    var _mhs = Mahasiswa();
                    _mhs.nim = nimController.text;
                    _mhs.nama = namaController.text;
                    _mhs.alamat = alamatController.text;
                    _mhs.notelp = noTelpController.text;
                    _mhs.jk = jk;
                    var result = await _mhsService.SaveMhs(_mhs);
                    Navigator.pop(context, result);
                  }
                },
                child: const Text('Save Data'),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  nimController.text = '';
                  namaController.text = '';
                  alamatController.text = '';
                  noTelpController.text = '';
                },
                child: const Text('Clear Data'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
