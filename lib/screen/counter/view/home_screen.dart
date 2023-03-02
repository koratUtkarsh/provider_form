import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_form/screen/counter/model/Modal.dart';


import '../provider/logic_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtid = TextEditingController();
  TextEditingController txtstd= TextEditingController();

  TextEditingController utxtname = TextEditingController();
  TextEditingController utxtid = TextEditingController();
  TextEditingController utxtstd = TextEditingController();
  liProvider? Liprovider;
  @override
  Widget build(BuildContext context) {
    Liprovider = Provider.of<liProvider>(context,listen: false);
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Data"),centerTitle: true,backgroundColor: Colors.black),
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              TextField(
                  controller: txtid,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Enter Id"),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: txtname,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Enter Name"),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: txtstd,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Enter Std"),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                modaldata m1 = modaldata(id: txtid.text,name: txtname.text,std: txtstd.text);

                Liprovider!.adddata(m1);

              },  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),child: Text("Add")),
                 Consumer<liProvider>(
                   builder: (context, value, child) => Expanded(
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: Liprovider!.dataof.length,
                       itemBuilder: (context, index) {
                       return Padding(
                         padding: EdgeInsets.all(8.0),
                         child: ListTile(
                           shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                           title: Text("${Liprovider!.dataof[index].name}",style:TextStyle(fontSize: 20) ),
                           leading: Text("${Liprovider!.dataof[index].id}"),
                           subtitle: Text("${Liprovider!.dataof[index].std}"),
                           trailing: Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               IconButton(onPressed: () {
                                 Liprovider!.delet(index);
                               }, icon: Icon(Icons.delete,color: Colors.red),),
                               SizedBox(width: 5,),
                               IconButton(onPressed: () {
                                 utxtid = TextEditingController(text: Liprovider!.dataof[index].id);
                                 utxtname = TextEditingController(text: Liprovider!.dataof[index].name);
                                 utxtstd = TextEditingController(text: Liprovider!.dataof[index].std);

                                 showDialog(context: context, builder: (context) => AlertDialog(
                                   content: Column(
                                     mainAxisSize: MainAxisSize.min,
                                     children: [
                                       TextField(
                                         controller: utxtid,
                                         decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Enter Id"),
                                       ),
                                       SizedBox(height: 5,),
                                       TextField(
                                         controller: utxtname,
                                         decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Enter Id"),
                                       ),
                                       SizedBox(height: 5,),
                                       TextField(
                                         controller: utxtstd,
                                         decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Enter Id"),
                                       ),
                                       SizedBox(height: 10,),
                                       ElevatedButton(onPressed: () {
                                         modaldata m1 = modaldata(id: utxtid.text,name: utxtname.text,std: utxtstd.text);
                                         Liprovider!.update(index, m1);
                                         Navigator.pop(context);
                                       }, child: Text("Update"),style:ElevatedButton.styleFrom(backgroundColor: Colors.black),),
                                     ],
                                   ),
                                 ),);
                               }, icon: Icon(Icons.edit,color: Colors.black),),
                             ],
                           ),
                         ),
                       );
                     },),
                   ),
                 ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
