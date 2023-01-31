import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}
enum AuthMode{SignUp,Login}
class _FormScreenState extends State<FormScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();

  AuthMode _authMode = AuthMode.Login;
  void _switchMode(){
    if(_authMode == AuthMode.Login){
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else{
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }
  Map<String,String> _authData ={
    'email':'',
    'password':'',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Screen'),),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(label: Text('E-Mail'),),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if(val == null){
                      return null;
                    }
                    if (val.isEmpty || !val.contains('@')) {
                      return 'Invalid E-Mail';
                    }
                    return null;
                  },
                  onSaved:(val){
                    _authData['email']=val!;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(label: Text('Password'),),
                  validator: (val) {
                    if(val == null){
                      return null;
                    }
                    if (val.isEmpty || val.length <= 5) {
                      return 'Invalid Password';
                    }
                    return null;
                  },
                  onSaved:(val){
                    _authData['password']=val!;
                  },
                ),
                if(_authMode == AuthMode.SignUp)
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(label: Text('Confirm Password'),),
                    validator: (val) {
                      if(_authMode == AuthMode.Login){
                        return null;
                      }else{
                        if (val != _passwordController.text) {
                          return 'Password not match';
                        }
                      }
                    },
                  ),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_authMode == AuthMode.Login ? 'Login' : 'Sign Up'),
                ),
                TextButton(
                  child: Text(_authMode == AuthMode.Login?'Sign Up Instead':'Login Instead'),
                  onPressed: _switchMode,

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if(!_formKey.currentState!.validate()){
      return;
    }
    _formKey.currentState?.save();
    if(_authMode == AuthMode.Login){
      //login code
    }else{
      //signUp code
    }
  }
}
