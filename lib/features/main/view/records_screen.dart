import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/features/utils/widgets/widgets.dart';
import 'package:app/features/config/theme/text_styles.dart';
import 'package:app/features/main/records_bloc/records_bloc.dart';


class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {

  final _recordsBloc = RecordsBloc();

  @override
  void initState() {
    _recordsBloc.add(LoadRecords());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RecordsBloc, RecordsState>(
        bloc: _recordsBloc,
        builder: (context, state) {
          if (state is RecordsLoaded){
            if (state.bookManicureList.isEmpty) {
              return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacer(flex: 1,),
                    const Text(
                      "Записи",
                      style: TextStyles.title,
                    ),
                    const Spacer(flex: 5,),
                    Text("У вас пока нет записи", style: TextStyles.smallText.copyWith(fontSize: 18)),
                    const Spacer(flex: 5,),
                    BaseButton(buttonText: "Записаться"),
                    const Spacer(flex: 1,)
                  ],
                ),
              )
            );
            }
            else{
              return Text(state.bookManicureList.length.toString());
            }
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}