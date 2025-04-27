import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaty/core/constants/app_colors.dart';
import 'package:shaty/shared/widgets/doctor_sign_in.dart';
import 'package:shaty/shared/widgets/patient_sign_in.dart';
import 'package:shaty/shared/widgets/primary_button%20.dart';
import '../../controllers/sign_in_controllers.dart';
import '../../core/enums/user_role_enum.dart';
import 'package:shaty/shared/widgets/toggle_user_role.dart';

class SignInPatient extends StatefulWidget {
  const SignInPatient({super.key});

  @override
  State<SignInPatient> createState() => _SignInPatientState();
}

class _SignInPatientState extends State<SignInPatient> {
  UserRole _selectedRole = UserRole.patient;
  final _controllers = SignInControllers();

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome_to_create_an_Account,
                  style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
                ),
                SizedBox(height: 25,),

                RoleSelector(
                  selectedRole: _selectedRole,
                  onChanged: (role) {
                    setState(() {
                      _selectedRole = role;
                    });
                  },
                ),

                _selectedRole == UserRole.patient
                    ? PatientSignIn(
                        emailController: _controllers.email,
                        passwordController: _controllers.password,
                        nameController: _controllers.name,
                        confirmPasswordController: _controllers.confirmPassword,
                        typeDiseaseController: _controllers.typeDisease)
                    : DoctorSignIn(
                        emailController: _controllers.email,
                        passwordController: _controllers.password,
                        nameController: _controllers.name,
                        confirmPasswordController: _controllers.confirmPassword,
                        specializationController: _controllers.specialization,
                        jobNumberController: _controllers.jobNumber),
                SizedBox(height: 50,),
                PrimaryButton(
                  label: AppLocalizations.of(context)!.create_account,
                  onPressed: () {
                    if (_selectedRole == UserRole.patient) {
                      // patient
                    } else {
                      // doctor
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
// Center(
//   child: ToggleButtons(
//     isSelected: [_selectedRole == UserRole.patient, _selectedRole == UserRole.doctor],
//     onPressed: (index) {
//       setState(() {
//         _selectedRole = index == 0 ? UserRole.patient : UserRole.doctor;
//       });
//     },
//     constraints: BoxConstraints(
//       minWidth: 168,
//       minHeight: 45,
//     ),
//     borderRadius: BorderRadius.circular(12),
//     selectedColor: Colors.white,
//     fillColor: AppColors.primaryColor,
//
//     children: [
//       Text(AppLocalizations.of(context)!.sign_in_patient_title,textAlign: TextAlign.center,),
//       Text(AppLocalizations.of(context)!.sign_in_doctor_title,textAlign: TextAlign.center,),
//     ],
//
//   ),
// ),
//***********
// ElevatedButton(
// onPressed: () {
// if (_selectedRole == UserRole.patient) {
// // patient
// } else {
// // doctor
// }
// },
// style: ElevatedButton.styleFrom(
// backgroundColor: AppColors.primaryColor,
// minimumSize: Size(double.infinity, 50),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8)
// ),
// ),
// child: Text(
// AppLocalizations.of(context)!.create_account,
// style: TextStyle(color: Colors.white),
// ),),
