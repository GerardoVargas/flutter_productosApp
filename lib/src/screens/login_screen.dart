import 'package:flutter/material.dart';
import 'package:productosapp/providers/login_form_provider.dart';
import 'package:productosapp/src/utils/size_responsive.dart';
import 'package:productosapp/src/widgets/widgets.dart';
import 'package:productosapp/ui/input_decorations.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive(context);

    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: responsive.hp(28)),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Login', style: TextStyle(fontSize: responsive.dp(4.5))),
                    SizedBox(height: 30),
                    ChangeNotifierProvider(
                      //SOLO RECIBE UN SOLO PROVIDER
                      //INSTANCIAMOS EL LOGINFORMPROVIDER
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm(),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              Text('Crear una nueva cuenta', style: TextStyle(fontSize: responsive.dp(2), fontWeight: FontWeight.bold)),
            ],
          ),
        )
      )
   );
  }
}

class _LoginForm extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive(context);
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        //TODO: Mantener la referencia al KEY
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,  

        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Email',
                prefixIcon: Icons.email_outlined
              ),
              onChanged: (value) => loginForm.email = value,
              validator: ( value ) {
                //REGEX para evaluar el email
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'No es un correo válido';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Password',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: (value) => loginForm.password = value,
              validator: ( value ) {
                return (value != null && value.length >= 6) 
                  ? null
                  : 'La contraseña debe ser de 6 caracteres';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
              onPressed: loginForm.isLoading 
                ? null 
                : () async{
                //TODO: login form

                  FocusScope.of(context).unfocus();

                  if(!loginForm.isValidForm()) return;

                  loginForm.isLoading = true;

                  await Future.delayed(Duration(seconds: 3));

                  //TODO: Validar si el login es correcto
                  loginForm.isLoading = false;

                  Navigator.pushReplacementNamed(context, 'home');
                },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(20), vertical: responsive.hp(2)),
               child: Text(
                 loginForm.isLoading 
                  ? 'Espere...' 
                  : 'Ingresar',
                 style: TextStyle(color: Colors.white, fontSize: responsive.dp(2)),
                ),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}