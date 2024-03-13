// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_generator/api_class/api_class.dart';
import 'package:image_generator/api_class/enum_class.dart';
import 'package:image_generator/bloc/prompt_bloc.dart';

class UiScreen extends StatelessWidget {
  UiScreen({super.key});

  TextEditingController controller = TextEditingController();
  PromptBloc promptBloc = PromptBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Generator ✈️'),
          backgroundColor: Colors.grey.shade700,
          centerTitle: true,
        ),
        body: Column(
          children: [
            BlocBuilder<PromptBloc, PromptState>(
                bloc: promptBloc,
                builder: (BuildContext context, state) {
                  
                  switch (state.apiResponse) {
                    case ApiResponse.loading:
                      return const Center(child: CircularProgressIndicator());
                    case ApiResponse.error:
                      return const Center(
                        child: Text("went Wrong"),
                      );
                    case ApiResponse.success:
                      if (state.uint8list != null) {
                        return Column(children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(

                                image: DecorationImage(
                                    image: MemoryImage(state.uint8list!))),
                          )),
                         
                          
                        ]);
                      }
                      {
                        return const Center(
                          child: Text("Enter Prompt"),
                        );
                      }
            
                    default:
                      return const SizedBox();
                  }
                }),
                 Container(
                        padding: const EdgeInsets.all(24),
                        height: 240,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Enter Your Prompt"),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.purple),
                                      borderRadius: BorderRadius.circular(12)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 46,
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    Colors.purple,
                                  )),
                                  onPressed: () {
                                    promptBloc.add(PromptEnteredEvent(
                                        prompt: controller.text));
                                  },
                                  icon: const Icon(Icons.generating_tokens),
                                  label: const Text("Generate")),
                            )
                          ],
                        ),),
          ],
        )
        );
  }
}
