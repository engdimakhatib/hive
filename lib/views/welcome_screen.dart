import 'package:flutter/material.dart';
import 'home_screen.dart';
class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Material(
      color : Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("images/pray1.png"),fit: BoxFit.fill,), ),
        child: SafeArea(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 65),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             const Text('روحانيات',style:TextStyle(color: Colors.black , fontSize: 35 , fontWeight: FontWeight.bold , letterSpacing: 1.5,),),
            const SizedBox(height: 2,),
             Text('غذي روحك',style:TextStyle(color: Colors.black.withOpacity(0.7) , fontSize: 35, fontWeight: FontWeight.w400 , letterSpacing: 1.5,),),
            const SizedBox(height: 12,),
             Text("تطبيق سيساعدك بالحفاظ على أذكارك و صلواتك و يعطيك الأحاديث الشريفة و الرقيات الشرعية و يوفر مسبحة الكترونية و سيساعدك في الانتظام في روتينك الديني"
             ,textAlign: TextAlign.justify
             ,style:TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16 , letterSpacing: 1.2,),),
             const SizedBox(height: 30,),
      
             InkWell(
              onTap: () { Navigator.of(context).push(MaterialPageRoute(builder:((context) => HomePage() )));},
              child: Container(            
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration( color : Colors.black.withOpacity(0.05),borderRadius: BorderRadius.circular(12),),
                child :const Icon (Icons.arrow_forward_ios,color: Colors.black54,size:30),
              ),
             ),


            ],),
          ),
          ),
      ),
    );
  }
}