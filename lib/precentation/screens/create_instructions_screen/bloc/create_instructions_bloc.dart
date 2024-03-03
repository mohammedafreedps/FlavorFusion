import 'package:bloc/bloc.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_event.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_state.dart';


class CreateInstructionsBloc extends Bloc<CreateInstructionsEvent, CreateInstructionsState> {
  // final _valueHolder = ValueHolder();
  CreateInstructionsBloc() : super(CreateInstructionsInitial()) {
    on<CreateInstructionsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddStepsButtonClickedEvent>((event, emit) {
      hinstructionsSteps.add(event.instruction);
      emit(ShowInstructionsState(instructions: hinstructionsSteps));
    });
    on<DeleteStepsButtonClickedEvent>((event, emit) {
      hinstructionsSteps.removeAt(event.index);
      emit(ShowInstructionsState(instructions: hinstructionsSteps));
    });
  }
}
