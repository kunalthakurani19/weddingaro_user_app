import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:weddingaro_user_app/resources/color.dart';
import 'package:weddingaro_user_app/resources/common_components/common_appbar.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/resources/common_components/watextformfeild.dart';
import 'package:weddingaro_user_app/view_model/auth_view_model.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> obsecurePassword = ValueNotifier(true);

  TextEditingController resetEmailController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();

    resetEmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _showModalBottomSheet(context);
    // });
    final authViewModel = Provider.of<AuthViewModel>(context);

    // final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: const CommonAppBar(
        isNotDrawer: true,
        title: 'Forgot Password',
      ),
      body: Container(
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                const Center(
                  child: WaText(
                    "Forgot password, don’t worry we have your back",
                    textcolor: AppColors.blackColor,
                    baskerville: true,
                    fontWeight: FontWeight.w400,
                    fontsize: 25,
                    // textAlignment: Alignment.center,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const WaText(
                  "Enter your email address for instructions to reset your password.",
                  fontsize: 15,
                  textAlignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 1.h,
                ),
                WATextFormField(
                  hintText: "Enter Your Email",
                  controller: resetEmailController,
                  keyboardType: TextInputType.emailAddress,
                  showBorder: false,
                  whichValidation: 'Email',
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 4.h,
                ),
                WAButton(
                  "Reset Password",
                  loading: authViewModel.signuploading,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      final data = {"email": resetEmailController.text.toString(), "role": "vendor"};

                      authViewModel.forgotPasswordApi(data, context);
                    }
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
