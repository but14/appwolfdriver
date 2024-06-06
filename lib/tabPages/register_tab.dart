import 'package:appwolfdriver/tabPages/registerVehicle_tab.dart';
import 'package:flutter/material.dart';
import 'package:appwolfdriver/mainScreen/main_screen.dart';
import 'package:appwolfdriver/tabPages/home_tab.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Loại bỏ mũi tên trên thanh appbar
        backgroundColor: Color(0xffB81736),
        title: Text(
          "Đăng ký",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Họ và tên",
              ),

            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Số điện thoại",
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Tên người dùng",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mật khẩu",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterVehiclePage()),
                );
              },
              child: Text("Đăng ký"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Đã có tài khoản?"),
                TextButton(
                  onPressed: () {
                    // Chuyển đến trang đăng nhập
                    Navigator.pop(context);
                  },
                  child: Text("Đăng nhập ngay"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
