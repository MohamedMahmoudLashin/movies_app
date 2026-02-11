import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          child:Image.asset("assets/Screenshot_1.png") ,),
        title: Text("name"),
        subtitle: Text("data"),
      ),
    );
  }
}
