import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestReceivedItem extends StatelessWidget {

  const RequestReceivedItem({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 55,
                  width: 55,
                  child:InkWell(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/honami.jpg"),
                    ),
                  ) ,
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    const Text("Mitsuri kanroji",style: TextStyle(fontSize: 17),),
                    const SizedBox(height: 5,),
                    Text("10 mutual friends",style: TextStyle(color: Colors.black.withOpacity(0.7)),)
                  ],
                )
              ],
            ),
           Row(
             children: [
               Container(
                 decoration:  BoxDecoration(
                   color: Colors.purple,
                     border: Border.all(
                       color: Colors.black,
                       width: 1.0,
                     ),
                     borderRadius: BorderRadius.circular(35.0),
                 ),
                 height: 35,
                 width: 35,
                 child:  const InkWell(
                   child: Icon(Icons.check,color: Colors.white,),
                 ),
               ),
               const SizedBox(width: 10,),
               Container(
                 decoration:  BoxDecoration(
                   border: Border.all(
                     color: Colors.black,
                     width: 1.0,
                   ),
                   borderRadius: BorderRadius.circular(35.0),
                 ),
                 height: 35,
                 width: 35,
                 child:  const InkWell(
                   child: Icon(Icons.close),
                 ),
               )
             ],
           )
          ],
        )
    );
  }
}
