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

  const Card1({Key? key, required this.imagenPath, required this.titulo, required this.subtitulo}) : super(key: key);

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
            height: 200,
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
            height: 72,
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(2, 4, 8, 4),
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/circle.jpg'),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
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
              height: 750,
              fit: BoxFit.cover,
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
                          const SizedBox(width: 210.0),
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
            child: Container(
              color: const Color.fromARGB(255, 219, 217, 217),
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('data'),
                ],
              ),
            ),
          )
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
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(
                              'assets/avatar.png'), // Reemplaza con la ruta o URL de tu imagen
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            'La Gatita Loca 123',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: 'Roboto Bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Crea un canal >',
                            style: TextStyle(
                              color: Color.fromARGB(255, 47, 47, 47),
                              fontSize: 16.0,
                              fontFamily: 'Roboto Bold',
                            ),
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
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Historial'),
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
                              'Video 1',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'nombre canal 1',
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
                              'assets/historial1.png', // Ruta de tu imagen
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              'Video 1',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'nombre canal 1',
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
                              'assets/historial1.png', // Ruta de tu imagen
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              'Video 1',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Roboto Bold',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'nombre canal 1',
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
        ],
      ),
    );
  }
}
