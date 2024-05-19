import 'package:flutter/material.dart';
import 'package:mobile_components/mobile_components.dart';
import '/view/components/labled_textfield.dart';
import '/view/constants/app_colors.dart';

import '../../core/inputs.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({
    super.key,
    this.onPressed,
    this.isLoading = false,
  });

  final void Function(LoginInputs inputs)? onPressed;
  final bool isLoading;

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  bool isSecure = false;
  double initialChildSize = 0.60;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder =
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.black));
    final bool isKeyboardVisible = MediaQuery.viewInsetsOf(context).bottom > 0;
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: isKeyboardVisible ? 0.80 : 0.60,
      minChildSize: 0.50,
      maxChildSize: 0.90,
      builder: (context, scrollController) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
                color: const Color(0xFFefefee),
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                controller: scrollController,
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    Row(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        const Spacer(),
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                      ],
                    ),
                    LabledTextField(
                      hintText: "Enter UserName",
                      controller: userNameController,
                      title: 'Username',
                      validatee: (v) {
                        if (v!.isEmpty) {
                          return 'Please enter user name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Please enter pass';
                            }
                            return null;
                          },
                          obscureText: isSecure,
                          cursorColor: AppColors.totColor,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Enter Your Password",
                            border: outlineInputBorder,
                            focusedBorder: outlineInputBorder,
                            enabledBorder: outlineInputBorder,
                            errorBorder: outlineInputBorder.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            disabledBorder: outlineInputBorder,
                            focusedErrorBorder: outlineInputBorder.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                IconData(
                                  isSecure ? 0xe6be : 0xe6bd,
                                ),
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    isSecure = !isSecure;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.07,
                    ),
                    TotButton(
                        isLoading: widget.isLoading,
                        onPressed: () {
                          widget.onPressed?.call(LoginInputs(
                            username: userNameController.text,
                            password: passwordController.text,
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.totColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fixedSize: Size(
                            MediaQuery.sizeOf(context).width * 0.9,
                            50,
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )),
                  ]),
                )));
      },
    );
  }
}
