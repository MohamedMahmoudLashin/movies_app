import 'package:flutter/material.dart';
import 'package:movies/view/widgets/text_details.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: TextDetails(title: 'Hello'),)),
    );
  }
}
