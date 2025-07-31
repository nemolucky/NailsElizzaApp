import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:app/repositories/user/user.dart';
import 'package:app/repositories/service/service.dart';
import 'package:app/features/splash/widgets/widgets.dart';
import 'package:app/features/config/theme/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late final AbstractServiceRepository serviceRepository;
  late final AbstractUserRepository userRepository;

  @override
  void initState() {
    super.initState();
    _initServices();
  }

  Future<void> _initServices() async{

    serviceRepository = GetIt.I.get<AbstractServiceRepository>();
    userRepository = GetIt.I.get<AbstractUserRepository>();

    final successAuth = await userRepository.checkAuthToken();
    await serviceRepository.syncServices();
    
    if (mounted) {
      if (successAuth) {
        Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false,);
      }else {
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false,);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
      ),
      child: Center(
        child: Column(
          children: [
            const Spacer(flex: 2,),
            const LogoImage(route: 'assets/images/logo.png',),
            const SizedBox(height: 20,),
            const Text("NAILSELIZZA", style: TextStyles.splashTitle,),
            const Spacer(flex: 3,)
          ],
        ),
      ),
    );
  }
}