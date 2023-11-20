import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/theme.dart';

Widget novedadesItem() {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: MyTheme.lightTheme().colorScheme.onPrimaryContainer,
    ),
    title: const Text('Actualizacion'),
    subtitle: const Text('Hoy, 10:15 AM'),
    trailing: const Icon(Icons.more_vert),
  );
}

Widget llamadasItem(BuildContext context, String title) {
  const time = '15 de octubre, 12:30';
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => buildDetailScreen(context, title),
        ),
      );
    },
    child: ListTile(
      leading: const CircleAvatar(
        // backgroundColor: MyTheme.lightTheme().colorScheme.onPrimaryContainer,
        backgroundImage: AssetImage(
            'assets/1.jpg'), // Carga la imagen '1.jpg' en el CircleAvatar
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(-1.0, -1.0, 1.0),
            child: const Icon(Icons.arrow_outward, size: 16),
          ),
          const SizedBox(width: 4),
          const Text(time, style: TextStyle(fontSize: 12)),
        ],
      ),
      trailing: const Icon(Icons.call),
    ),
  );
}

Widget buildDetailScreen(BuildContext context, String itemName) {
  return Scaffold(
    appBar: AppBar(
      title: Text(itemName),
    ),
    body: Center(
      child: Text('Detalles de $itemName'),
    ),
  );
}

