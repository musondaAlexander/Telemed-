import 'package:flutter/material.dart';
import 'package:telemed/data/booking.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final List<Booking> bookings = [
    Booking(
      time: "10:00 AM",
      date: "2022-01-01",
      doctorName: "Dr. Smith",
      meetingPurpose: "General Checkup",
    ),
    Booking(
      time: "02:30 PM",
      date: "2022-02-15",
      doctorName: "Dr. Johnson",
      meetingPurpose: "Follow-up Appointment",
    ),
    // Add more booking items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return BookingItem(booking: bookings[index]);
        },
      ),
    );
  }
}

class BookingItem extends StatelessWidget {
  final Booking booking;

  BookingItem({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        title: Text(
          'Doctor: ${booking.doctorName}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${booking.date}\nTime: ${booking.time}',
              style: TextStyle(color: Colors.grey[700]),
            ),
            Text(
              'Purpose: ${booking.meetingPurpose}',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          // Add functionality for tapping on a booking item
          // For example, you can navigate to a detailed booking screen
          // Navigator.push(context, MaterialPageRoute(builder: (context) => BookingDetailScreen(booking: booking)));
        },
      ),
    );
  }
}
