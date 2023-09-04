import 'package:flutter/material.dart';

import 'package:plant_note/features/plants/presentation/pages/plants_page.dart';

import '../widgets/log_in_form_input_widget.dart';

class StartPage extends StatefulWidget {

  StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextEditingController loginController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> loginKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> passwordKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Form(
                key: _formKey,
                  child: Column(
            children: [
              LogInFormField(
                  fieldKey: loginKey,
                  title: 'Логін',),
              LogInFormField(
                  fieldKey: passwordKey,
                  title: 'Пароль'),
              OutlinedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const PlantListPage())
                  );
                }
              }, child: const Text('Увійти')),
              OutlinedButton(onPressed: (){}, child: const Text('Зареєструватись'))
            ],
          )),
        ],
      ),
    );
  }
}
