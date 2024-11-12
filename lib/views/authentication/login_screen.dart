import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        title: Text(
          "Demo",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(50.sp),
              child: Image.asset(
                "assets/images/Spiderman.png",
                height: 30.h,
              ),
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter username",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 2.h),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter password",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                      width: 80.w,
                      height: 8.0.h,
                      child: CupertinoButton(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          onPressed: () {},
                          child: Text("Login")))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
