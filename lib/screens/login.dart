import 'package:flutter/material.dart';
import 'package:jobtinder/models/user.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      imagePath: "assets/images/login_background.jpg",
      overlayColor: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Form(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InputField(
                      placeholder: "Password",
                      obscure: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          onTap: () {},
                          child: Container(
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            width: double.infinity,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Footer()
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 15.0),
      child: Text(
        "Não possui uma conta? Crie uma!",
        style: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white,
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

  InputField({this.placeholder, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: placeholder,
          border: InputBorder.none,
        ),
        obscureText: obscure,
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Montserrat",
          // fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
