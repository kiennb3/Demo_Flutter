import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  bool isPasswordHidden=true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    String? _vavidateEmail(String? value){
      if(value ==null || value.isEmpty){
        return 'Email không được để trống';
      }
      //kiểm tra đúng định dạng email
      final emailPattern =RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if(!emailPattern.hasMatch(value)){
        return 'Email không hợp lệ';
      }
      return null;
    }
String? _vavidatePassword(String? value){
      if(value ==null || value.isEmpty){
        return 'Password không được để trống';
      }

      if(value.length >6){
        return 'Password phải có ít nhất 6 kí tự';
      }
      return null;
}
  void _login(){


  // final String email= _emailController.text;
  // final String password= _passwordController.text;
  //
  // //xử lý logic đăng nhập
  // print('Email :$email');
  // print('Password :$password');
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        final String email = _emailController.text;
        final String password = _passwordController.text;

        // Xử lý logic đăng nhập
        print('Email: $email');
        print('Password: $password');
      } else {
        // Xử lý trường hợp form state null hoặc không hợp lệ
        print('Form không hợp lệ hoặc form state null');
      }




  }
  void _google(){

  }


  @override
  Widget build(BuildContext context) {

    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đăng nhập '
              ,style: TextStyle(color: Colors.white)),

      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0,),
              TextField(
                controller: _passwordController,
                decoration:  InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      // icon: isPasswordHidden ? const Icon(Icons.visibility_off): const Icon(Icons.visibility),
                    icon: isPasswordHidden ? const Icon(Icons.visibility_off) : Icon(Icons.visibility) ,
                      onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                      }
                  ),

                ),
                obscureText:  isPasswordHidden,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(onPressed: _login,style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 40), backgroundColor: Colors.blueAccent
              )  , child: const Text('Đăng nhập',style: TextStyle(color: Colors.white),)  ),
              ElevatedButton(onPressed: _google,style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 40), backgroundColor: Colors.blueAccent
              ) ,child: const Text('Đăng nhập với google',style: TextStyle(color: Colors.white),) )
            ],
          ),
        ),

      ),
    );
  }
}

