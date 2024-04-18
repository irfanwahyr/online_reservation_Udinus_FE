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
  int _activeIndex = 0; // Menyimpan indeks tombol yang aktif

  final List<String> listlab = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = widget.tabController ??
        TabController(length: listlab.length, vsync: this);
  }

  void _changeTab(int index) {
    setState(() {
      _activeIndex = index; // Mengatur tombol yang aktif
    });
    _tabController.animateTo(index);
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
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
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
          tabs: List<Widget>.generate(
            listlab.length,
            (index) => Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                listlab[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onTap: _changeTab,
          indicator: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
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
