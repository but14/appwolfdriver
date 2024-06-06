import 'package:appwolfdriver/mainScreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:appwolfdriver/mainScreen/main_screen.dart';

class RegisterVehiclePage extends StatefulWidget {
  @override
  _RegisterVehiclePageState createState() => _RegisterVehiclePageState();
}

class _RegisterVehiclePageState extends State<RegisterVehiclePage> {
  final TextEditingController _vehicleNumberController = TextEditingController();
  String? _selectedVehicleType;

  final List<String> _vehicleTypes = ['Xe 4 chỗ', 'Xe 7 chỗ', 'Xe máy'];

  void _registerVehicle() {
    final vehicleNumber = _vehicleNumberController.text;
    final vehicleType = _selectedVehicleType;

    if (vehicleNumber.isEmpty || vehicleType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin')),
      );
      return;
    }

    // Thực hiện xử lý đăng ký xe ở đây
    // Ví dụ: Gửi thông tin lên server

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đăng ký xe thành công')),
    );

    // Điều hướng đến trang chủ
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký xe'),
        backgroundColor: Color(0xffB81736),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Số xe:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _vehicleNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập số xe',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Loại xe:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              value: _selectedVehicleType,
              items: _vehicleTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedVehicleType = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Chọn loại xe',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _registerVehicle,
                child: Text("Đăng ký"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffB81736),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterVehiclePage(),
  ));
}
