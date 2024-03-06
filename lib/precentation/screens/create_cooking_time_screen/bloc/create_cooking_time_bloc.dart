import 'package:bloc/bloc.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/bloc/create_cooking_time_event.dart';
import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/bloc/create_cooking_time_state.dart';


class CreateCookingTimeBloc extends Bloc<CreateCookingTimeEvent, CreateCookingTimeState> {
  // final _valueHolder = ValueHolder();
  CreateCookingTimeBloc() : super(CreateCookingTimeInitial()) {
    on<CreateCookingTimeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SetAllTimeButtonClickedEvent>((event, emit) {
      print(event.prpTime+'bloc valeu');
      hprepTime = event.prpTime;
      hcookTime = event.cookingTime;
      htotalTime = event.totalTime;
      print('time setted');
      print(hcookTime);
      emit(AllTimeSettedState());
    });

    // on<EditCookingTimeEvent>((event, emit) {
    //   hprepTime = event.prepTime;
    //   hcookTime = event.cookingTime;
    //   htotalTime = event.totalTime;
    //   emit(EditCookingTimeState(prepTime: hprepTime!, cookingTime: hcookTime!, totalTime: htotalTime!));
    // });
  }
}
