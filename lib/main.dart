import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/models/zkeerModel.dart';
import 'package:travel_app/simple_bloc_observer.dart';
import 'package:travel_app/views/welcome_screen.dart';
import 'constants.dart';
import 'cubit/zkeer_cubit/appcubit.dart';
import 'models/subZkeerModel.dart';

void main() async{
  /*
Future<void> init() async {
    Hive.registerAdapter(UserAdapter()); // Registering UserAdapter
    _userBox = await Hive.openBox<User>('users');
}
  */
   WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
   //Hive.registerAdapter(subZkeerModelAdapter());
  Hive.registerAdapter(ZkeerModelAdapter());
  await Hive.openBox<ZkeerModel>(kZkeerBox);
   await Hive.openBox<ZkeerModel>(kSubZkeerBox);
    runApp( const MyHomePage());
  }


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState()
  {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
  @override
  Widget build(BuildContext context) {
  return   BlocProvider(
       create: (context) => ZkeerCubit(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEDF2F6),),
       home: const welcomeScreen(),
      ),
    );
  }
}