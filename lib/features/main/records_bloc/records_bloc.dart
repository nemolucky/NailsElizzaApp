import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/repositories/book_manicure/book_manicure_repository.dart';

part 'records_event.dart';
part 'records_state.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc() : super(RecordsInitial()) {
    on<LoadRecords>((event, emit) {
      emit(RecordsLoaded(bookManicureList: []));
    });
  }
}