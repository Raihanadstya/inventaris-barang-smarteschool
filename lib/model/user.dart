class User {
  User({
    required this.id,
    required this.nama,
    required this.username,
    required this.whatsapp,
    required this.email,
    required this.avatar,
    required this.tanggalLahir,
    required this.role,
    required this.gender,
    required this.nip,
    required this.namaAyah,
    required this.namaIbu,
    required this.waAyah,
    required this.waIbu,
    required this.nrk,
    required this.nuptk,
    required this.pangkat,
    required this.golongan,
    required this.mSekolahId,
    required this.dihapus,
    required this.createdAt,
    required this.updatedAt,
    required this.agama,
    required this.tempatLahir,
    // required this.photos,
    required this.home,
    required this.token,
    // required this.waReal
    required this.bagian,
    // required this.verifikasi,
    required this.noUjian,
    required this.genderText,
    required this.sekolah,
    required this.tingkat,
    required this.domain,
    // required this.profil,
  });

  int id;
  String nama;
  dynamic username;
  String whatsapp;
  String? email;
  String? avatar;
  DateTime? tanggalLahir;
  String role;
  String gender;
  dynamic nip;
  dynamic namaAyah;
  dynamic namaIbu;
  dynamic waAyah;
  dynamic waIbu;
  dynamic nrk;
  dynamic nuptk;
  dynamic pangkat;
  dynamic golongan;
  int mSekolahId;
  int dihapus;
  dynamic createdAt;
  DateTime updatedAt;
  dynamic agama;
  dynamic tempatLahir;
  // String photos;
  dynamic home;
  dynamic token;
  // String waReal;
  dynamic bagian;
  // String verifikasi;
  dynamic noUjian;
  String genderText;
  String sekolah;
  String tingkat;
  String domain;
  // String profil;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      nama: json["nama"],
      username: json["username"],
      whatsapp: json["whatsapp"],
      email: json["email"],
      avatar: json["avatar"] ?? "",
      tanggalLahir: json["tanggal_lahir"] == null
          ? null
          : DateTime.tryParse(json["tanggal_lahir"]),
      role: json["role"],
      gender: json["gender"],
      nip: json["nip"],
      namaAyah: json["nama_ayah"],
      namaIbu: json["nama_ibu"],
      waAyah: json["wa_ayah"],
      waIbu: json["wa_ibu"],
      nrk: json["nrk"],
      nuptk: json["nuptk"],
      pangkat: json["pangkat"],
      golongan: json["golongan"],
      mSekolahId: json["m_sekolah_id"],
      dihapus: json["dihapus"],
      createdAt: json["created_at"],
      updatedAt: DateTime.parse(json["updated_at"]),
      agama: json["agama"],
      tempatLahir: json["tempat_lahir"],
      // photos: json["photos"],
      home: json["home"],
      token: json["token"],
      // waReal: json["wa_real"],
      bagian: json["bagian"],
      // verifikasi: json["verifikasi"],
      noUjian: json["no_ujian"],
      genderText: json["gender_text"],
      sekolah: json["sekolah"]['nama'],
      tingkat: json["sekolah"]['tingkat_format'],
      domain: json["sekolah"]['domain'],
      // profil: json["profil"],
    );
  }
}
