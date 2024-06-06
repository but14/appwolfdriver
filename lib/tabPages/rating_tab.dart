import 'package:flutter/material.dart';

class DriverRatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá tài xế'),
        backgroundColor: Color(0xffB81736),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tài xế:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Nguyễn Văn A',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Điểm đón:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '123 Đường ABC, Quận XYZ, TP HCM',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Điểm đến:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '456 Đường XYZ, Quận ABC, TP HCM',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Đánh giá:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            // Đánh giá tài xế
            RatingStars(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Xử lý đánh giá tài xế

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cảm ơn bạn đã đánh giá!')),
                );
                // Điều hướng về trang chủ hoặc trang khác nếu cần
              },
              child: Text("Gửi đánh giá"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffB81736),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingStars extends StatefulWidget {
  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: _rating >= 1 ? Icon(Icons.star, color: Colors.yellow) : Icon(Icons.star_border),
          onPressed: () {
            setState(() {
              _rating = 1;
            });
          },
        ),
        IconButton(
          icon: _rating >= 2 ? Icon(Icons.star, color: Colors.yellow) : Icon(Icons.star_border),
          onPressed: () {
            setState(() {
              _rating = 2;
            });
          },
        ),
        IconButton(
          icon: _rating >= 3 ? Icon(Icons.star, color: Colors.yellow) : Icon(Icons.star_border),
          onPressed: () {
            setState(() {
              _rating = 3;
            });
          },
        ),
        IconButton(
          icon: _rating >= 4 ? Icon(Icons.star, color: Colors.yellow) : Icon(Icons.star_border),
          onPressed: () {
            setState(() {
              _rating = 4;
            });
          },
        ),
        IconButton(
          icon: _rating >= 5 ? Icon(Icons.star, color: Colors.yellow) : Icon(Icons.star_border),
          onPressed: () {
            setState(() {
              _rating = 5;
            });
          },
        ),
      ],
    );
  }
}
