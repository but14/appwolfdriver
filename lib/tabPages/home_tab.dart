import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:appwolfdriver/tabPages/pickup_tab.dart';
import 'booking_tab.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(10.776889, 106.700806);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB81736),
        elevation: 0,
        title: Text(
          'Chào mừng bạn đến với Wolf Care',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // Loại bỏ nút quay lại
      ),
      body: Column(
        children: [
          
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
