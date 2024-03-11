import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:weddingaro_user_app/resources/color.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/resources/img_res.dart';
import 'package:weddingaro_user_app/utils/routes/routes_name.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
    // final authViewModel = Provider.of<AuthViewModel>(context);

    // final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageRes.loginBG),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
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
                  "Boost Your business \n with us",
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
            bottom: 0,
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
                        "Create New Password",
                        textcolor: AppColors.blackColor,
                        baskerville: true,
                        fontWeight: FontWeight.w400,
                        fontsize: 25,
                        textAlignment: Alignment.center,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const WaText(
                      textAlignment: Alignment.centerLeft,
                      "Enter a new password and you are ready. ",
                      fontsize: 15,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const WaText(
                      textAlignment: Alignment.centerLeft,
                      "New password ",
                      fontsize: 15,
                    ),
                    ValueListenableBuilder(
                      valueListenable: obsecurePassword,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: passwordController,
                          obscureText: obsecurePassword.value,
                          focusNode: passwordFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Enter new password',
                            suffixIcon: InkWell(
                              onTap: () {
                                obsecurePassword.value = !obsecurePassword.value;
                              },
                              child: Icon(obsecurePassword.value ? Icons.visibility_off_outlined : Icons.visibility),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const WaText(
                      textAlignment: Alignment.centerLeft,
                      "Confirm new password",
                      fontsize: 15,
                    ),
                    ValueListenableBuilder(
                      valueListenable: obsecurePassword,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: passwordController,
                          obscureText: obsecurePassword.value,
                          focusNode: passwordFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Enter confirm password',
                            suffixIcon: InkWell(
                              onTap: () {
                                obsecurePassword.value = !obsecurePassword.value;
                              },
                              child: Icon(obsecurePassword.value ? Icons.visibility_off_outlined : Icons.visibility),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    WAButton(
                      "Save",
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.home);
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
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
