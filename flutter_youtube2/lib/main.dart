import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'items.dart';
import 'package:flutter_application_4/theme.dart';
import 'splashscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(),
      home: const SplashScreen(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late PageController _pageController;
  int _currentPage = 0;
  final List<String> _screenTitles = [
    "Principal",
    "Short",
    "",
    "Suscripciones",
    "Tú"
  ];
  final List<IconData> _screenIcons = [
    Icons.home,
    Icons.amp_stories_outlined,
    Icons.add,
    Icons.subscriptions_outlined,
    Icons.account_circle
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    setState(() {
      _currentPage = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const CircleAvatar(
                    radius:
                        16.0, // Ajusta el tamaño del CircleAvatar según tus necesidades
                    backgroundImage: AssetImage(
                      'assets/logo.png', // Reemplaza con la ubicación de tu logo en el proyecto
                    ),
                  ),
                  title: const Text(
                    'Youtube',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto Bold',
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.cast_connected_outlined,
                          color: Colors.black),
                      onPressed: () {
                        // Acción para el ícono de búsqueda
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_outlined,
                          color: Colors.black),
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
                  ],
                  floating: true,
                  pinned: false,
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 40.0,
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Container(
                            height: 40.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 217, 217),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.explore_outlined,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Container(
                            height: 40.0,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Todos',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Container(
                            height: 40.0,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 219, 217, 217),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Música',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto Bold',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Container(
                            height: 40.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 217, 217),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Entrevistas periodísticas',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto Bold',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Container(
                            height: 40.0,
                            width: 130.0,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 217, 217),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Videojuegos',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto Bold',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Container(
                            height: 40.0,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 217, 217),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Mixes',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto Bold',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Container(
                            height: 40.0,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 217, 217),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ASMR',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto Bold',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Container(
                            height: 40.0,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 217, 217),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Comedias',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto Bold',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
                          child: Container(
                            height: 40.0,
                            width: 160.0,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 217, 217),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'En tiempo real',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto Bold',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Column(
                        //será una columna vertical, navegamos verticalmente

                        children: [
                          // los hijos de la columna

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 8.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255, 255), //color
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DetalleVideo(),
                                  ),
                                );
                              },
                              child: const Card1(
                                imagenPath: 'assets/imagen1.png',
                                titulo:
                                    '#SINEDITAR EN LA CASA DE HUELHUE SUKNI',
                                subtitulo:
                                    'Pamela Díaz . 1.5 M de visitas . hace 2 años',
                                imagenavatar: 'assets/fotopame.jpg',
                              ),
                            ),
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                            child: Container(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              height: 50.0,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/shorts.png', // Reemplaza esto con la ruta real de tu imagen en assets
                                      fit: BoxFit.cover,
                                      width:
                                          40.0, // Ajusta el ancho de la imagen según tus necesidades
                                    ),
                                    const SizedBox(
                                        width:
                                            8), // Espaciado entre la imagen y el texto
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 8, 0,
                                          0), // Padding solo para el texto
                                      child: Text(
                                        'Shorts',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              24.0, // Ajusta el tamaño del texto según tus necesidades
                                          fontFamily: 'Roboto Bold',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12), // Añade margen a la izquierda
                            child: SizedBox(
                              height: 300,
                              child: ListView.builder(
                                scrollDirection: Axis
                                    .horizontal, // Scrolleable horizontalmente
                                itemCount: 9, // Cambio numero items
                                itemBuilder: (context, index) {
                                  List<String> textos = [
                                    'Texto sobre la imagen 1',
                                    'Texto sobre la imagen 2',
                                    'Texto sobre la imagen 3',
                                    'Texto sobre la imagen 4',
                                    'Texto sobre la imagen 5',
                                    'Texto sobre la imagen 6',
                                    'Texto sobre la imagen 7',
                                    'Texto sobre la imagen 8',
                                    'Texto sobre la imagen 9',
                                  ];
                                  String letter = String.fromCharCode('A'
                                          .codeUnitAt(0) +
                                      index); //aquí le dices que ponda las imagenes en orden desde la a a la z
                                  return InkWell(
                                    onTap: () {
                                      // Navegar a la pantalla deseada cuando se hace clic en la imagen
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetallePantalla()), //al pinchar un short redirige a la pantalla "detallePantalla"
                                      );
                                    },
                                    child: Container(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      height: 400,
                                      margin: const EdgeInsets.only(
                                          right:
                                              8), // Espacio de 12 píxeles entre las cajas
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                8), // Bordes con border radius de 16
                                            child: Image.asset(
                                                'assets/$letter.png'), // Carga imágenes desde assets desde la A a la Z
                                          ),
                                          const Positioned(
                                            top: 8,
                                            right: 8,
                                            child: Icon(
                                              Icons.more_vert,
                                              color: Colors.white,
                                              size: 24,
                                            ), //ícono de los 3 puntitos esquina superior derecha
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              color: const Color.fromARGB(
                                                  0, 0, 0, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 16),
                                              child: Text(
                                                textos[
                                                    index], //se escriben los textos definidos al principio en itembuilder
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 8.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255, 255), //color
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DetallePerfil(),
                                  ),
                                );
                              },
                              child: const Card1(
                                imagenPath: 'assets/imagen2.jpeg',
                                titulo:
                                    'PAILITA, Gino Mella, Ak 420 y King Savage impactaron con su show en Teletón 2023',
                                subtitulo:
                                    'Chilevisión . 359 k de visitas . hace 1 día',
                                imagenavatar: 'assets/chilevision.jpg',
                              ),
                            ),
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),

                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: Card1(
                              imagenPath: 'assets/imagen3.jpeg',
                              titulo:
                                  'El confuso tema del dinero en Argentina | ¿UN DÓLAR VALE ORO?',
                              subtitulo:
                                  'Luisito Comunica . 10 M de visitas . hace 6 meses',
                              imagenavatar: 'assets/luisito.jpg',
                            ), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),

                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: Card1(
                              imagenPath: 'assets/imagen4.jpeg',
                              titulo:
                                  '#AlgoQueDecir - Mega temblor con los dichos de la Fran Maira #granhermanochile',
                              subtitulo:
                                  'LOOPS TV . 8.8 k de visitas . hace 6 días',
                              imagenavatar: 'assets/loopstv.jpg',
                            ), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),

                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: Card1(
                              imagenPath: 'assets/imagen5.jpeg',
                              titulo:
                                  '#LaJunta | Entrevista a KIDD VOODOO "TRANQUI JULIO, TODO ESTARÁ BIEN"',
                              subtitulo:
                                  'LaJunta . 271 k de visitas . hace 2 semanas',
                              imagenavatar: 'assets/lajunta.jpg',
                            ), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
                          ),
                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),

                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: Card1(
                              imagenPath: 'assets/imagen6.jpeg',
                              titulo:
                                  'Fabrizio Copano - Rutina completa en Teletón 2023',
                              subtitulo:
                                  'MEGA Oficial . 71 k de visitas . hace 1 día',
                              imagenavatar: 'assets/mega.jpg',
                            ), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: Card1(
                              imagenPath: 'assets/imagen7.jpeg',
                              titulo:
                                  'Boys Club No More | Billboard Latin Music Week',
                              subtitulo:
                                  'Billboard . 82 k de visitas . hace 1 mes',
                              imagenavatar: 'assets/bilboard.jpg',
                            ), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: Card1(
                              imagenPath: 'assets/imagen8.png',
                              titulo: '#SINEDITAR KIKE MORANDÉ',
                              subtitulo:
                                  'Pamela Díaz . 241 K de visitas . hace 2 días',
                              imagenavatar: 'assets/fotopame.jpg',
                            ), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: Card1(
                              imagenPath: 'assets/imagen9.png',
                              titulo:
                                  'Curso de Flutter Desde Cero App Clon de Netflix',
                              subtitulo:
                                  'Init . 34,3 K de visitas . hace 3 años',
                              imagenavatar: 'assets/init.jpg',
                            ), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                            child: Card1(
                              imagenPath: 'assets/imagen10.jpeg',
                              titulo:
                                  'DE QUE SE HABLA #57 - DENISE ROSENTHAL "ESTUVE A PUNTO DE MORIR EN UN ACCIDENTE"',
                              subtitulo:
                                  'Quese Produce . 64 k de visitas . hace 3 semanas',
                              imagenavatar: 'assets/quese.jpg',
                            ), // Simplemente utiliza SimpleCard en lugar de anidar otro Container
                          ),

                          const Divider(
                            //para separar del siguiente container, es horizontal
                            height: 4.0, //dos pixeles de alto
                            color: Color.fromARGB(255, 255, 255,
                                255), //color - fromARGB me permite cambiar la opacidad - cambia el color solo de la línea
                          ),
                        ],
                      ),
                      // Aquí va tu contenido actual
                      // ...
                    ],
                  ),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                const SliverAppBar(),
                SliverToBoxAdapter(
                  child: Container(
                    height: double.infinity,
                    child:
                        Image.asset('assets/videoshort.png', fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ],
          onPageChanged: (index) {
            _navigateToPage(index);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (index) {
            // Solo permite la navegación para el último ítem
            if (index == _screenIcons.length - 1) {
              // Navega a la séptima pantalla
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetallePerfil(),
                ),
              );
            } else {
              setState(() {
                _currentPage = index;
              });
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(_screenIcons[0]),
              label: 'Principal',
            ),
            BottomNavigationBarItem(
              icon: Icon(_screenIcons[1]),
              label: 'Short',
            ),
            BottomNavigationBarItem(
              icon: Icon(_screenIcons[2]),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(_screenIcons[3]),
              label: 'Suscripciones',
            ),
            BottomNavigationBarItem(
              icon: Icon(_screenIcons[4]),
              label: 'Tú',
            ),
          ],
        ),
      );
  }
}
