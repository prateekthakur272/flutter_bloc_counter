import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


class CounterEvent extends Equatable{
  const CounterEvent();
  
  @override
  List<Object?> get props => [];
}

class IncreaseCounter extends CounterEvent{}
class DecreaseCounter extends CounterEvent{}
class ResetCounter extends CounterEvent{}

class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc():super(0){
    on<IncreaseCounter>((event,emit){
      emit(state+1);
    });
    on<DecreaseCounter>((event,emit){
      emit(state-1);
    });
    on<ResetCounter>((event, emit){
        emit(0);
    });
  }
}