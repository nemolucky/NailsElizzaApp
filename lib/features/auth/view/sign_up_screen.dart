import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:app/repositories/user/user.dart';
import 'package:app/features/auth/widgets/widgets.dart';
import 'package:app/features/utils/widgets/widgets.dart';
import 'package:app/features/config/theme/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final userRepository = GetIt.I.get<AbstractUserRepository>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _tgUsernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();  

  Future<void> _signUp() async {
    try {

      // TODO: Поработать с SnackBar      
      
      if (_nameController.text.isEmpty || 
          _tgUsernameController.text.isEmpty || 
          _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Заполните все поля')),
        );
        return;
      }

      final success = await userRepository.signUp(
        _nameController.text.trim(), 
        _tgUsernameController.text.trim(), 
        _passwordController.text.trim()
      );

      if (success){
        if (mounted) {
          Navigator.of(context).pushNamed('/login');
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
  void dispose() {
    _nameController.dispose();
    _tgUsernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    const Text("Регистрация", style: TextStyles.title),
                    const Spacer(flex: 3,),
                    InputField(
                      hintText: "Имя",
                      controller: _nameController,
                    ),
                    const Spacer(flex: 1,),
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
                      buttonText: "Подтвердить",
                      function: _signUp,
                    ),
                    const Spacer(flex: 1,),
                    const Promt(
                      question: "Уже есть аккаунт?",
                      transition: "Войти.", 
                      route: "/login"
                    ),
                    const Spacer(flex: 4,),
                  ],
              ),
            )
        ),
    );
    }
}