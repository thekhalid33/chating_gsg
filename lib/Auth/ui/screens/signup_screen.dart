import 'package:first_firebase_gsg/Auth/models/country_model.dart';
import 'package:first_firebase_gsg/Auth/providers/auth_provider.dart';
import 'package:first_firebase_gsg/Auth/ui/widgets/custom_textField.dart';
import 'package:first_firebase_gsg/ui/global_widgets/custom_button_global.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  static final String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
              CustomTextField(
                label: 'City',
                textEditingController: provider.cityController,
              ),
              CustomTextField(
                label: 'Country',
                textEditingController: provider.countryController,
              ),
              provider.countries == null
                  ? Container()
                  : Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
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
                        }),
                      ),
                    ),
              provider.countries == null
                  ? Container()
                  : Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
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
                        }),
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
