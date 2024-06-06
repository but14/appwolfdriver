import 'package:flutter/material.dart';
import 'package:appwolfdriver/tabPages/activity_tab.dart';
import 'package:appwolfdriver/tabPages/home_tab.dart';
import 'package:appwolfdriver/tabPages/profile_tab.dart';
import 'package:appwolfdriver/tabPages/earning_tab.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;
  bool isDriverActive = false; // Trạng thái hoạt động của tài xế
  bool showSwitch = true; // Trạng thái hiển thị của nút chuyển đổi

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    // Giả lập thông báo đặt xe sau 5 giây
    Future.delayed(Duration(seconds: 10), () {
      showBookingDialog(context, 'Ngô Văn Đức Thịnh', 'Cộng Hòa, Quận Tân Bình', 'Long Khánh, Tỉnh Đồng Nai');
    });
  }

  void showBookingDialog(BuildContext context, String customerName, String pickupPoint, String destination) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thông tin chuyến xe'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tên khách hàng: $customerName'),
              Text('Điểm đón: $pickupPoint'),
              Text('Điểm đến: $destination'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Bạn đã nhận chuyến')),
                );
              },
              child: Text('Nhận chuyến'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: const [
              HomeTabPage(),
              ActivityTabPage(),
              IncomeTabPage(),
              ProfileTabPage(),
            ],
          ),
          Positioned(
            top: 20.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDriverActive = !isDriverActive;
                  showSwitch = !isDriverActive; // Ẩn nút chuyển đổi sau khi bật hoạt động

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(isDriverActive ? 'Tài xế đã bắt đầu hoạt động' : 'Tài xế đã dừng hoạt động'),
                    ),
                  );
                });
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: isDriverActive ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isDriverActive ? Icons.power : Icons.power_off,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: "Hoạt động",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: "Thu nhập",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xffB81736),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
