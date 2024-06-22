import 'package:flutter/material.dart';
import '../../../core/utilities/styles/colors.dart';
import '../../../core/utilities/styles/fonts.dart';

import '../../../core/widgets/custom_circular_button.dart';
import '../../../core/widgets/custom_primary_button.dart';
import '../../../core/widgets/field_config.dart';
import '../../../core/utilities/page_type.dart';
import '../data/page_field_config.dart';



class DynamicFormPage extends StatelessWidget {
  final PageType pageType;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<PageType,String> pageTitles = {
    PageType.income: "Add Income",
    PageType.expenses: "Add Expense",
    PageType.feedServed: "Add Feed Served",
    PageType.vaccination: "Add New Vaccine",
    PageType.medicine: "Add New Medicine",
    PageType.mortality: "Add Mortality",
  };

  DynamicFormPage({Key? key, required this.pageType}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    List<FieldConfig> fields = pageFieldsConfig[pageType]!;
    String title = pageTitles[pageType] ?? "page type not found";


    void _saveForm() {
      if (_formKey.currentState!.validate()) {
        Map<String, dynamic> formData = {};
        for (var fieldConfig in fields) {
          formData[fieldConfig.fieldName] = fieldConfig.controller.text;
        }

        
        print(formData); // Print the form data 
      }
    }

    return Scaffold(
      
      body:
      SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50,left: 20,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularButton(
                  pressAction: () => Navigator.of(context).pop(),
                  icon: Icons.arrow_back_ios_rounded,
                ),
                SizedBox(height: 50),
                Center(child: Text(title,style: MyFonts.textStyle36,)),
                SizedBox(height: 34),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: fields.map((config) => Container(
                        margin: EdgeInsets.only(bottom: 20),
                         width: w * 0.875,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          style: MyFonts.textStyleForm12.copyWith(color: Colors.black),
                          controller: config.controller,
                          decoration: InputDecoration(labelText: config.labelText,
                            fillColor: borderColor,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: borderColor)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: borderColor)),
                            filled: true,
                            suffixIcon: Icon(config.suffixIcon),
                            prefixIcon: Icon(config.prefixIcon),
                          ),
                          keyboardType: config.keyboardType,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter ${config.labelText}';
                            }
                            return null;
                          },
                        ),
                      )).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PrimaryButton(
    text: 'save',
    pressAction: () {  if (_formKey.currentState!.validate()) {


    } },

    ),
        ),



    );
    
  }
}
