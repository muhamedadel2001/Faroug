import 'package:flutter/material.dart';

import '../../../core/utilities/page_type.dart';
import 'dynamic_form_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // قائمة الأيقونات، لازم الترتيب enum PageType
    final icons = [
      Icons.monetization_on,
      Icons.receipt,
      Icons.food_bank,
      Icons.health_and_safety,
      Icons.ac_unit,
      Icons.local_hospital,
    ];

    // قائمة العناوين، لازم تكون مترتبه عشان المشكله بتاعت يوم 3/9  enum PageType
    final titles = [
      'Income',
      'Expenses',
      'Feed Served',
      'Vaccination',
      'Medicine',
      'Mortality'
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: PageType.values.length,
        itemBuilder: (context, index) {
          // found your page
          final pageType = PageType.values[index];
          return ListTile(
            leading: Icon(icons[index]), // الايقون بتاعت الزرار
            title: Text(titles[index]), // اسم الزرار
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              //
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DynamicFormPage(pageType: pageType),
              ));
            },
          );
        },
      ),
    );
  }
}
