
import 'package:flutter/cupertino.dart';

final addVariables = AddData._();

class AddData {

  AddData._();

  String URL = "http://localhost:5000/graphql";

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDob =  TextEditingController();
  TextEditingController txtGender = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  String aniImage = "https://lottie.host/aa666659-b654-4767-af2b-fbc9b33b9d20/pMOuxplJ96.json";


}