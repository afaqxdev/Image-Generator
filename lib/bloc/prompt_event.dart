// ignore_for_file: camel_case_types

part of 'prompt_bloc.dart';



abstract class PromptEvent extends Equatable {
@override
List<Object?> get props=>[];

}

class PromptEnteredEvent extends PromptEvent {
  final String prompt;
  PromptEnteredEvent({
    required this.prompt,
  });
}