import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app/repositories/service/service.dart';
import 'package:app/features/utils/widgets/widgets.dart';
import 'package:app/features/config/theme/text_styles.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {

  int? selectedIndex;
  final serviceRepository = GetIt.I.get<AbstractServiceRepository>();

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 1,),
              const Headliner(label: "Выбор услуги"),             
              const Spacer(flex: 1,),
              Expanded(
                flex: 10,
                child: ValueListenableBuilder<Box<Service>>(
                  valueListenable: serviceRepository.getServicesBox.listenable(),
                  builder: (context, box, _) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                      final service = box.getAt(index);
                      return RadioListTile<int>(
                          activeColor: theme.primaryColor,
                          title: Text(
                            service?.label ?? '',
                            style: TextStyles.blackSmallText,
                          ),
                          subtitle: Text(
                            service?.description ?? '', 
                            style: TextStyles.smallText.copyWith(
                              fontSize: 12
                            ),
                          ),
                          secondary: Text(
                            '${service?.price} ₽',
                            style: TextStyles.blackSmallText,
                          ),
                          value: index,
                          groupValue: selectedIndex,
                          onChanged: (int? value) {
                              setState(() => selectedIndex = value);
                          },
                      );
                      },
                    );
                  },
                ),
              ),
              const Spacer(flex: 1,),
              BaseButton(
                buttonText: "Продолжить",
                function: (){
                  Navigator.of(context).pushNamed('/calendar');
                },  
              ),
              const Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}