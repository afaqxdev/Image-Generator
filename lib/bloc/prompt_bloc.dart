
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_generator/api_class/api_class.dart';
import 'package:image_generator/api_class/enum_class.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(const PromptState()) {
    on<PromptEnteredEvent>(promptEnteredEvent);
  }
 
  
     promptEnteredEvent( PromptEnteredEvent event, Emitter<PromptState> emit)async {
   
  await ApiClass.generatingImage(event.prompt).then((value) {
 emit(state.copyWith(apiResponse: ApiResponse.success,message:"success",uint8list: value));
     });

   
   
  }

  
}