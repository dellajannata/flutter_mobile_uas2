import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_uas2/models/mahasiswa.dart';
import 'package:flutter_mobile_uas2/page/list_data.dart';
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
  var _mahasiswaJkController = TextEditingController();
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
      _mahasiswaJkController.text = widget.mahasiswa.jk ?? '';
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
              const SizedBox(
                height: 30,
              ),
              TextField(
                  controller: _mahasiswaNimController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan NIM Anda',
                    labelText: 'NIM',
                    errorText: _validateNim ? 'NIM tidak boleh kosong' : null,
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
                    errorText: _validateNama ? 'Nama tidak boleh kosong' : null,
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
                    errorText:
                        _validateAlamat ? 'Alamat tidak boleh kosong' : null,
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
                    errorText:
                        _validateNoTelp ? 'No.Telp tidak boleh kosong' : null,
                  )),
              DropdownButton(
                isExpanded: true,
                underline: const SizedBox(),
                hint: const Text('Jenis Kelamin'),
                items: const [
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
                    _mahasiswaJkController.text = value.toString();
                  });
                },
              ),
              const SizedBox(
                height: 20.0,
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
                          _mahasiswaJkController.text.isEmpty
                              ? _validateJk = true
                              : _validateJk = false;
                        });
                        if (_validateNim == false &&
                            _validateNama == false &&
                            _validateAlamat == false &&
                            _validateNoTelp == false &&
                            _validateJk == false) {
                          var _mhs = Mahasiswa();
                          _mhs.id = widget.mahasiswa.id;
                          _mhs.nim = _mahasiswaNimController.text;
                          _mhs.nama = _mahasiswaNamaController.text;
                          _mhs.alamat = _mahasiswaAlamatController.text;
                          _mhs.notelp = _mahasiswaNoTelpController.text;
                          _mhs.jk = _mahasiswaJkController.text;
                          var result =
                              await _mahasiswaService.UpdateMahasiswa(_mhs);
                          Navigator.pop(context, result);
                        }
                      },
                      child: Text('Update Data'),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
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
                        _mahasiswaNimController.text = '';
                        _mahasiswaNamaController.text = '';
                        _mahasiswaAlamatController.text = '';
                        _mahasiswaNoTelpController.text = '';
                        _mahasiswaJkController.text = '';
                      },
                      child: Text('Clear Data'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ListMahasiswaPage()));
        },
      ),
    );
  }
}
