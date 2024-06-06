import 'package:flutter/material.dart';
import 'dart:async';

import 'package:appwolfdriver/tabPages/rating_tab.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _destinationController = TextEditingController();
  List<String> _suggestions = [];
  final List<String> _allDestinations = [
    'Hà Nội',
    'Hồ Chí Minh',
    'Đà Nẵng',
    'Nha Trang',
    'Vũng Tàu',
    'Huế',
    'Phú Quốc',
    'Sapa',
  ];

  String? _selectedVehicle;
  bool _isFindingDriver = false;
  bool _driverFound = false;

  void _updateSuggestions(String input) {
    setState(() {
      _suggestions = _allDestinations
          .where((destination) => destination.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Chọn loại xe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Xe 4 chỗ'),
                subtitle: Text('Giá: 100,000 VND'),
                onTap: () {
                  _selectVehicle('Xe 4 chỗ');
                },
              ),
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Xe 7 chỗ'),
                subtitle: Text('Giá: 150,000 VND'),
                onTap: () {
                  _selectVehicle('Xe 7 chỗ');
                },
              ),
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Xe 16 chỗ'),
                subtitle: Text('Giá: 200,000 VND'),
                onTap: () {
                  _selectVehicle('Xe 16 chỗ');
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _selectVehicle(String vehicle) {
    setState(() {
      _selectedVehicle = vehicle;
      _isFindingDriver = true;
      _driverFound = false;
    });
    Navigator.pop(context);

    // Giả lập quá trình tìm tài xế
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isFindingDriver = false;
        _driverFound = true;
      });
    });
  }

  void _bookRide() {
    // Xử lý sự kiện đặt xe
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đặt xe thành công!')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DriverRatingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đặt xe"),
        backgroundColor: Color(0xffB81736),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: "Điểm đến",
              ),
              onChanged: _updateSuggestions,
            ),
            SizedBox(height: 10),
            _suggestions.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_suggestions[index]),
                    onTap: () {
                      setState(() {
                        _destinationController.text = _suggestions[index];
                        _suggestions.clear();
                      });
                    },
                  );
                },
              ),
            )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: Text("Xác nhận đặt xe"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffB81736),
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            if (_isFindingDriver)
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Đang tìm tài xế cho $_selectedVehicle',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            if (_driverFound)
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Đã tìm thấy tài xế cho $_selectedVehicle',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Nguyễn Văn A'),
                      subtitle: Text('Số điện thoại: 0123456789'),
                    ),
                    ListTile(
                      leading: Icon(Icons.car_rental),
                      title: Text('Biển số xe: 30A-12345'),
                      subtitle: Text('Loại xe: $_selectedVehicle'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _bookRide,
                      child: Text("Đặt xe"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffB81736),
                        foregroundColor: Colors.white,
                      ),
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
