import 'package:date_time_picker/date_time_picker.dart';
import 'package:new_app/providers/details_provider.dart';
// import 'package:new_app/screens/components/speechText.dart';//
import 'package:new_app/screens/home.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:new_app/screens/components/cameraWidget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comment_box/comment/comment.dart';

class DetailReportPage extends StatefulWidget {
  const DetailReportPage({ Key key }) : super(key: key);

  @override
  _DetailReportPageState createState() => _DetailReportPageState();
}
final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
class _DetailReportPageState extends State<DetailReportPage> {

  //final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  
   TextEditingController _subject = new TextEditingController();
   TextEditingController _address = TextEditingController();
   TextEditingController _description = TextEditingController();
   TextEditingController _currentLocation =TextEditingController();
   TextEditingController _doi =TextEditingController();

   final FlutterTts _flutterTts = FlutterTts(); 
  @override
  Widget build(BuildContext context) {

speak()async{
  await _flutterTts.setLanguage("en-US");
  await _flutterTts.setPitch(1);
  await _flutterTts.speak("Hep! Help!! Help!!! Am in an emergency situation");
}

showError(String errormessage){
  showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('ERROR'),
        content: Text(errormessage),
        actions: [
          ElevatedButton(
            onPressed: (){
               Navigator.of(context).pop();
            }, 
          child: Text('OK')),
        ],
      );
  });
}
    final detailedProvider = Provider.of<DetailedProvider>(context);
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 1,
        title: Text('Emegency description'),
        leading: IconButton(
          onPressed: (){
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Welcome()));
          },
          icon: Icon(
            Icons.arrow_back
            ),
          ),
        actions: [
          
        ],),

      body: SingleChildScrollView(
            //reverse:true,
            child: Column(
              children: [
                
                Padding(
                  padding: EdgeInsetsDirectional.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                
                                controller: _subject,
                          // ignore: missing_return
                                validator: (input){
                                  if(input.isEmpty)
                                    return 'Emergency details';
                                },

                                  decoration: InputDecoration(
                                    
                                    border:OutlineInputBorder(),
                                    hintText: "Enter emergency descripiton",
                                    labelText: 'Emergency Description',
                                    //prefix: Icon(Icons.),
                              
                                ),
                                onChanged: (value){
                                  detailedProvider.changeSubject(value);
                                },
                                    //onSaved: (input)=>_name=input,
                          ),
                            ),
                          
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _address,
                          // ignore: missing_return
                                  validator: (input){
                                    if(input.isEmpty)
                                      return 'Enter the address';  
                                    },

                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(),
                                    labelText: 'Address',
                                    hintText: 'Enter Address'
                                      ),
                                      onChanged: (value){
                                        detailedProvider.changeaAddress(value);
                                },
                                ),
                              ),
                          Column(
                            children: [
                               Container(
                                 width:260,
                                 child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                        controller: _description,
                                        maxLines: 3,
                          // ignore: missing_return
                                        validator: (input){
                                          if(input.isEmpty)
                                            return 'Enter Description';  
                                          },

                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter emergency desription',
                                          labelText: 'Description of the event',
                            
                                            ),
                                        onChanged: (value){
                                          detailedProvider.changeDescription(value);
                                  },
                                      
                                  ),
                              ),
                               ),


                            ],
                         ), 
            
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(top:20,left: 10),
                            child: Text("Add Emergency images",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey[600],
                                 fontWeight: FontWeight.bold
                                ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CameraComponent(),
                          ),

                          RaisedButton(
                            onPressed: (){
                              try{
                                 detailedProvider.saveDetail();
                                 showDialog(
                                    context: context, 
                                    builder: (BuildContext context){
                                    return AlertDialog(
                                      //title: Text('ERROR'),
                                      content: Text("Report successfully submitted"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: (){
                                            Navigator.of(context).pop();
                                          }, 
                                          child: Text('OK'))
                                      ],
                                    );
                                  });
                              }
                              catch(error){
                                  showError(error);
                              }   
                            },
                          
                          
                            child: Text('Sumbit',
                              style: TextStyle(
                                fontSize:20, 
                                color: Colors.white,
                                fontWeight: FontWeight.bold ),),

                           shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            
                            color: Colors.blue[900],
                      ),
                      ],
                    ),
                  ),
                ),

              
              ],
            
          ),
        
      ),
    );
  }


 }






