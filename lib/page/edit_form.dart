import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_uas2/models/mahasiswa.dart';
import 'package:flutter_mobile_uas2/service/mahasiswaSevice.dart';

class EditMahasiswa extends StatefulWidget {
  final Mahasiswa mahasiswa;
  const EditMahasiswa({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  _EditMahasiswaState createState() => _EditMahasiswaState();
}

class _EditMahasiswaState extends State<EditMahasiswa> {
  var _mahasiswaNimController = TextEditingController();
  var _mahasiswaNamaController = TextEditingController();
  var _mahasiswaAlamatController = TextEditingController();
  var _mahasiswaNoTelpController = TextEditingController();
  String? jk;
  bool _validateNim = false;
  bool _validateNama = false;
  bool _validateAlamat = false;
  bool _validateNoTelp = false;
  bool _validateJk = false;
  var _mahasiswaService = MhsService();

  @override
  void initState() {
    setState(() {
      _mahasiswaNimController.text = widget.mahasiswa.nim ?? '';
      _mahasiswaNamaController.text = widget.mahasiswa.nama ?? '';
      _mahasiswaAlamatController.text = widget.mahasiswa.alamat ?? '';
      _mahasiswaNoTelpController.text = widget.mahasiswa.notelp ?? '';
      jk = widget.mahasiswa.jk ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Polinema"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Edit Data Mahasiswa',
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
              TextField(
                  controller: _mahasiswaNimController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan NIM Anda',
                    labelText: 'NIM',
                    errorText:
                        _validateNim ? 'Name Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _mahasiswaNamaController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan Nama Lengkap Anda',
                    labelText: 'Nama Lengkap',
                    errorText:
                        _validateNama ? 'Contact Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _mahasiswaAlamatController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan Alamat Anda',
                    labelText: 'Alamat',
                    errorText: _validateAlamat
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _mahasiswaNoTelpController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan No.Telp Anda',
                    labelText: 'No.Telp',
                    errorText: _validateNoTelp
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
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
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        textStyle: const TextStyle(fontSize: 15)),
                    onPressed: () async {
                      setState(() {
                        _mahasiswaNimController.text.isEmpty
                            ? _validateNim = true
                            : _validateNim = false;
                        _mahasiswaNamaController.text.isEmpty
                            ? _validateNama = true
                            : _validateNama = false;
                        _mahasiswaAlamatController.text.isEmpty
                            ? _validateAlamat = true
                            : _validateAlamat = false;
                        _mahasiswaNoTelpController.text.isEmpty
                            ? _validateNoTelp = true
                            : _validateNoTelp = false;
                        jk == null ? _validateJk = true : _validateJk = false;
                      });
                      if (_validateNim == false &&
                          _validateNama == false &&
                          _validateAlamat == false &&
                          _validateJk == false &&
                          _validateNoTelp == false) {
                        // print('Data Berhasil Disimpan');
                        var _mhs = Mahasiswa();
                        _mhs.id = widget.mahasiswa.id;
                        _mhs.nim = _mahasiswaNimController.text;
                        _mhs.nama = _mahasiswaNamaController.text;
                        _mhs.alamat = _mahasiswaAlamatController.text;
                        _mhs.notelp = _mahasiswaNoTelpController.text;
                        _mhs.jk = jk;
                        var result =
                            await _mahasiswaService.UpdateMahasiswa(_mhs);
                        Navigator.pop(context, result);
                      }
                    },
                    child: const Text('Update'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _mahasiswaNamaController.text = '';
                        _mahasiswaNimController.text = '';
                        _mahasiswaAlamatController.text = '';
                        _mahasiswaNoTelpController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
