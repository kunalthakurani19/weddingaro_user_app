import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:weddingaro_user_app/resources/color.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/resources/common_components/watextformfeild.dart';
import 'package:weddingaro_user_app/resources/img_res.dart';
import 'package:weddingaro_user_app/screens/afterAuthScreens/main_screen.dart';
import 'package:weddingaro_user_app/utils/routes/routes_name.dart';
import 'package:weddingaro_user_app/view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> obsecurePassword = ValueNotifier(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _showModalBottomSheet(context);
    // });
    final authViewModel = Provider.of<AuthViewModel>(context);

    // final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1633104502699-b2ecf0fee294?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGluZGlhbiUyMHdlZGRpbmd8ZW58MHx8MHx8fDA%3D'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(ImageRes.whiteWAlogoPng),
                SizedBox(height: 4.h),
                const WaText(
                  "Plan Your Wedding",
                  fontsize: 30,
                  baskerville: true,
                  textcolor: AppColors.whiteColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                ),
                const WaText(
                  "with Weddingaro",
                  fontsize: 15,
                  baskerville: true,
                  textcolor: AppColors.whiteColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            right: 10,
            child: WAButton(
              "Register Later",
              height: 3.h,
              fontsize: 11,
              width: 40.w,
              color: AppColors.darkRed,
              buttonColor: AppColors.whiteColor,
              borderColor: AppColors.darkRed,
              onPressed: () {
                pushNewScreen(context, screen: const MainScreen());
              },

              // width: 30,
            ),
          ),
          Form(
            key: _formKey,
            child: Positioned(
              bottom: 0,
              // top: MediaQuery.of(context).size.height * 0.40,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        const Center(
                          child: WaText(
                            "Login To Continue",
                            textcolor: AppColors.blackColor,
                            baskerville: true,
                            fontWeight: FontWeight.w400,
                            fontsize: 25,
                            textAlignment: Alignment.center,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const WaText(
                          "Email",
                          fontsize: 15,
                          textAlignment: Alignment.centerLeft,
                        ),
                        WATextFormField(
                          hintText: "Enter Your Email",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          showBorder: false,
                          whichValidation: 'Email',

                          // validator: ,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const WaText(
                          textAlignment: Alignment.centerLeft,
                          "Password",
                          fontsize: 15,
                        ),
                        ValueListenableBuilder(
                          valueListenable: obsecurePassword,
                          builder: (context, value, child) {
                            return WATextFormField(
                              controller: passwordController,
                              obscureText: obsecurePassword.value,
                              showBorder: false,
                              hintText: 'Enter Your Password',
                              whichValidation: 'Password',
                              suffixIcon: InkWell(
                                onTap: () {
                                  obsecurePassword.value = !obsecurePassword.value;
                                },
                                child: Icon(obsecurePassword.value ? Icons.visibility_off_outlined : Icons.visibility),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, RoutesName.forgotpassword),
                          child: WaText(
                            "Forgot your Username/Password?",
                            textAlignment: Alignment.centerRight,
                            fontsize: 12.dp,
                            textcolor: AppColors.blackColor.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        WAButton(
                          "Log in",
                          loading: authViewModel.loading,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final data = {
                                "username": emailController.text.toString(),
                                "password": passwordController.text.toString(),
                              };

                              authViewModel.loginApi(data, context);
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
                              "Don't have an account? ",
                              // textAlignment: Alignment.center,
                              fontsize: 12.dp,
                              textcolor: AppColors.blackColor.withOpacity(0.7),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RoutesName.signup);
                              },
                              child: WaText(
                                "Signup",
                                fontWeight: FontWeight.bold,
                                // textAlignment: Alignment.center,
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
        ],
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
