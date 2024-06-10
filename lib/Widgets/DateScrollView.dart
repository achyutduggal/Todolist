import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateScrollView extends StatefulWidget {
  @override
  _DateScrollViewState createState() => _DateScrollViewState();
}

class _DateScrollViewState extends State<DateScrollView> {
  String selectedDate = DateFormat('dd').format(DateTime.now());

  void onDateSelected(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final List<DateCard> dateCards = List.generate(7, (index) {
      final date = now.add(Duration(days: index));
      final dateString = DateFormat('dd').format(date);
      final dayString = DateFormat('E').format(date);
      return DateCard(
        date: dateString,
        day: dayString,
        isSelected: selectedDate == dateString,
        onTap: () => onDateSelected(dateString),
      );
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: dateCards),
    );
  }
}

class DateCard extends StatelessWidget {
  final String date;
  final String day;
  final bool isSelected;
  final VoidCallback onTap;

  DateCard({
    required this.date,
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink[50] : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: Colors.pink) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.pink : Colors.black,
              ),
            ),
            Text(
              day,
              style: TextStyle(
                color: isSelected ? Colors.pink : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}