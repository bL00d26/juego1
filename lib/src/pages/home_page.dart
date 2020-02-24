import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> secuencia = List();
  bool validado = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        _fondo(context),
        _fondo2(context),   
        
        
      ],
    );
  }

  Widget _fondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: <Color>[
            Color.fromRGBO(164, 169, 224, 1),
            Color.fromRGBO(206, 181, 224, 1)
          ]
        ),
      ),
    );
  }

  Widget _fondo2(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: AlignmentDirectional.center,
      child: Container(
        width: size.width*0.8,
        height: size.height*0.8,
        decoration: BoxDecoration(
          color:Colors.white60,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _header(context),
          _menu(context),          
          _ejemplo(context),          
          _ejercicio(context),
          Expanded(child: Container()),
          _resultado(context),
          _controles(context)
        ],
      )
      ),
    );
  }

  Widget _header(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.8,
      child: Row(    
                crossAxisAlignment: CrossAxisAlignment.start,            
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/logo.png"),
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 20.0,),
                  Text("Completa las siguientes secuencias graficas ordenando las figuras y acertar dichas secuencias",
                  style:TextStyle(
                    fontSize: 18.0,
                    color: Colors.black

                  )),
                ],
      ),
    );
  }

 Widget _menu(BuildContext context) {
   final size = MediaQuery.of(context).size;
   return Container(
     margin: EdgeInsets.all(20.0),
     width: size.width*0.8,
     child: Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: <Widget>[
         FloatingActionButton(
           child: Icon(Icons.menu),
           backgroundColor: Colors.lime,
           onPressed: (){},
         ),
       ],
     ),
   );
 }

 Widget _ejemplo(BuildContext context) {
   
   return Container(
       child: Row(   
         mainAxisAlignment: MainAxisAlignment.center,      
         children: <Widget>[
           GestureDetector(
             child: Image.asset("assets/triangulo1.png",
             ),
             onTap: (){
               if(secuencia.length<3){
                  secuencia.add("triangulo1"); 
               _llenado("triangulo1"); 
               }
                         
             },
           ),  
           SizedBox(width: 20.0,),        
           GestureDetector(
             child: Image.asset("assets/triangulo2.png",
             ),
             onTap: (){
               if(secuencia.length<3){
                   secuencia.add("triangulo2");
               _llenado("triangulo2");
               }
             
             },
           ),  
           SizedBox(width: 20.0,),           
           GestureDetector(
             child: Image.asset("assets/triangulo3.png",
             ),
             onTap: (){
               if(secuencia.length<3){
                  secuencia.add("triangulo3");
               _llenado("triangulo3");
               }
              
             },
           ), 
         ],
       ),
     );
  
 }

  Widget _ejercicio(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(top:50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/triangulo3.png",
           ),
          Image.asset("assets/triangulo1.png",
           ),  
           SizedBox(width: 10.0,),   
          Image.asset("assets/triangulo2.png",
           ), 
           SizedBox(width: 10.0,),
          Image.asset("assets/triangulo3.png",
           ),
          Image.asset("assets/triangulo1.png",
           ),  
           SizedBox(width: 10.0,),   
          Image.asset("assets/triangulo2.png",
           ), 
           SizedBox(width: 10.0,),
           Container(
             width: 80.0 ,
             height: 80.0,
             decoration: BoxDecoration(
               border: Border.all(
                 color: Colors.black,
                 width: 2.0
               )          
             ),
             child: (secuencia.isNotEmpty) ? _imagenProcesada(secuencia[0]):Container(),
           ),
           SizedBox(width: 10.0,),
           Container(
             width: 80.0 ,
             height: 80.0,
             decoration: BoxDecoration(
               border: Border.all(
                 color: Colors.black,
                 width: 2.0
               )          
             ),
             child: (secuencia.length>1) ? _imagenProcesada(secuencia[1]):Container(),
           ),
           SizedBox(width: 10.0,),
           Container(
             width: 80.0 ,
             height: 80.0,
             decoration: BoxDecoration(
               border: Border.all(
                 color: Colors.black,
                 width: 2.0
               )          
             ),
             child: (secuencia.length>2) ? _imagenProcesada(secuencia[2]):Container(),
           ),
        ],
      ),
    );
  }

  Widget _controles(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            child: Text("3"),
            onPressed: (){},

          ),
          SizedBox(width: 10.0,),
          RaisedButton(
            child: Text("Enviar Respuesta",),
            onPressed: (){
              _validar();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.yellow,

          ),
          SizedBox(width: 10.0,),
          RaisedButton(
            child: Text("Reiniciar",),
            onPressed: (){
              secuencia = [];
              validado=false;
              setState(() {
                
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.orange,

          ),
          SizedBox(width: 10.0,),
          RaisedButton(
            child: Text("Siguiente",),
            onPressed: (){

            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.green,
          ),

        ],
      ),
    );
  }

  void _validar() {
    setState(() {
      if(secuencia.elementAt(0)=='triangulo3' && secuencia.elementAt(1)=='triangulo1'&&secuencia.elementAt(2)=='triangulo2'){
      validado=true;
    }else{
      validado=false;
    }
    });
    

  }

  void _llenado(String color) {      
    
    if(secuencia.length==1){
      secuencia[0]=color;      
    }
    if(secuencia.length==2){
      secuencia[1]=color;
    }
    if(secuencia.length==3){
      secuencia[2]=color;
    }
      
   
    setState(() {
      
    });  
    
  }

  Widget _imagenProcesada(String imagen) {
    return Image.asset("assets/$imagen.png");
  }

  Widget _resultado(BuildContext context) {
    return Container(
        child: (validado)?Text("Resultado Correcto",style: TextStyle(fontSize: 30.0),):Container(),

    );
  }
}