import 'package:flutter/material.dart';
import 'package:appwolfdriver/mainScreen/main_screen.dart';

import 'package:appwolfdriver/tabPages/home_tab.dart';
import 'package:appwolfdriver/tabPages/register_tab.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Loại bỏ mũi tên trên thanh appbar
          backgroundColor: Color(0xffB81736),
          title: Text(
            "Đăng nhập",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        body: TabBarView(
          children: [
            // Nội dung của tab đăng nhập
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Tên tài khoản",
                    ),
                    keyboardType: TextInputType.phone,
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
                      // Xử lý đăng nhập
                      // Sau khi đăng nhập thành công, chuyển đến trang HomeTabPage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    },
                    child: Text("Đăng nhập"),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Chưa có tài khoản?"),
                      TextButton(
                        onPressed: () {
                          // Chuyển đến trang đăng ký
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text("Đăng ký ngay"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
