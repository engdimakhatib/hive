import 'package:flutter/material.dart';
import '../../models/zkeerModel.dart';


class Zkeer_Item extends StatefulWidget {
 ZkeerModel zkeermodel;
late Function(ZkeerModel newModelData) onTapAddCurNum;
late Function(ZkeerModel newModelData) onTapAddSubZkeer;
Function(ZkeerModel newModelData) onTapDelete;
Function(ZkeerModel newModelData) onTapEditSettings;
Function(ZkeerModel newModelData) onTapInfo;
   Zkeer_Item( {super.key ,
   required this.zkeermodel,
   required this.onTapAddCurNum,
   required this.onTapAddSubZkeer,
   required this.onTapDelete,
   required this.onTapEditSettings,
 required this.onTapInfo,
   });

  @override
  State<Zkeer_Item> createState() => _Zkeer_ItemState();
}
class _Zkeer_ItemState extends State<Zkeer_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
 //     color: Colors.green,
                height: 200,
                  child: InkWell(
                      onTap: () {
                         setState(() { widget.zkeermodel.curNum++; });
                        widget.onTapAddCurNum(widget.zkeermodel);
                        },
                      child: Container(
                        width : 185,
                        padding:  const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left:15,),
                        decoration: BoxDecoration(color :Color(widget.zkeermodel.color) , borderRadius: BorderRadius.circular(15),),
                            child: Row( children: [
                                  Container(
                                 //   color : Colors.yellow,
                                     width:35,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [       
                                  IconButton(onPressed: (){ }, icon: const Icon(Icons.add_box, color : Colors.white, size: 18,),),
                                 IconButton(onPressed: (){  widget.onTapDelete(widget.zkeermodel);}, icon:  const Icon(Icons.delete, color : Colors.white, size: 18,),),
                                  IconButton(onPressed: (){  widget.onTapEditSettings(widget.zkeermodel);}, icon:  const Icon(Icons.settings, color : Colors.white, size: 18,),),
                                  IconButton(onPressed: (){  widget.onTapInfo(widget.zkeermodel);}, icon:  const Icon(Icons.info_rounded, color : Colors.white, size: 18,),),
                                  ],),
                                ),
                          Container(
                                width:130,
                              //  color : Colors.red,
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      children: [
                                        SingleChildScrollView(         
                                                 child : Column (children: [
                                                    Column( children: [
                                                       Row(children: [
                                                         Expanded(child: Text(  widget.zkeermodel.title , textAlign: TextAlign.right, style: const TextStyle(color : Colors.white , fontSize:18 ,fontWeight: FontWeight.w600),)),
                                                       ],), 
                                                            const SizedBox(height: 10,),
                                                        Row( children: [    
                                                       Expanded(child: Text("عدد المرات  :   ${widget.zkeermodel.maxNum.toString()}", textAlign: TextAlign.right, style: TextStyle(color : Colors.white , fontSize:12 ,fontWeight: FontWeight.w600),),),
                                                       //Text( widget.zkeermodel.maxNum.toString(),textAlign: TextAlign.justify, style: const TextStyle(color : Colors.white , fontSize:12,fontWeight: FontWeight.w600),), 
                                                                  ], ),
                                                             const SizedBox(height: 10,),
                                                           Row (children: [
                                                           Expanded(child: Text("العدد الحالي :   ${widget.zkeermodel.curNum.toString()}",textAlign: TextAlign.right, style: TextStyle(color : Colors.white , fontSize:12 ,fontWeight: FontWeight.w600),),),
                                                         //Text(  widget.zkeermodel.curNum.toString(),textAlign: TextAlign.justify, style: const TextStyle(color : Colors.white , fontSize:12,fontWeight: FontWeight.w600),),     
                                                             ],),
                                                          const SizedBox(height: 10,),
                                                      Row(
                                                        children: [
                                                              const Expanded(child: Text("اكتمل  : ", textAlign: TextAlign.right, style: TextStyle(color : Colors.white , fontSize:12 ,fontWeight: FontWeight.w600),),),
                                               Container(
                                                color: Colors.green,
                                                      padding:const EdgeInsets.only(right:10) ,
                                                   child:  checkIcon (),
                                               ),
                                                        ], ),
                                                          ],),   
                                                 ],) 
                                        ),
                                         const Spacer(),
                                          const SizedBox(height: 10,),                      
                                          Container(
                                          padding: const EdgeInsets.only(right: 5),
                                          alignment: Alignment.bottomRight,
                                       child: Text(  widget.zkeermodel.date,textAlign: TextAlign.right, style:  TextStyle(color : Colors.white.withOpacity(0.7) , fontSize: 8 ,),),
                                     ),
                                      ], ),
                                  ),
                                ),        
                              ],),
                          ),
                        ),            
           );
  }

  Icon checkIcon ()
  {
 if(widget.zkeermodel.done ) {return  const Icon(Icons.check , color : Colors.green , size : 18); } 
 else {return const Icon(Icons.close , color : Colors.red , size : 18);}
  }

}