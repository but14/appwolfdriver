import 'package:flutter/material.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  // Thông tin người dùng giả định
  String username = "Long Ngơ";
  String email = "Long@example.com";
  String avatarUrl =
      "https://assets.goal.com/images/v3/bltcb938010210e6cd4/Cristiano_Ronaldo_Portugal_2023.jpg"; // URL của hình ảnh đại diện

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB81736),
        elevation: 0,
        title: Text(
          "Thông tin tài khoản",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              SizedBox(height: 20),
              Text(
                "Tên người dùng: $username",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Email: $email",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Xử lý khi người dùng nhấn vào nút đổi mật khẩu
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                  );
                },
                child: Text("Đổi mật khẩu"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Xử lý khi người dùng nhấn vào nút hỗ trợ khách hàng
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportPage()),
                  );
                },
                child: Text("Hỗ trợ khách hàng"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Xử lý khi người dùng nhấn vào nút đăng xuất
                },
                child: Text("Đăng xuất"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đổi mật khẩu"),
      ),
      body: Center(
        child: Text("Form đổi mật khẩu sẽ được thêm ở đây"),
      ),
    );
  }
}

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hỗ trợ khách hàng"),
      ),
      body: Center(
        child: Text("Thông tin hỗ trợ khách hàng sẽ được thêm ở đây"),
      ),
    );
  }
}
