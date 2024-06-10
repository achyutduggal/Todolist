import 'package:flutter/material.dart';

class TaskStatusCard extends StatefulWidget {
  final Color borderColor;
  final Color tintColor;
  final String title;
  final Color iconColor;
  final int count;

  TaskStatusCard({
    required this.borderColor,
    required this.tintColor,
    required this.title,
    required this.iconColor,
    required this.count,
  });

  @override
  _TaskStatusCardState createState() => _TaskStatusCardState();
}

class _TaskStatusCardState extends State<TaskStatusCard> {
  bool isClicked = false;

  void _handleTap() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 160, // Set a fixed width
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: isClicked ? widget.tintColor : Colors.white,
          border: Border.all(
            color: widget.borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: widget.iconColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              widget.count.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskStatusGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TaskStatusCard(
                borderColor: Colors.yellow,
                tintColor: Colors.yellow[50]!,
                title: 'To Do Task',
                iconColor: Colors.yellow,
                count: 16,
              ),
              TaskStatusCard(
                borderColor: Colors.orange,
                tintColor: Colors.orange[50]!,
                title: 'In-progress',
                iconColor: Colors.orange,
                count: 16,
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TaskStatusCard(
                borderColor: Colors.red,
                tintColor: Colors.red[50]!,
                title: 'Overdue',
                iconColor: Colors.red,
                count: 16,
              ),
              TaskStatusCard(
                borderColor: Colors.green,
                tintColor: Colors.green[50]!,
                title: 'Completed',
                iconColor: Colors.green,
                count: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
