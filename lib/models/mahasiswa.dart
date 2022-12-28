class Mahasiswa {
  int? id;
  String? nim;
  String? nama;
  String? alamat;
  String? notelp;
  String? jk;

  MahasiswaMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['nim'] = nim!;
    mapping['nama'] = nama!;
    mapping['alamat'] = alamat!;
    mapping['notelp'] = notelp!;
    mapping['jk'] = jk!;
    return mapping;
  }
}
