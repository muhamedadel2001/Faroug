import 'package:flutter/material.dart';

import '../../../core/utilities/page_type.dart';
import '../../../core/widgets/field_config.dart';

Map<PageType, List<FieldConfig>> pageFieldsConfig = {
  PageType.income:[
    FieldConfig(fieldName: "name",labelText: "Name",keyboardType: TextInputType.emailAddress,),
    FieldConfig(fieldName: "amount",labelText: "Amount",keyboardType: TextInputType.emailAddress,),
    FieldConfig(fieldName: "date",labelText: "Date",keyboardType: TextInputType.emailAddress,suffixIcon: Icons.calendar_today,),
    FieldConfig(fieldName: "income Category",labelText: "Income Category",suffixIcon: Icons.add_box_outlined,),
    FieldConfig(fieldName: "category",labelText: "Category",suffixIcon: Icons.arrow_drop_down,),
    FieldConfig(fieldName: "method",labelText: "Method",suffixIcon: Icons.arrow_drop_down,),
    FieldConfig(fieldName: "note",labelText: "Note",keyboardType: TextInputType.emailAddress),
  ],
  PageType.expenses:[
    FieldConfig(fieldName: "name",labelText: "Name",keyboardType: TextInputType.emailAddress,),
    FieldConfig(fieldName: "amount",labelText: "Amount",keyboardType: TextInputType.emailAddress,),
    FieldConfig(fieldName: "date",labelText: "Date",keyboardType: TextInputType.emailAddress,suffixIcon: Icons.calendar_today,),
    FieldConfig(fieldName: "expense category",labelText: "Expense Category",suffixIcon: Icons.add_box_outlined,),
    FieldConfig(fieldName: "category",labelText: "Category",suffixIcon: Icons.arrow_drop_down,),
    FieldConfig(fieldName: "method",labelText: "Method",suffixIcon: Icons.arrow_drop_down,),
    FieldConfig(fieldName: "note",labelText: "Note",keyboardType: TextInputType.emailAddress),
  ],
  PageType.feedServed:[
    FieldConfig(fieldName: "name",labelText: "Name",keyboardType: TextInputType.emailAddress,),
    FieldConfig(fieldName: "category",labelText: "Category",suffixIcon: Icons.arrow_drop_down,),
    FieldConfig(fieldName: "amount",labelText: "Amount",keyboardType: TextInputType.emailAddress,),
    FieldConfig(fieldName: "date",labelText: "Date",keyboardType: TextInputType.emailAddress,suffixIcon: Icons.calendar_today,),
    FieldConfig(fieldName: "note",labelText: "Note",keyboardType: TextInputType.emailAddress),
  ],
  PageType.vaccination:[
    FieldConfig(fieldName: "vaccine name",labelText: "Vaccine Name",keyboardType: TextInputType.emailAddress,),
    FieldConfig(fieldName: "date",labelText: "Date",keyboardType: TextInputType.emailAddress,suffixIcon: Icons.calendar_today,),
    FieldConfig(fieldName: "breed",labelText: "Breed",suffixIcon: Icons.arrow_drop_down,prefixIcon: Icons.child_care_outlined,),
    FieldConfig(fieldName: "vaccine type",labelText: "Vaccine Type",suffixIcon: Icons.arrow_drop_down,),
    FieldConfig(fieldName: "method",labelText: "Method",keyboardType: TextInputType.emailAddress,suffixIcon: Icons.arrow_drop_down,),
    FieldConfig(fieldName: "description",labelText: "Description",keyboardType: TextInputType.emailAddress),
  ],
  PageType.medicine:[
    FieldConfig(fieldName: "medicine name",labelText: "Medicine Name",keyboardType: TextInputType.emailAddress,),
    FieldConfig(fieldName: "date",labelText: "Date",suffixIcon: Icons.calendar_today,),
    FieldConfig(fieldName: "breed",labelText: "Breed",suffixIcon: Icons.arrow_drop_down,prefixIcon: Icons.child_care_outlined,),
    FieldConfig(fieldName: "note",labelText: "Note",keyboardType: TextInputType.emailAddress),

  ],
  PageType.mortality:[
    FieldConfig(fieldName: "number of dead birds",labelText: "Number of Dead Birds",keyboardType: TextInputType.emailAddress,),
    FieldConfig(fieldName: "date",labelText: "Date",suffixIcon: Icons.calendar_today,),
    FieldConfig(fieldName: "breed",labelText: "Breed",suffixIcon: Icons.arrow_drop_down,prefixIcon: Icons.child_care_outlined,),
    FieldConfig(fieldName: "note",labelText: "Note",keyboardType: TextInputType.emailAddress),
  ],

};