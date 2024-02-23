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

  List<String> getJam(int jamMulai, int jamSelesai){
    String jmulai, jselesai;
    switch (jamMulai) {
      case 1:
        jmulai = "07.00";
        break;
      case 2:
        jmulai = "07.50";
        break;
      case 3:
        jmulai = "08.40";
        break;
      case 4:
        jmulai = "09.30";
        break;
      case 5:
        jmulai = "10.20";
        break;
      case 6:
        jmulai = "11.10";
        break;
      case 7:
        jmulai = "12.30";
        break;
      case 8:
        jmulai = "13.20";
        break;
      case 9:
        jmulai = "14.10";
        break;
      case 10:
        jmulai = "15.00";
        break;
      case 11:
        jmulai = "16.20";
        break;
      case 12:
        jmulai = "17.10";
        break;
      case 13:
        jmulai = "18.30";
        break;
      case 14:
        jmulai = "19.20";
        break;
      case 15:
        jmulai = "20.10";
        break;
      default:
        jmulai = "00.00";
    }
    switch (jamMulai + 1) {
      case 2:
        jselesai = "07.50";
        break;
      case 3:
        jselesai = "08.40";
        break;
      case 4:
        jselesai = "09.30";
        break;
      case 5:
        jselesai = "10.20";
        break;
      case 6:
        jselesai = "11.10";
        break;
      case 7:
        jselesai = "12.30";
        break;
      case 8:
        jselesai = "13.20";
        break;
      case 9:
        jselesai = "14.10";
        break;
      case 10:
        jselesai = "15.00";
        break;
      case 11:
        jselesai = "16.20";
        break;
      case 12:
        jselesai = "17.10";
        break;
      case 13:
        jselesai = "18.30";
        break;
      case 14:
        jselesai = "19.20";
        break;
      case 15:
        jselesai = "20.10";
        break;
      case 16:
        jselesai = "21.00";
        break;
      default:
        jselesai = "00.00";
    }
    return [jmulai, jselesai];
  }
}
