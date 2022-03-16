class Barang {
  final int id;
  final String nama;
  final String merk;
  final String kodeBarang;
  final String asal;
  final String deskripsi;
  final String harga;
  final DateTime tahunBeli;
  final String? kepemilikan;
  final String? namaPemilik;
  final int jumlah;
  final int baik;
  final int rusak;
  final String foto;
  final String lokasi;
  final int mLokasiId;
  final String nota;

  const Barang({
    required this.id,
    required this.nama,
    required this.merk,
    required this.kodeBarang,
    required this.asal,
    required this.deskripsi,
    required this.harga,
    required this.tahunBeli,
    required this.kepemilikan,
    required this.namaPemilik,
    required this.jumlah,
    required this.baik,
    required this.rusak,
    required this.foto,
    required this.lokasi,
    required this.mLokasiId,
    required this.nota,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: json['id'],
      nama: json['nama'],
      merk: json['merk'],
      kodeBarang: json['kode_barang'],
      asal: json['asal'],
      deskripsi: json['deskripsi'],
      harga: json['harga'],
      tahunBeli: DateTime.parse(json['tahun_beli']),
      kepemilikan: json['kepemilikan'],
      namaPemilik: json['nama_pemilik'],
      jumlah: json['jumlah'],
      baik: json['baik'],
      rusak: json['rusak'],
      foto: (json['foto'] as List).isNotEmpty ? json['foto'][0].toString() : '',
      lokasi: json['lokasi']['nama'],
      mLokasiId: json['lokasi']['id'],
      nota: json['nota'] ?? "",
    );
  }
}
