part of 'prompt_bloc.dart';

class PromptState extends Equatable {
  final ApiResponse apiResponse;
  final Uint8List? uint8list;
  final String message;

  const PromptState({
    this.apiResponse = ApiResponse.loading,
    this.message = '',
    this.uint8list,
  });

  PromptState copyWith({
    ApiResponse? apiResponse,
    Uint8List? uint8list,
    String? message,
  }) {
    return PromptState(
        apiResponse: apiResponse ?? this.apiResponse,
        uint8list: uint8list ?? this.uint8list,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [apiResponse, apiResponse];
}
