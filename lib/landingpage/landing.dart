import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../utils/appt_text_style.dart';
import '../utils/utils.dart';
import 'landing_viewmodel.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Utils.deviceHeight = MediaQuery.of(context).size.height;
    Utils.deviceWidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder<LandingPageViewModel>.reactive(
        viewModelBuilder: () => LandingPageViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SingleChildScrollView(
              // Add this to enable scrolling
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF6F3EE),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Utils.getIcon("assets/images/logo.png", 72, 56),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          viewModel.getMorningText(),
                          style: AppTextStyle.textStylePoppins24w600,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center,
                      children: [
                        Text(
                          viewModel.getLogInText(),
                          style: AppTextStyle.textStylePoppins17w500,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 240),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center content horizontally within Row
                      children: [
                        Text(
                          viewModel.getEmailAddressText(),
                          style: AppTextStyle.textStylePoppins12w400,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Form(
                        key: viewModel.formKey,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 320, // Set the maximum width as per your requirement
                          ),
                          child: TextFormField(
                            controller: viewModel.emailController,
                            validator: viewModel.validateEmail,
                            style: const TextStyle(color: Color(0XFF000000)),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10), // Adjust padding
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blue), // Set the focused border color
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: "",
                            ),
                          ),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 260),
                      child: Text(
                        viewModel.getPasswordText(),
                        style: AppTextStyle.textStylePoppins12w400,
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 320, // Set the maximum width as per your requirement
                      ),
                      child: Form(
                        key: viewModel.passwordFormKey,
                        child: TextFormField(
                          obscureText: viewModel.obscureText,
                          controller: viewModel.passwordController,
                          validator: viewModel.validatePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue), // Set the focused border color
                              borderRadius: BorderRadius.circular(4),
                            ),
                            hintText: '',
                            suffixIcon: IconButton(
                              icon: Icon(viewModel.obscureText ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                viewModel.toggleObscureText();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 320,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF1589CA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.handleButtonClick(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1589CA),
                        minimumSize: const Size(550, 50),
                      ),
                      child: Text(
                        viewModel.getButtonLogInText(),
                        style:
                        TextStyle(fontSize: 26, color: Color(0XFFFFFFFF)),
                      ),
                    ),
                  ),
                  SizedBox(height: 32,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 142,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFDFDFDF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Opacity(
                        opacity: 0.50,
                        child: Text(
                          viewModel.getOrText(),
                          style: AppTextStyle.textStylePoppins13w400,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 142,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFDFDFDF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 64,
                          height: 64,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF6F3EE),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Utils.getIcon("assets/images/image 6.png", 35, 35)
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF6F3EE),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Utils.getIcon("assets/images/google (2).png", 35, 35),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
