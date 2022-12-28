import 'package:flutter_mobile_uas2/database/repository.dart';
import 'package:flutter_mobile_uas2/models/mahasiswa.dart';

class MhsService {
  late Repository _repository;
  MhsService() {
    _repository = Repository();
  }

  //simpan
  SaveMhs(Mahasiswa mahasiswa) async {
    return await _repository.insertMhs('mahasiswa', mahasiswa.MahasiswaMap());
  }

  //read All Data
  readAllMahasiswa() async {
    return await _repository.readMhs('mahasiswa');
  }

  //update
  UpdateMahasiswa(Mahasiswa mahasiswa) async {
    return await _repository.updateData('mahasiswa', mahasiswa.MahasiswaMap());
  }

  //hapus
  deleteMhs(mahasiswaId) async {
    return await _repository.deleteDataById('mahasiswa', mahasiswaId);
  }
}
