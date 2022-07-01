import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  //PARA CONECTAR EL FORM A ALGUN OBJETO EN NUESTRO PROVIDER
  //RECIBE UN STATE
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  //PARA MANEJAR EL ESTADO DE LA APP

  String? email = '';
  String? password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading (bool value) {
    _isLoading = value;
    notifyListeners();
  }



  bool isValidForm() {

    //Para verificar si el form es valido
    print(formKey.currentState?.validate());

    print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }


}