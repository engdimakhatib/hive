import 'package:flutter/material.dart';
import 'package:travel_app/views/post_screen.dart';


  var category =['Best Plces' , 'Most Visited' , 'Favourites' ,'New Added' ,'Hotels' ,'Restaurants'];
Widget buildHoizontalMarqueeText() =>
                 Row(children: [
                  for(int i=0;i<6 ;i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10,),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(10),
                    boxShadow :const [BoxShadow(color: Colors.black26 ,blurRadius: 4)],
                    ),
                    child: Text(category[i], style: const TextStyle(color : Colors.black , fontSize: 15 ,fontWeight: FontWeight.w500),) ,
                  ),
                ],);


  //subZkeerListView 
Widget buildVerticalPic(BuildContext context ,int index) =>
                Padding(
                    padding: const EdgeInsets.all(15),
                    child : Column(
                      children: [
                        InkWell(
                        //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const postScreen()));},
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(color: Colors.black ,borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: AssetImage("images/city${index +1}.jpeg"),fit: BoxFit.cover,opacity: 0.8,),),
                          ), 
                        ),
                     Padding(
                      padding: const EdgeInsets.only(top:10),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
                          Text("City Name" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600),),
                          Icon(Icons.more_vert , size : 30 ),
                      ],),
                    ),
                    const SizedBox(height: 5,),
                    Row( children:const [
                      Icon(Icons.star ,color:Colors.amber , size:20,),
                      Text("4.5" , style: TextStyle(fontWeight: FontWeight.w500),),
                    ],)
                      ],),
                    ) ;