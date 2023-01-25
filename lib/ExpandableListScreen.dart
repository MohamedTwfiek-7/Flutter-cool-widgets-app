import 'package:flutter/material.dart';

class ExpandableListscreen extends StatefulWidget {
  const ExpandableListscreen({Key? key}) : super(key: key);

  @override
  State<ExpandableListscreen> createState() => _ExpandableListscreenState();
}

class _ExpandableListscreenState extends State<ExpandableListscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expandable List Screen'),
      ),
      body: ListView(
        children: const [
          ExpansionTile(
            leading: Icon(Icons.perm_identity),
            title: Text('Account'),
            children: [
              Divider(color: Colors.grey),
              ListTile(
                leading: Icon(Icons.add),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Sign Up'),
                subtitle: Text('You can add account right now'),
              ),ListTile(
                leading: Icon(Icons.account_circle_sharp),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Sign In'),
                subtitle: Text('You can login to your account right now'),
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.message),
            title: Text('More Info'),
            children: [
              Divider(color: Colors.grey),
              ListTile(
                leading: Icon(Icons.phone),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Contact Us'),
                subtitle: Text('phone 0123456789'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
