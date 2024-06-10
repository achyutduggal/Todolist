import 'package:flutter/material.dart';
import 'package:todolist/Widgets/DateScrollView.dart';
import 'package:todolist/Widgets/TaskCard.dart';
import 'package:todolist/Widgets/TaskStatusCard.dart';

class ManageTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Manage Tasks'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'July 2024',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    DateScrollView(),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Task Overview',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    TaskStatusGrid(),
                    SizedBox(height: 16.0),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskStatus extends StatelessWidget {
  final Color color;
  final String label;
  final int count;

  TaskStatus({required this.color, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color,
          width: 1.0,
        )
      ),
      child: InkWell(
        onTap: (){
          print('object');
        },
        child: Row(
          children: [
            Icon(Icons.radio_button_checked_outlined,color: color,),
            SizedBox(width: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8.0,),
                Text(
                  count.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
