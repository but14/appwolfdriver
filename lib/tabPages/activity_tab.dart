import 'package:flutter/material.dart';

class Trip {
  final String pickupLocation;
  final String dropoffLocation;
  final String dateTime;
  final String fare;

  Trip({
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.dateTime,
    required this.fare,
  });
}

class ActivityTabPage extends StatefulWidget {
  const ActivityTabPage({super.key});

  @override
  State<ActivityTabPage> createState() => _ActivityTabPageState();
}

class _ActivityTabPageState extends State<ActivityTabPage> {
  final List<Trip> tripHistory = [
    Trip(
      pickupLocation: "123 Main St",
      dropoffLocation: "456 Elm St",
      dateTime: "2023-05-21 10:30 AM",
      fare: "\$12.50",
    ),
    Trip(
      pickupLocation: "789 Oak St",
      dropoffLocation: "101 Pine St",
      dateTime: "2023-05-20 02:45 PM",
      fare: "\$8.75",
    ),
    Trip(
      pickupLocation: "234 Maple St",
      dropoffLocation: "567 Birch St",
      dateTime: "2023-05-19 06:15 PM",
      fare: "\$15.00",
    ),
    // Thêm nhiều chuyến xe khác ở đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB81736),
        elevation: 0,
        title: const Text(
          "Chào mừng bạn đến với Wolf Care",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: tripHistory.length,
        itemBuilder: (context, index) {
          final trip = tripHistory[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(Icons.directions_car, color: Color(0xffB81736)),
              title: Text("${trip.pickupLocation} -> ${trip.dropoffLocation}"),
              subtitle: Text("Thời gian: ${trip.dateTime}\nGiá: ${trip.fare}"),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
