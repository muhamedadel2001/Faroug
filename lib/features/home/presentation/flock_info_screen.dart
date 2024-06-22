import 'package:finalproject/features/home/presentation/widgets/flock_info_body_screen.dart';
import 'package:flutter/material.dart';

class FlockInfoScreen extends StatelessWidget {
  const FlockInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(

        body: FlockInfoBodyScreen(),
      ),
    );
  }
}
