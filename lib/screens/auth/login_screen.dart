import 'package:flutter/material.dart';
import 'package:shaty/core/constants/app_colors.dart';
import 'package:shaty/core/constants/user_type.dart';
import 'package:shaty/core/extensions/localization_extension.dart';
import 'package:shaty/shared/widgets/labeled_text_field.dart';
import 'package:shaty/shared/widgets/primary_button%20.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.loc.login_now,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
              SizedBox(height: 25,),
              LabeledTextField(
                  label: (context.loc.email),
                  hintText:  context.loc.hint_email,
                  controller: _emailTextEditingController),
              SizedBox(height: 16,),
              LabeledTextField(
                  label: (context.loc.password),
                  hintText: context.loc.hint_password,
                  controller: _passwordTextEditingController,obscure: true,),
              SizedBox(height: 15,),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/rest_password_screen');
                },
                child: Text(
                  context.loc.forget_password,
                  style: TextStyle(fontSize: 12, color: AppColors.accentColor),
                ),
              ),
              SizedBox(height: 20,),
              PrimaryButton(label: context.loc.login,
                  onPressed: () {
                if(UserType.isDoctor){
                  Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');

                }else {
                Navigator.pushReplacementNamed(context, '/patient_bottom_nav_bar');
                }
                  },),
              SizedBox(height: 40,),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/sign_in_screen');
                },
                child: Center(
                  child: Text(
                    context.loc.create_account,
                    style: TextStyle(
                        color: AppColors.secondaryColor, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Row(
// children: [
// Expanded(child: Divider(color: AppColors.accentColor,thickness: 2,)),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 8),
// child: Text(context.loc.register_through),
// ),
// Expanded(child: Divider(color: AppColors.accentColor,thickness: 2,)),
//
// ],
// ),
//&&&&&&&&&&&&&&&&&&7
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: AppColors.primaryColor,
// minimumSize: Size(double.infinity, 50),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8)
// ),
// ),
//
// onPressed: () {},
// child: Text(
// context.loc.login,
// style: TextStyle(color: Colors.white),
// ),
// ),