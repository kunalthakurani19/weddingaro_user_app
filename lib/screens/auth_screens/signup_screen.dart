import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:weddingaro_user_app/resources/color.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watextformfeild.dart';
import 'package:weddingaro_user_app/utils/routes/routes_name.dart';

import '../../resources/common_components/watext.dart';
import '../../view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> obsecurePassword = ValueNotifier(true);
  ValueNotifier<bool> obsecureConfirmPassword = ValueNotifier(true);

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.whiteColor.withOpacity(0.2),
            image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1633104502699-b2ecf0fee294?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGluZGlhbiUyMHdlZGRpbmd8ZW58MHx8MHx8fDA%3D',
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Container(
            color: AppColors.whiteColor.withOpacity(0.7),
            height: double.infinity,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        const Center(
                          child: WaText(
                            "SignUp",
                            textcolor: AppColors.blackColor,
                            baskerville: true,
                            fontWeight: FontWeight.w400,
                            fontsize: 25,
                            textAlignment: Alignment.center,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        WATextFormField(
                          hintText: "First Name",
                          controller: fnameController,
                          showBorder: false,
                        ),
                        WATextFormField(
                          hintText: "Last Name",
                          controller: lnameController,
                          showBorder: false,
                        ),
                        WATextFormField(
                          hintText: "Enter Your Email",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          showBorder: false,
                          whichValidation: 'Email',
                        ),
                        WATextFormField(
                          hintText: "Enter Mobile No.",
                          controller: mobileController,
                          keyboardType: TextInputType.number,
                          showBorder: false,
                          whichValidation: 'Number',
                        ),
                        ValueListenableBuilder(
                          valueListenable: obsecurePassword,
                          builder: (context, value, child) {
                            return WATextFormField(
                              controller: passwordController,
                              obscureText: obsecurePassword.value,
                              whichValidation: 'Password',
                              hintText: 'Enter Your Password',
                              showBorder: false,
                              suffixIcon: InkWell(
                                onTap: () {
                                  obsecurePassword.value = !obsecurePassword.value;
                                },
                                child: Icon(obsecurePassword.value ? Icons.visibility_off_outlined : Icons.visibility),
                              ),
                            );
                          },
                        ),
                        ValueListenableBuilder(
                          valueListenable: obsecureConfirmPassword,
                          builder: (context, value, child) {
                            return WATextFormField(
                              controller: confirmController,
                              obscureText: obsecureConfirmPassword.value,
                              hintText: "Enter Confirm Password",
                              showBorder: false,
                              suffixIcon: InkWell(
                                onTap: () {
                                  obsecureConfirmPassword.value = !obsecureConfirmPassword.value;
                                },
                                child: Icon(obsecureConfirmPassword.value ? Icons.visibility_off_outlined : Icons.visibility),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        WAButton(
                          "Sign Up",
                          loading: authViewModel.signuploading,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final data = {
                                "fname": fnameController.text.toString(),
                                "lname": lnameController.text.toString(),
                                "email": emailController.text.toString(),
                                "mobile": mobileController.text.toString(),
                                "countrycode": "+91",
                                "password": passwordController.text.toString(),
                                "confirmpassword": confirmController.text.toString(),
                                "role": "user"
                              };
                              authViewModel.resgisterApi(data, context);
                            }
                          },
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WaText(
                              "Already have an account ",
                              // textAlignment: Alignment.center,
                              fontsize: 12.dp,
                              textcolor: AppColors.blackColor.withOpacity(0.7),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RoutesName.login);
                              },
                              child: WaText(
                                "Login",
                                // textAlignment: Alignment.center,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                                fontsize: 14.dp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        WaText(
                          "",
                          fontsize: 11,
                          baskerville: true,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          textcolor: AppColors.blackColor.withOpacity(0.5),
                          textSpans: const [
                            TextSpan(
                              text: 'By clicking \'Sign up\' I accept the ',
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of Use',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                // Making this part bold
                              ),
                            ),
                            TextSpan(
                              text: ' of Weddingaro.',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget _buildBottomSheetContent(BuildContext context) {
//   return SingleChildScrollView(
//     child: 
//   );
// }

// Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // TextFormField(
//               //   controller: emailController,
//               //   keyboardType: TextInputType.emailAddress,
//               //   focusNode: emailFocusNode,
//               //   decoration: const InputDecoration(
//               //     hintText: 'Email',
//               //     labelText: 'Email',
//               //     prefix: Icon(Icons.alternate_email),
//               //   ),
//               //   onFieldSubmitted: (value) => Utils.fieldFocusChange(
//               //       context, emailFocusNode, passwordFocusNode),
//               // ),
//               // ValueListenableBuilder(
//               //   valueListenable: obsecurePassword,
//               //   builder: (context, value, child) {
//               //     return TextFormField(
//               //       controller: passwordController,
//               //       obscureText: obsecurePassword.value,
//               //       focusNode: passwordFocusNode,
//               //       decoration: InputDecoration(
//               //         hintText: 'Password',
//               //         labelText: 'Password',
//               //         prefix: const Icon(
//               //           Icons.lock_open_rounded,
//               //         ),
//               //         suffixIcon: InkWell(
//               //           onTap: () {
//               //             obsecurePassword.value = !obsecurePassword.value;
//               //           },
//               //           child: Icon(obsecurePassword.value
//               //               ? Icons.visibility_off_outlined
//               //               : Icons.visibility),
//               //         ),
//               //       ),
//               //     );
//               //   },
//               // ),
//               // SizedBox(
//               //   height: height * 0.085,
//               // ),
//               // RoundButton(
//               //   title: 'Login',
//               //   loading: authViewModel.loading,
//               //   onpress: () {
//               //     // Utils.flushBarErrorMessage('please enter email', context);
//               //     Map data = {
//               //       'email': emailController.text.toString(),
//               //       'password': passwordController.text.toString(),
//               //     };
//               //     authViewModel.loginApi(data, context);
//               //   },
//               // ),
//               // SizedBox(
//               //   height: height * 0.085,
//               // ),
//               // InkWell(
//               //   onTap: () {
//               //     Navigator.pushNamed(context, RoutesName.signup);
//               //   },
//               //   child: Text('Dont have account sign up'),
//               // )
//               hel
//             ],
//           ),
