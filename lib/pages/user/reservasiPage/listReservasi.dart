class ListReservasi {
  
  String getHari(int day) {
    switch (day) {
      case 1:
        return "Senin";
      case 2:
        return "Selasa";
      case 3:
        return "Rabu";
      case 4:
        return "Kamis";
      case 5:
        return "Jumat";
      case 6:
        return "Sabtu";
      case 7:
        return "Minggu";
      default:
        return "";
    }
  }

  String getBulan(int month) {
    switch (month) {
      case 1:
        return "Januari";
      case 2:
        return "Februari";
      case 3:
        return "Maret";
      case 4:
        return "April";
      case 5:
        return "Mei";
      case 6:
        return "Juni";
      case 7:
        return "Juli";
      case 8:
        return "Agustus";
      case 9:
        return "September";
      case 10:
        return "Oktober";
      case 11:
        return "November";
      case 12:
        return "Desember";
      default:
        return "";
    }
  }

  List<String> Waktu = [
    "07.00 - 07.40",
    "07.40 - 08.40",
    "08.40 - 09.30",
    "10.20 - 11.10",
    "11.10 - 12.00",
    "12.30 - 13.20",
    "13.20 - 14.10",
    "14.10 - 15.00",
    "15.30 - 16.20",
    "16.20 - 17.10",
    "17.10 - 18.00",
    "18.30 - 19.20",
    "19.20 - 20.10",
    "20.10 - 21.00",
  ];

  List<String> Keterangan = [
    "Pemrograman Perangkat Bergerak",
    "Pemrograman Perangkat Bergerak",
    "Pemrograman Perangkat Bergerak",
    " ",
    " ",
    "Desain Grafis",
    "Desain Grafis",
    "Pengolahan Citra Digital",
    "Pengolahan Citra Digital",
    "Workshop BK",
    "Workshop BK",
    " ",
    " ",
    " ",
  ];
}
