import 'package:flutter/material.dart';

class ProgressTracker extends StatefulWidget {
  final ValueChanged<int> onProgressChanged;

  ProgressTracker({required this.onProgressChanged});

  @override
  _ProgressTrackerState createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<ProgressTracker> {
  int currentStep = 0;
  bool isStarted = false;

  void onStepTapped(int step) {
    if (isStarted && step <= currentStep + 1) {
      setState(() {
        currentStep = step;
        widget.onProgressChanged(currentStep);
      });
    }
  }

  int returnState() {
    return currentStep;
  }

  void onButtonPressed() {
    setState(() {
      if (!isStarted) {
        isStarted = true;
        currentStep = 1; // Move to the first step
      } else if (currentStep < 4) {
        currentStep += 1; // Move to the next step
      } else if (currentStep == 4) {
        currentStep = 5; // Move to the approval awaited state
      } else if (currentStep == 5) {
        currentStep = 6; // Move to the completed state
      }
      widget.onProgressChanged(currentStep);
    });
  }

  String getStatusText(int step) {
    switch (step) {
      case 0:
        return 'Task not started';
      case 1:
        return 'To do task';
      case 2:
      case 3:
      case 4:
        return 'In-progress';
      case 5:
        return 'Approval awaited';
      case 6:
        return 'Task completed';
      default:
        return '';
    }
  }

  Color getStatusColor(int step) {
    if (!isStarted && step == 0) return Colors.red;
    if (step == 1) return Colors.yellow;
    if (step >= 2 && step <= 4) return Colors.orange;
    if (step == 5) return Colors.red;
    if (step == 6) return Colors.green;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = getStatusColor(currentStep);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            bool isActive = index <= currentStep;
            return GestureDetector(
              onTap: () => onStepTapped(index),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: isActive ? currentColor : Colors.grey,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: (index == 0 && !isStarted) ||
                              (index == 4 && currentStep == 5)
                              ? currentColor
                              : isActive && index != 0
                              ? currentColor
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: (isActive && index != 0 && currentStep == 6)
                            ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        )
                            : null,
                      ),
                    ),
                  ),
                  if (index < 4)
                    Container(
                      width: 40,
                      height: 2,
                      color: isActive ? currentColor : Colors.grey,
                    ),
                ],
              ),
            );
          }),
        ),
        SizedBox(height: 4),
        Center(
          child: Text(
            getStatusText(currentStep),
            style: TextStyle(
              color: currentColor,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: OutlinedButton(
            onPressed: onButtonPressed,
            child: Text(
              !isStarted
                  ? 'Start'
                  : currentStep < 5
                  ? 'Done'
                  : 'Completed',
            ),
            style: OutlinedButton.styleFrom(
              primary: !isStarted
                  ? Colors.green
                  : currentStep < 5
                  ? Colors.green
                  : Colors.grey,
              side: BorderSide(
                color: !isStarted
                    ? Colors.green
                    : currentStep < 5
                    ? Colors.green
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
