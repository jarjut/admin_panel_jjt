import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../app/theme.dart';
import '../../widgets/gradient_button.dart';
import 'cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state.status == LoginStatus.error) {
                return SizedBox(
                  height: 24,
                  child: Text(
                    state.errorMessage ?? 'Login Error',
                    style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontWeight: FontWeight.w500),
                  ),
                );
              } else {
                return const SizedBox(height: 24);
              }
            },
          ),
          FormBuilderTextField(
            name: 'username',
            validator: FormBuilderValidators.required(context),
            decoration: const InputDecoration(
              hintText: 'Username',
              isDense: true,
              prefixIcon: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 8.0,
                  end: 8.0,
                ),
                child: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FormBuilderTextField(
            name: 'password',
            obscureText: true,
            validator: FormBuilderValidators.required(context),
            decoration: const InputDecoration(
              hintText: 'Password',
              isDense: true,
              prefixIcon: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 8.0,
                  end: 8.0,
                ),
                child: Icon(Icons.lock),
              ),
            ),
          ),
          const SizedBox(height: 36),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                height: 36,
                child: GradientButton(
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      // Login
                      String username =
                          _loginFormKey.currentState!.fields['username']!.value;
                      String password =
                          _loginFormKey.currentState!.fields['password']!.value;

                      BlocProvider.of<LoginCubit>(context)
                          .login(username, password);
                    }
                  },
                  linearGradientColor: primaryColor,
                  child: state.status == LoginStatus.loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.0,
                          ),
                        )
                      : const Text('Log In'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
