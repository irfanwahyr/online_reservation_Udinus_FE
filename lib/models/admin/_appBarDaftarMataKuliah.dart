import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/_heading3.dart';

class AppBarDaftarMataKuliah extends StatefulWidget
    implements PreferredSizeWidget {
  final String namaAdmin;
  final String imageAsset;
  final TabController? tabController;

  const AppBarDaftarMataKuliah({
    required this.namaAdmin,
    required this.imageAsset,
    this.tabController,
    Key? key,
  }) : super(key: key);

  @override
  _AppBarDaftarMataKuliahState createState() => _AppBarDaftarMataKuliahState();

  @override
  Size get preferredSize => Size.fromHeight(100);
}

class _AppBarDaftarMataKuliahState extends State<AppBarDaftarMataKuliah>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        widget.tabController ?? TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Container(
          height: 100,
          color: const Color.fromARGB(255, 1, 24, 50),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  // Tambahkan IconButton untuk membuka drawer
                  icon: Icon(Icons.menu), // Icon menu sebagai indikator drawer
                  onPressed: () {
                    Scaffold.of(context)
                        .openDrawer(); // Buka drawer saat tombol ditekan
                  },
                ),
                const Heading2(text: "Selamat Datang", color: Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Heading3(text: widget.namaAdmin, color: Colors.white),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: Image.asset(widget.imageAsset),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 1, 24, 50),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "A",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "B",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "C",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "D",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "E",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "G",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "H",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "I",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "J",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "K",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "L",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "M",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "N",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          indicator: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
