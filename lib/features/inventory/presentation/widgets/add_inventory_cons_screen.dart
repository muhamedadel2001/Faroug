import 'package:finalproject/features/inventory/presentation/widgets/add_inventory_cons_body_screen.dart';
import 'package:flutter/material.dart';

class AddInventoryConsScreen extends StatelessWidget {
  const AddInventoryConsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,

          body: AddInventoryConsBodyScreen()),
    );
  }
}
