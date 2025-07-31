part of 'records_bloc.dart';

abstract class RecordsState{}

class RecordsInitial extends RecordsState{}

class RecordsLoading extends RecordsState{}

class RecordsLoaded extends RecordsState{
  RecordsLoaded({required this.bookManicureList});
  final List<BookManicure> bookManicureList;
}
