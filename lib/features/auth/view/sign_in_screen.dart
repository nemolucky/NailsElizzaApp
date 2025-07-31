import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:app/repositories/user/user.dart';
import 'package:app/features/auth/widgets/widgets.dart';
import 'package:app/features/utils/widgets/widgets.dart';
import 'package:app/features/config/theme/text_styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final userRepository = GetIt.I.get<AbstractUserRepository>();
  final TextEditingController _tgUsernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();  

  Future<void> _signIn() async {
    try {
      
      // TODO: Поработать с SnackBar

      if (_tgUsernameController.text.isEmpty || 
          _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Заполните все поля')),
        );
        return;
      }

      final success = await userRepository.signIn(
        _tgUsernameController.text.trim(),
        _passwordController.text.trim());

      if (success){
        if (mounted){
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пользователь с таким ником уже существует')),
        );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка регистрации: ${e.toString()}')),
      );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(235, 235, 235, 1),
        body: SafeArea(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacer(flex: 3,),
                    const Text("Вход", style: TextStyles.title),
                    const Spacer(flex: 3,),
                    InputField(
                      hintText: "Ник в телеграмм",
                      controller: _tgUsernameController,
                    ),
                    const Spacer(flex: 1,),
                    InputField(
                      hintText: "Пароль",
                      obsecure: true,
                      controller: _passwordController,
                    ),
                    const Spacer(flex: 4,),
                    BaseButton(
                        buttonText: "Войти",
                        function: _signIn
                    ),
                    const Spacer(flex: 1,),
                    const Promt(
                      question: "Нет аккаунта?",
                      transition: "Регистрация.", 
                      route: "/register"
                    ),
                    const Spacer(flex: 3,),
                  ],
              ),
            )
        ),
    );
    }
}