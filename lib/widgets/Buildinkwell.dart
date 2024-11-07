import 'package:flutter/material.dart';
import 'package:intershipapp/widgets/jobcontainer.dart';

class BuildInkwll extends StatefulWidget {
    final String name;

const BuildInkwll({super.key, 
  required this.name
});
  @override
  BuildInkwellState createState() => BuildInkwellState();
}

class BuildInkwellState extends State<BuildInkwll> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return buildInkWell();
  }

  Widget buildInkWell() {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isPressed ? Colors.purple : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.purple),
        ),
        child: Text(
          widget.name,
          style: TextStyle(
            color: isPressed ? Colors.white : Colors.purple,
          ),
        ),
      ),
    );
  }
}


class BuildInkwllTo extends StatefulWidget {
  final String name;

  const BuildInkwllTo({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  BuildInkwellToState createState() => BuildInkwellToState();
}

class BuildInkwellToState extends State<BuildInkwllTo> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to another page upon tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomBox(), // Replace YourOtherPage with the page you want to navigate to
          ),
        );
      },
      child: buildInkWellTo(),
    );
  }

  Widget buildInkWellTo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isPressed ? Colors.purple : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.purple),
      ),
      child: Text(
        widget.name,
        style: TextStyle(
          color: isPressed ? Colors.white : Colors.purple,
        ),
      ),
    );
  }
}
