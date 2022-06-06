import 'dart:convert';
import 'package:about_me/pages/book_page.dart';
import 'package:about_me/services/library_services.dart';
import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    final bookDataServices = Provider.of<LibraryService>(context);
    if (bookDataServices.listaLibros.isEmpty) {
      return Container(
          color: Colors.amberAccent,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ));
    }

    final List<Map<String, dynamic>> data = [
      {
        'title': bookDataServices.listaLibros[0]['titulo'],
        'index': 0,
      },
      {
        'title': bookDataServices.listaLibros[1]['titulo'],
        'index': 1,
      },
      {
        'title': bookDataServices.listaLibros[2]['titulo'],
        'index': 2,
      },
      {
        'title': bookDataServices.listaLibros[3]['titulo'],
        'index': 3,
      },
      {
        'title': bookDataServices.listaLibros[4]['titulo'],
        'index': 4,
      },
      {
        'title': bookDataServices.listaLibros[5]['titulo'],
        'index': 5,
      },
      {
        'title': bookDataServices.listaLibros[6]['titulo'],
        'index': 6,
      },
    ];

    //Widget para mostrar los contenedores
    Widget _buildTile(String? title, int index) {
      print(bookDataServices.listaLibros[index]['publicado']);
      var covers = jsonDecode(bookDataServices.listaLibros[index]['covers']);
      return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookPage(
                          titulo: bookDataServices.listaLibros[index]['titulo'],
                          descripcion: bookDataServices.listaLibros[index]
                              ['descripcion'],
                          covers: covers,
                          temas: bookDataServices.listaLibros[index]['temas'],
                          publicado: bookDataServices.listaLibros[index]
                              ['publicado'],
                        )));
          },
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.all(15),
              elevation: 10,

              // Dentro de esta propiedad usamos ClipRRect
              child: ClipRRect(
                // Los bordes del contenido del card se cortan usando BorderRadius
                borderRadius: BorderRadius.circular(30),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                          image: NetworkImage(
                              'https://covers.openlibrary.org/b/id/${covers[0]}-M.jpg')),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        title!,
                        style: const TextStyle(
                            fontFamily: 'Raleway', fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              )));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Libreria',style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.purpleAccent,
                Colors.amber,
                Colors.blue,
              ])),
          child: AnimationList(
              children: data.map((item) {
            return _buildTile(item['title'], item['index']);
          }).toList()),
        ));
  }
}
