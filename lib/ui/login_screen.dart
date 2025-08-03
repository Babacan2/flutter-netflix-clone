import 'package:flutter/material.dart';
import 'package:netflix_odev6/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var tfController1 = TextEditingController();
  var tfController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
          children: [
            const SizedBox(height: 150,),
            const Text(
              "NETFLİX",
              style: TextStyle(
                color: Colors.red,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40,),
            TextField(
              controller: tfController1,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "E-posta",
                  hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16,),
            TextField(
              controller: tfController2,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Şifre",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24,),
            ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            }
                , child: Text("Giriş Yap",style: TextStyle(fontSize: 16),))
          ],
      ),
      ),
    );
  }
}
