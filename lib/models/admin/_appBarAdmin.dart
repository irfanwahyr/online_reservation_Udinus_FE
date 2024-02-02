import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/_heading3.dart';

class AppBarAdmin extends StatefulWidget implements PreferredSizeWidget {
  final String namaAdmin;
  final String imageAsset;
  final TabController? tabController;

  const AppBarAdmin({
    required this.namaAdmin,
    required this.imageAsset,
    this.tabController,
    Key? key,
  }) : super(key: key);

  @override
  _AppBarAdminState createState() => _AppBarAdminState();

  @override
  Size get preferredSize => Size.fromHeight(100);
}

class _AppBarAdminState extends State<AppBarAdmin>
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
        title: Container(
          height: 100,
          color: const Color.fromARGB(255, 1, 24, 50),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                "Kuliah Pengganti",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Acara Organisasi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Acara Kampus",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
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
