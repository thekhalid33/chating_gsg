import 'package:first_firebase_gsg/Auth/helpers/auth_helper.dart';
import 'package:first_firebase_gsg/Auth/helpers/firestore_helper.dart';
import 'package:first_firebase_gsg/Auth/providers/auth_provider.dart';
import 'package:first_firebase_gsg/Auth/ui/screens/auth_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false)
        .getAllUsersFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              AuthHelper.authHelper.logout();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AuthMainScreen(),
                  ),
                  (route) => false);
            },
            child: Text('log out'),
          ),
          ListView.builder(
            itemCount: Provider.of<AuthProvider>(context).allUsers.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return Container(
                height: 60,
                width: 60,
                alignment: Alignment.center,
                child: Text(
                  Provider.of<AuthProvider>(context).allUsers[index].fName,
                  style: TextStyle(color: Colors.greenAccent, fontSize: 50),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
