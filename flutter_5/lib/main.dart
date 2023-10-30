import 'package:flutter/material.dart';
import 'componentes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(//Acá comienza el Appbar
          backgroundColor: const Color.fromARGB(255, 255, 255, 255), //color de fondo, a mano, luego se puede integrar a flex_color
          leading: const CircleAvatar(child: Text(''), backgroundColor: Colors.white), //ubicación del ícono de navegación
          title: const Text('YouTube',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ), //título de la app
          actions: [//iconos búsqueda y more_vert
            IconButton(
              icon: const Icon(Icons.cast_connected_outlined, color: Colors.black),
              onPressed: () {
                // Acción para el ícono de búsqueda
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.black),
              onPressed: () {
                // Acción para el ícono "more_vert"
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // Acción para el ícono "more_vert"
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                // Acción para el ícono "more_vert"
              },
            ),
          ],
        ),// Acá termina el AppBar





        body: SingleChildScrollView( //Permite eventualemnte desplazarse a un punto x en el scroll.

          child: Column( //será una columna vertical, navegamos verticalmente

            children: [ // los hijos de la columna

              Row( //una fila que tiene dos columnas, separadas por una línea, alto 48 píxeles - filas

                children: [

                  Expanded(//cada expanded es una columna al interior del container, se construye el container en su interior
                    flex: 1, //primera división de la superficier, ROW
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Container(// acá se construye, el contenido de esa superficie previamente formateada.

                        height: 40.0, 
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 162, 168, 167), // Color en formato hexadecimal
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                       ),//con alto de 48 pixeles
                      ),
                    ),
                  ), //primera columna


                  const SizedBox(width: 4.0), //separador vertical - solo visual


                  Expanded(//cada expanded es una columna al interior del container, se construye el container en su interior
                    flex: 1, //primera división de la superficier, ROW
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 1, 8),
                        child: Container(// acá se construye, el contenido de esa superficie previamente formateada.

                        height: 40.0, 
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 162, 168, 167), // Color en formato hexadecimal
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                       ),//con alto de 48 pixeles
                      ),
                    ),
                  ), //segunda columna

                  const SizedBox(width: 4.0), //separador vertical - solo visual


                  Expanded(//cada expanded es una columna al interior del container, se construye el container en su interior
                    flex: 1, //primera división de la superficier, ROW
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(1, 16, 1, 8),
                        child: Container(// acá se construye, el contenido de esa superficie previamente formateada.

                        height: 40.0, 
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 162, 168, 167), // Color en formato hexadecimal
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                       ),//con alto de 48 pixeles
                      ),
                    ),
                  ), 

                  const SizedBox(width: 4.0), //separador vertical - solo visual

                  Expanded(//cada expanded es una columna al interior del container, se construye el container en su interior
                    flex: 1, //primera división de la superficier, ROW
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(1, 16, 1, 8),
                        child: Container(// acá se construye, el contenido de esa superficie previamente formateada.

                        height: 40.0, 
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 162, 168, 167), // Color en formato hexadecimal
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                       ),//con alto de 48 pixeles
                      ),
                    ),
                  ), 

                  const SizedBox(width: 4.0), //separador vertical - solo visual

                  Expanded(//cada expanded es una columna al interior del container, se construye el container en su interior
                    flex: 1, //primera división de la superficier, ROW
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(1, 16, 8, 8),
                        child: Container(// acá se construye, el contenido de esa superficie previamente formateada.

                        height: 40.0, 
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 162, 168, 167), // Color en formato hexadecimal
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                       ),//con alto de 48 pixeles
                      ),
                    ),
                  ), 
                ],
              ),

              const Divider(//para separar del siguiente container, es horizontal
                height: 8.0, //dos pixeles de alto
                color: Color.fromARGB(255, 255, 255, 255),//color
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Card1(), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
              ),

              const Divider(//para separar del siguiente container, es horizontal
                height: 4.0, //dos pixeles de alto
                color: Color.fromARGB(255, 255, 255, 255),//color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
              ),

              Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                    child: Container(
                      color: const Color.fromARGB(255, 162, 168, 167),
                      height: 100.0,
                      width: double.infinity,
                    ),
                  ),

              Row( //una fila que tiene dos columnas, separadas por una línea, alto 48 píxeles - filas

                children: [

                  Expanded(//cada expanded es una columna al interior del container, se construye el container en su interior
                    flex: 1, //primera división de la superficier, ROW
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 4),
                        child: Container(// acá se construye, el contenido de esa superficie previamente formateada.

                        height: 300.0, 
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 162, 168, 167),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                       ),//con alto de 48 pixeles
                      ),
                    ),
                  ), 

                  Expanded(//cada expanded es una columna al interior del container, se construye el container en su interior
                    flex: 1, //primera división de la superficier, ROW
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 16, 4),
                        child: Container(// acá se construye, el contenido de esa superficie previamente formateada.

                        height: 300.0, 
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 162, 168, 167), // Color en formato hexadecimal
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                       ),//con alto de 48 pixeles
                      ),
                    ),
                  ), 
                ],
              ),


              const Divider(//para separar del siguiente container, es horizontal
                height: 8.0, //dos pixeles de alto
                color: Color.fromARGB(255, 255, 255, 255),//color
              ),


              const Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Card1(), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
              ),

              const Divider(//para separar del siguiente container, es horizontal
                height: 4.0, //dos pixeles de alto
                color: Color.fromARGB(255, 255, 255, 255),//color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Card1(), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
              ),

              const Divider(//para separar del siguiente container, es horizontal
                height: 4.0, //dos pixeles de alto
                color: Color.fromARGB(255, 255, 255, 255),//color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Card1(), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
              ),

              const Divider(//para separar del siguiente container, es horizontal
                height: 4.0, //dos pixeles de alto
                color: Color.fromARGB(255, 255, 255, 255),//color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
              ),


              const Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Card1(), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
              ),
              const Divider(//para separar del siguiente container, es horizontal
                height: 4.0, //dos pixeles de alto
                color: Color.fromARGB(255, 255, 255, 255),//color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
              ),


              const Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Card1(), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
              ),

              const Divider(//para separar del siguiente container, es horizontal
                height: 4.0, //dos pixeles de alto
                color: Color.fromARGB(255, 255, 255, 255),//color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
              ),


            


              
                ],
           
          ),
        ), //se cierra el body

           bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255), //color de fondo, a mano, luego se puede integrar a flex_color

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), // Icono blanco
              label: 'Principal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.amp_stories_outlined, color: Colors.black), // Icono blanco
              label: 'Shorts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline, color: Colors.black), // Icono blanco
              label: 'add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined, color: Colors.black), // Icono blanco
              label: 'Suscripciones',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined, color: Colors.black), // Icono blanco
              label: 'Biblioteca',
            ),
          ],
          selectedItemColor: Colors.black, // Color del texto seleccionado en blanco
          unselectedItemColor: const Color.fromARGB(255, 103, 102, 102), // Color de íconos no seleccionados


        ),
      ),//Se cierra SCaffold
    );//Se cierra MaterialApp
  }//Se cierra el Widget Build contexts
}// se cierra la clase

