import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/features/modules/counter/controller/cubit/state.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit(): super(CounterInitialState());

  static CounterCubit get(context)=>BlocProvider.of(context);

 int counter = 0;

 void incrementCounter()
 {
   counter++;
   emit(CounterIncrementState());
 }

 void decrementCounter()
 {
   counter --;
   emit(CounterDecrementState());
 }

}