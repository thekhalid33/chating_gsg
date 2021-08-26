import 'package:first_firebase_gsg/Auth/models/country_model.dart';
import 'package:first_firebase_gsg/Auth/providers/auth_provider.dart';
import 'package:first_firebase_gsg/Auth/ui/widgets/custom_textField.dart';
import 'package:first_firebase_gsg/ui/global_widgets/custom_button_global.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static final String routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false)
        .getCountriesFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, x) {
        return SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  provider.selectFile();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey,
                  child: provider.file == null
                      ? Container()
                      : Image.file(provider.file, fit: BoxFit.cover),
                ),
              ),
              CustomTextField(
                label: 'Email',
                textEditingController: provider.emailController,
              ),
              CustomTextField(
                label: 'Password',
                textEditingController: provider.passwordController,
              ),
              CustomTextField(
                label: 'First Name',
                textEditingController: provider.fNameController,
              ),
              CustomTextField(
                label: 'Last Name',
                textEditingController: provider.lNameController,
              ),
              provider.countries == null
                  ? Container()
                  : Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<CountryModel>(
                        isExpanded: true,
                        underline: Container(),
                        value: provider.selectedCountry,
                        onChanged: (x) {
                          provider.selectCountry(x);
                        },
                        items: provider.countries.map((e) {
                          return DropdownMenuItem<CountryModel>(
                            child: Text(e.name),
                            value: e,
                          );
                        }).toList(),
                      ),
                    ),
              provider.countries == null
                  ? Container()
                  : Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<dynamic>(
                        isExpanded: true,
                        underline: Container(),
                        value: provider.selectedCity,
                        onChanged: (x) {
                          provider.selectCity(x);
                        },
                        items: provider.cities.map((e) {
                          return DropdownMenuItem<dynamic>(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                      ),
                    ),
              CustomButtonGlobal(
                function: provider.signup,
                lable: 'Register',
              ),
            ],
          ),
        );
      },
    );
  }
}
