class Lokasi {
  Lokasi({
    required this.id,
    required this.jenis,
    required this.noRegis,
    required this.nama,
    required this.lebar,
    required this.panjang,
    required this.mSekolahId,
    required this.dihapus,
    required this.createdAt,
    required this.updatedAt,
    required this.foto,
  });

  int id;
  String jenis;
  String noRegis;
  String nama;
  int lebar;
  int panjang;
  int mSekolahId;
  int dihapus;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> foto;

  factory Lokasi.fromJson(Map<String, dynamic> json) => Lokasi(
        id: json["id"],
        jenis: json["jenis"],
        noRegis: json["no_regis"],
        nama: json["nama"],
        lebar: json["lebar"],
        panjang: json["panjang"],
        mSekolahId: json["m_sekolah_id"],
        dihapus: json["dihapus"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        foto: List<String>.from(json["foto"].map((x) => x)),
      );
}
