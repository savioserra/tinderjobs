import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jobtinder/models/user.dart';
import 'package:jobtinder/screens/job_search.dart';
import 'package:jobtinder/styles/fonts.dart';
import 'package:jobtinder/widgets/button.dart';
import 'package:provider/provider.dart';

import 'package:jobtinder/graphql/mutation.dart' as Mutations;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Background(
      imagePath: "assets/images/login_background.jpg",
      overlayColor: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: LoginForm(),
          ),
          Footer()
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "JobTinder",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Righteous",
                fontSize: 25.0,
              ),
            ),
          ),
          InputField(
            placeholder: "Email",
            controller: emailController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: InputField(
              placeholder: "Password",
              controller: passwordController,
              obscure: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 30.0, left: 30.0),
            child: Mutation(
              onCompleted: handleLogin,
              options: MutationOptions(
                document: Mutations.login,
              ),
              builder: (login, result) => Container(
                    height: 54.0,
                    child: Button(
                      outline: true,
                      splashColor: Colors.black54,
                      loading: result.loading,
                      onTap: result.loading
                          ? null
                          : () => login({
                                "email":
                                    emailController.text.trim().toLowerCase(),
                                "password": passwordController.text
                              }),
                      child: Fonts.montserrat(
                        "Login",
                        color: Colors.white,
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void handleLogin(data) async {
    if (data != null) {
      final token = data['login']['token'];

      await SharedPreferences.getInstance()
        ..setString('user-token', token);

      Provider.of<User>(context).token = token;

      Navigator.of(context).pushReplacementNamed(JobSearch.routeName);
    }
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, right: 30.0, left: 30.0),
      child: Container(
        alignment: Alignment.center,
        height: 40.0,
        child: Button(
          onTap: () {},
          borderColor: Colors.transparent,
          splashColor: Colors.white,
          color: Colors.black26,
          child: Fonts.montserrat(
            "Não possui uma conta? Crie uma!",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  final Color overlayColor;
  final String imagePath;

  Background({this.child, this.imagePath, this.overlayColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fitHeight,
          colorFilter: ColorFilter.mode(
            overlayColor.withOpacity(0.8),
            BlendMode.luminosity,
          ),
        ),
      ),
      child: child,
    );
  }
}

class InputField extends StatelessWidget {
  final String placeholder;
  final bool obscure;
  final TextEditingController controller;

  InputField({this.placeholder, this.controller, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: placeholder,
          border: InputBorder.none,
        ),
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Montserrat",
        ),
      ),
    );
  }
}