Widget createCustomCard(BuildContext context, String groupName) {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 180,
          color: Colors.white,
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BottomSheet'),
              ],
            ),
          ),
        );
      },
    );
  }

  return Card(
    elevation: 1,
    margin: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
    child: Container(
      height: 460,
      color: Colors.grey,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 72,
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(2, 4, 8, 4),
              leading: const CircleAvatar(
                //backgroundColor: Colors.grey,
                backgroundImage:
                    AssetImage('assets/1.jpg'), // Ruta de tu imagen '1.jpg'
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Card Uno',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      showBottomSheet(context);
                    },
                    padding: const EdgeInsets.only(top: 12),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/pa.jpg'), // Ruta de tu imagen '2.jpg'
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.grey,
                  padding: const EdgeInsets.all(0),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              alignment: Alignment.topLeft,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.black,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.send,
                    color: Colors.black,
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

class Card1 extends StatelessWidget {
  final String imagenPath;
  final String titulo;
  final String subtitulo;
  final String imagenavatar;

  const Card1(
      {Key? key,
      required this.imagenPath,
      required this.titulo,
      required this.subtitulo,
      required this.imagenavatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    imagenPath), // Usar la ruta de la imagen especificada
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 90,
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(2, 0, 8, 4),
              leading: CircleAvatar(
                backgroundImage: AssetImage(imagenavatar),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 43, 43, 43),
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                padding: const EdgeInsets.only(top: 12, bottom: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetallePantalla extends StatelessWidget {
  const DetallePantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Contenido de la pantalla, incluyendo la imagen que ocupa todo el ancho
            Image.asset(
              'assets/videoshort.png', // Reemplaza con la URL o ruta de tu imagen
              width: 600,
              height: 950,
            ),
            // Icono en la esquina superior izquierda
            Positioned(
              top: 16.0, // Ajusta la posición vertical
              left: 16.0, // Ajusta la posición horizontal
              child: GestureDetector(
                onTap: () {
                  // Navega de regreso a la pantalla principal
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
            ),
            // Puedes agregar aquí cualquier otro contenido que desees
          ],
        ),
      ),
    );
  }
}

class DetalleVideo extends StatelessWidget {
  const DetalleVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/video1.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            '#SINEDITAR',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16.0,
                              fontFamily: 'Roboto Bold',
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'EN LA CASA DE HUELHUE SUKNI',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16.0,
                              fontFamily: 'Roboto Bold',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      const Row(
                        children: [
                          Text(
                            '1.5 M de visitas hace 2 a ...',
                            style: TextStyle(
                              color: Color.fromARGB(255, 72, 72, 72),
                              fontSize: 12.0,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            'más',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12.0,
                              fontFamily: 'Roboto Bold',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 24.0,
                            backgroundImage: AssetImage('assets/fotopame.jpg'),
                          ),
                          const SizedBox(width: 8.0),
                          const Text(
                            'Pamela Díaz',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12.0,
                              fontFamily: 'Roboto Bold',
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          const Text(
                            '400 k',
                            style: TextStyle(
                              color: Color.fromARGB(255, 72, 72, 72),
                              fontSize: 12.0,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          const SizedBox(width: 190.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            ),
                            child: const Text(
                              'Suscribirse',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontFamily: 'Roboto', 
                                
                              ),
                            ),
                            onPressed: () {
                              // Code Here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            //lista megusta, dislaik, etc
            child: Container(
              height: 30.0,
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 20.0,
                      width: 105,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 217, 217),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia arriba
                            child: Icon(
                              Icons.thumb_up_outlined,
                              size: 16.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8, 0, 0, 0), // Padding alrededor del texto
                            child: Text(
                              '31 k',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia abajo
                            child: Icon(
                              Icons.thumb_down_outlined,
                              size: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Container(
                      height: 20.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 217, 217),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia arriba
                            child: Icon(
                              Icons.share_outlined,
                              size: 16.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8, 0, 0, 0), // Padding alrededor del texto
                            child: Text(
                              'Compartir',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Container(
                      height: 20.0,
                      width: 90,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 217, 217),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia arriba
                            child: Icon(
                              Icons.video_library_outlined,
                              size: 16.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8, 0, 0, 0), // Padding alrededor del texto
                            child: Text(
                              'Remix',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Container(
                      height: 20.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 217, 217),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia arriba
                            child: Icon(
                              Icons.download_outlined,
                              size: 16.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8, 0, 0, 0), // Padding alrededor del texto
                            child: Text(
                              'Descargar',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Container(
                      height: 20.0,
                      width: 110,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 217, 217),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia arriba
                            child: Icon(
                              Icons.cut_outlined,
                              size: 16.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8, 0, 0, 0), // Padding alrededor del texto
                            child: Text(
                              'Recortar',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Container(
                      height: 20.0,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 217, 217),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia arriba
                            child: Icon(
                              Icons.library_add_outlined,
                              size: 16.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8, 0, 0, 0), // Padding alrededor del texto
                            child: Text(
                              'Guardar',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16.0),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 217, 217),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0,
                                0), // Ajusta el padding del texto 'data'
                            child: Text(
                              'Comentarios',
                              style: TextStyle(
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0,
                                0), // Ajusta el padding del texto 'data'
                            child: Text(
                              '1.2 K',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height:
                            8.0), // Ajusta el espacio entre los textos y el CircleAvatar
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 8, 0,
                                0), // Ajusta el padding del CircleAvatar
                            child: CircleAvatar(
                              child: Text('a'),
                              backgroundColor:
                                  Colors.green, // Agrega tu imagen aquí
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 8, 0,
                                0), // Ajusta el padding del texto 'data'
                            child: Text(
                              'Me encanta la Huelhue!!',
                              style: TextStyle(
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ), // Agrega tu tercer texto aquí
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Card1(
                  imagenPath: 'assets/imagen8.png',
                  titulo: '#SINEDITAR KIKE MORANDÉ',
                  subtitulo: 'Pamela Díaz . 241 K de visitas . hace 2 días',
                  imagenavatar: 'assets/',
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 40.0,
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
                            30.0, // Ajusta el ancho de la imagen según tus necesidades
                      ),
                      const SizedBox(
                          width: 8), // Espaciado entre la imagen y el texto
                      const Padding(
                        padding: EdgeInsets.fromLTRB(
                            8, 4, 0, 0), // Padding solo para el texto
                        child: Text(
                          'Shorts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                18.0, // Ajusta el tamaño del texto según tus necesidades
                            fontFamily: 'Roboto Bold',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  12, 16, 0, 16), // Añade margen a la izquierda
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Scrolleable horizontalmente
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
                    String letter = String.fromCharCode('A'.codeUnitAt(0) +
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                        height: 400,
                        margin: const EdgeInsets.only(
                            right: 8), // Espacio de 12 píxeles entre las cajas
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
                                color: const Color.fromARGB(0, 0, 0, 0),
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 16),
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
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Card1(
                  imagenPath: 'assets/imagen7.jpeg',
                  titulo: 'Boys Club No More | Billboard Latin Music Week',
                  subtitulo: 'Billboard . 82 K de visitas . hace 1 mes',
                  imagenavatar: 'assets/fotopame.jpg',
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Card1(
                  imagenPath: 'assets/imagen6.jpeg',
                  titulo: 'Fabrizio Copano - Rutina completa en Teletón 2023',
                  subtitulo: 'MEGA Oficial . 71 K de visitas . hace 1 día',
                  imagenavatar: 'assets/fotopame.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetallePerfil extends StatelessWidget {
  const DetallePerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              '',
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
              IconButton(
                icon: const Icon(Icons.settings_outlined, color: Colors.black),
                onPressed: () {
                  // Acción para el ícono "more_vert"
                },
              ),
            ],
            floating: true,
            pinned:
                false, // Si deseas que la barra se quede fija mientras haces scroll
          ),
          const SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(
                                'assets/avatar.png', // Reemplaza con la ruta o URL de tu imagen
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'La Gatita Loca 123',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto Bold',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'Crea un canal >',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 63, 63, 63),
                                        fontSize: 12.0,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            //lista megusta, dislaik, etc
            child: Container(
              height: 30.0,
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 20.0,
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 217, 217),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia arriba
                            child: Icon(
                              Icons.group_outlined,
                              size: 16.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8, 0, 0, 0), // Padding alrededor del texto
                            child: Text(
                              'Cambiar de cuenta',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Container(
                      height: 20.0,
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 217, 217),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia arriba
                            child: Icon(
                              Icons.category_outlined,
                              size: 16.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8, 0, 0, 0), // Padding alrededor del texto
                            child: Text(
                              'Cuenta de Google',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Container(
                      height: 20.0,
                      width: 190,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 217, 217),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0,
                                0), // Padding alrededor del icono de pulgar hacia arriba
                            child: Icon(
                              Icons.visibility_off_outlined,
                              size: 16.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8, 0, 0, 0), // Padding alrededor del texto
                            child: Text(
                              'Activar modo incógnito',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16.0),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Historial',
                      style: TextStyle(
                        fontFamily: 'Roboto Bold',
                        fontSize: 18.0,
                        color: Colors
                            .black, // Cambia el color del texto según tus necesidades
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetalleHistorial(),
                          ),
                        );
                      },
                      child: const Text(
                        'Ver todo',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12.0,
                          fontFamily:
                              'Roboto Bold', // Cambia el color del texto del botón según tus necesidades
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            // Lista me gusta, dislike, etc.
            child: Container(
              height: 180.0,
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Alineación a la izquierda
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Image.asset(
                              'assets/historial1.png', // Ruta de tu imagen
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              'Paisaje en la carretera...',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Medium',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Camarawong',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Alineación a la izquierda
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Image.asset(
                              'assets/historial2.png', // Ruta de tu imagen
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              'Heart Touching Nasheed #Shorts',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Medium',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'An Naffe',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Alineación a la izquierda
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Image.asset(
                              'assets/historial3.png', // Ruta de tu imagen
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              'Heart Touching Nasheed #Shorts',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Medium',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'An Naffe',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Alineación a la izquierda
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Image.asset(
                              'assets/historial4.png', // Ruta de tu imagen
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              'Heart Touching Nasheed #Shorts',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Medium',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'An Naffe',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Alineación a la izquierda
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Image.asset(
                              'assets/historial5.png', // Ruta de tu imagen
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              'Heart Touching Nasheed #Shorts',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Medium',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'An Naffe',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16.0),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Playlist',
                      style: TextStyle(
                        fontFamily: 'Roboto Bold',
                        fontSize: 18.0,
                        color: Colors
                            .black, // Cambia el color del texto según tus necesidades
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción cuando se presiona el botón
                      },
                      child: const Text(
                        'Ver todo',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12.0,
                          fontFamily:
                              'Roboto Bold', // Cambia el color del texto del botón según tus necesidades
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            // Lista me gusta, dislike, etc.
            child: Container(
              height: 180.0,
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Alineación a la izquierda
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Image.asset(
                              'assets/playlist1.png', // Ruta de tu imagen
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              'Ver más tarde',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Medium',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Privado',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Alineación a la izquierda
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Image.asset(
                              'assets/playlist2.png', // Ruta de tu imagen
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              'Videos que me gustan',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Medium',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Privado',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    40.0), // Ajusta el padding según tus necesidades
                            child: CircleAvatar(
                              radius: 24.0,
                              backgroundImage: AssetImage(
                                'assets/addplaylist.png', // Ruta de tu imagen
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                            child: Text(
                              'Nueva playlist',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Medium',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 60.0,
              padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom:
                      8), // Ajusta el padding del contenedor según tus necesidades
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        0), // Ajusta el padding del icono según tus necesidades
                    child: Icon(Icons.smart_display_outlined,
                        size: 32), // Reemplaza con el icono que desees
                  ),
                  SizedBox(
                      width:
                          8.0), // Ajusta el espacio entre el icono y el texto
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left:
                              12), // Ajusta el padding del texto según tus necesidades
                      child: Text(
                        'Tus videos',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Roboto Medium', fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height:
                  80.0, // Ajusta la altura del contenedor según tus necesidades
              padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 16,
                  bottom:
                      8.0), // Ajusta el padding del contenedor según tus necesidades
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                            0), // Ajusta el padding del icono según tus necesidades
                        child: Icon(Icons.vertical_align_bottom,
                            size: 32), // Reemplaza con el icono que desees
                      ),
                      SizedBox(
                          width:
                              8.0), // Ajusta el espacio entre el icono y el texto
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left:
                                  12), // Ajusta el padding del texto según tus necesidades
                          child: Text(
                            'Descargas',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto Medium', fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left:
                            52.0), // Ajusta el padding del segundo texto según tus necesidades
                    child: Text(
                      '67 videos',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: Color.fromARGB(255, 95, 95, 95)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 60.0,
              padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom:
                      8), // Ajusta el padding del contenedor según tus necesidades
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        0), // Ajusta el padding del icono según tus necesidades
                    child: Icon(Icons.theaters_outlined,
                        size: 32), // Reemplaza con el icono que desees
                  ),
                  SizedBox(
                      width:
                          8.0), // Ajusta el espacio entre el icono y el texto
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left:
                              12), // Ajusta el padding del texto según tus necesidades
                      child: Text(
                        'Tus películas',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Roboto Medium', fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 60.0,
              padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom: 16,
                  top:
                      12), // Ajusta el padding del contenedor según tus necesidades
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        0), // Ajusta el padding del icono según tus necesidades
                    child: Icon(Icons.schedule_outlined,
                        size: 32), // Reemplaza con el icono que desees
                  ),
                  SizedBox(
                      width:
                          8.0), // Ajusta el espacio entre el icono y el texto
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left:
                              12), // Ajusta el padding del texto según tus necesidades
                      child: Text(
                        'Ver más tarde',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Roboto Medium', fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetalleHistorial extends StatelessWidget {
  const DetalleHistorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              '',
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
              IconButton(
                icon: const Icon(Icons.settings_outlined, color: Colors.black),
                onPressed: () {
                  // Acción para el ícono "more_vert"
                },
              ),
            ],
            floating: true,
            pinned:
                false, // Si deseas que la barra se quede fija mientras haces scroll
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Historial',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Roboto Bold',
                          ),
                        ),
                        const SizedBox(
                            height:
                                16), // Espacio entre el título y la barra de búsqueda

                        // Barra de búsqueda
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[
                                200], // Puedes ajustar el color de fondo según tu diseño
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: const Row(
                            children: [
                              Icon(Icons.search,
                                  color: Color.fromARGB(255, 111, 111, 111)),
                              SizedBox(
                                  width:
                                      8), // Espacio entre el icono y el texto
                              Text(
                                'Buscar en el historial',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Roboto',
                                    color: Color.fromARGB(255, 111, 111, 111)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 21),
                        const Text(
                          'Hoy',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            color: Color.fromARGB(255, 111, 111, 111),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 40.0,
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
                            30.0, // Ajusta el ancho de la imagen según tus necesidades
                      ),
                      const SizedBox(
                          width: 8), // Espaciado entre la imagen y el texto
                      const Padding(
                        padding: EdgeInsets.fromLTRB(
                            8, 4, 0, 0), // Padding solo para el texto
                        child: Text(
                          'Shorts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                18.0, // Ajusta el tamaño del texto según tus necesidades
                            fontFamily: 'Roboto Bold',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  12, 16, 0, 16), // Añade margen a la izquierda
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Scrolleable horizontalmente
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
                    String letter = String.fromCharCode('A'.codeUnitAt(0) +
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                        height: 400,
                        margin: const EdgeInsets.only(
                            right: 8), // Espacio de 12 píxeles entre las cajas
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
                                color: const Color.fromARGB(0, 0, 0, 0),
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 16),
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
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Fila para la imagen y los textos
                              Row(
                                children: [
                                  // Imagen con padding
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Image.asset(
                                      'assets/historial1.png',
                                      height: 130,
                                    ),
                                  ),

                                  // Columna para los textos
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Compilation | Everithyng Belongs to Alla 33 Mins | omar...',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto Medium'),
                                            ),
                                          ),
                                        ),

                                        // Segundo texto con padding
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            'Omar & Hana - Islamic',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              color: Color.fromARGB(
                                                  255, 111, 111, 111),
                                            ),
                                          ),
                                        ),

                                        // Tercer texto con padding
                                        Text(
                                          '5.5 M de visitas',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            color: Color.fromARGB(
                                                255, 111, 111, 111),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 160,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Fila para la imagen y los textos
                              Row(
                                children: [
                                  // Imagen con padding
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Image.asset(
                                      'assets/historial2.png',
                                      height: 130,
                                    ),
                                  ),

                                  // Columna para los textos
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Compilation | Everithyng Belongs to Alla 33 Mins | omar...',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto Medium'),
                                            ),
                                          ),
                                        ),

                                        // Segundo texto con padding
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            'Omar & Hana - Islamic',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              color: Color.fromARGB(
                                                  255, 111, 111, 111),
                                            ),
                                          ),
                                        ),

                                        // Tercer texto con padding
                                        Text(
                                          '5.5 M de visitas',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            color: Color.fromARGB(
                                                255, 111, 111, 111),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 160,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Fila para la imagen y los textos
                              Row(
                                children: [
                                  // Imagen con padding
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Image.asset(
                                      'assets/historial3.png',
                                      height: 130,
                                    ),
                                  ),

                                  // Columna para los textos
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Compilation | Everithyng Belongs to Alla 33 Mins | omar...',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto Medium'),
                                            ),
                                          ),
                                        ),

                                        // Segundo texto con padding
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            'Omar & Hana - Islamic',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              color: Color.fromARGB(
                                                  255, 111, 111, 111),
                                            ),
                                          ),
                                        ),

                                        // Tercer texto con padding
                                        Text(
                                          '5.5 M de visitas',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            color: Color.fromARGB(
                                                255, 111, 111, 111),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 160,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Fila para la imagen y los textos
                              Row(
                                children: [
                                  // Imagen con padding
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Image.asset(
                                      'assets/historial4.png',
                                      height: 130,
                                    ),
                                  ),

                                  // Columna para los textos
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Compilation | Everithyng Belongs to Alla 33 Mins | omar...',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto Medium'),
                                            ),
                                          ),
                                        ),

                                        // Segundo texto con padding
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            'Omar & Hana - Islamic',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              color: Color.fromARGB(
                                                  255, 111, 111, 111),
                                            ),
                                          ),
                                        ),

                                        // Tercer texto con padding
                                        Text(
                                          '5.5 M de visitas',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            color: Color.fromARGB(
                                                255, 111, 111, 111),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 160,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Fila para la imagen y los textos
                              Row(
                                children: [
                                  // Imagen con padding
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Image.asset(
                                      'assets/historial5.png',
                                      height: 130,
                                    ),
                                  ),

                                  // Columna para los textos
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Compilation | Everithyng Belongs to Alla 33 Mins | omar...',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto Medium'),
                                            ),
                                          ),
                                        ),

                                        // Segundo texto con padding
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            'Omar & Hana - Islamic',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              color: Color.fromARGB(
                                                  255, 111, 111, 111),
                                            ),
                                          ),
                                        ),

                                        // Tercer texto con padding
                                        Text(
                                          '5.5 M de visitas',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            color: Color.fromARGB(
                                                255, 111, 111, 111),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
