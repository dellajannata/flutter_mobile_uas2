import 'package:flutter/material.dart';
import 'package:flutter_mobile_uas2/models/mahasiswa.dart';
import 'package:flutter_mobile_uas2/page/edit_form.dart';
import 'package:flutter_mobile_uas2/page/form.dart';
import 'package:flutter_mobile_uas2/page/viewMahasiswa.dart';
import 'package:flutter_mobile_uas2/service/mahasiswaSevice.dart';

class ListMahasiswaPage extends StatefulWidget {
  const ListMahasiswaPage({Key? key}) : super(key: key);

  @override
  _ListMahasiswaPageState createState() => _ListMahasiswaPageState();
}

class _ListMahasiswaPageState extends State<ListMahasiswaPage> {
  late List<Mahasiswa> _list;
  final _listMhs = MhsService();

  getAllMahasiswaDetails() async {
    var mhs = await _listMhs.readAllMahasiswa();
    _list = <Mahasiswa>[];
    mhs.forEach((mhs) {
      setState(() {
        var mhsModel = Mahasiswa();
        mhsModel.id = mhs['id'];
        mhsModel.nim = mhs['nim'];
        mhsModel.nama = mhs['nama'];
        mhsModel.alamat = mhs['alamat'];
        mhsModel.notelp = mhs['notelp'];
        _list.add(mhsModel);
      });
    });
  }

  @override
  void initState() {
    getAllMahasiswaDetails();
    _list = [];
    super.initState();
  }

  void _showMessage(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: const Text('Data Berhasil Dihapus')),
    );
  }

  void _showMessage1(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: const Text('Data Berhasil Diperbarui')),
    );
  }

  void _showMessage2(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: const Text('Data Berhasil Ditambahkan')),
    );
  }

  _deleteFormDialog(BuildContext context, mahasiswaId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Apakah Anda yakin akan menghapus data ini ?',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.red),
                  onPressed: () async {
                    var result = await _listMhs.deleteMhs(mahasiswaId);
                    if (result != null) {
                      Navigator.pop(context);
                      getAllMahasiswaDetails();
                      _showMessage(context);
                    }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Data Mahasiswa"),
        ),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewMhs(
                              mahasiswa: _list[index],
                            )));
              },
              leading: Icon(
                Icons.person,
                size: 50,
              ),
              title: Text(_list[index].nama ?? ''),
              subtitle: Text(_list[index].nim ?? ''),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditMahasiswa(
                                    mahasiswa: _list[index],
                                  ))).then((data) {
                        if (data != null) {
                          getAllMahasiswaDetails();
                          _showMessage1(context);
                        }
                      });
                      ;
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {
                      _deleteFormDialog(context, _list[index].id);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ]),
            ),
          );
        },
      ),
      //membuat button mengapung di bagian bawah kanan layar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => formMhs()))
              .then((data) {
            if (data != null) {
              getAllMahasiswaDetails();
              _showMessage2(context);
            }
          });
        },
      ),
    );
  }
}
