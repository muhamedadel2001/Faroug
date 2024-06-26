import 'package:finalproject/features/home/presentation/widgets/flock_info_body_screen.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';

class FlockInfoScreen extends StatelessWidget {
  const FlockInfoScreen({super.key, required this.flockModel});
  final FlockModel flockModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FlockInfoBodyScreen(
          flockModel: flockModel,
        ),
      ),
    );
  }
}
