import 'package:flutter/material.dart';
import 'package:todolist/Screens/ManageScreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Stack(
            children: [
              ManageTasksScreen(),
              Positioned(
                bottom: 48,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),

                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ),
              ),
        ]),
      ),
    );
  }
}
