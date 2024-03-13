import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_generator/ui/view_scree.dart';

import 'bloc/prompt_bloc.dart';

void main() {

  runApp(const MyApp());


  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    
    
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>PromptBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
       
         brightness: Brightness.dark,
         scaffoldBackgroundColor: Colors.grey.shade900
        ),
        home: UiScreen(),
      ),
    );
  }
}
