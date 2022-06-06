import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  BookPage(
      {Key? key,
      required this.titulo,
      required this.descripcion,
      required this.covers,
      required this.temas,
      required this.publicado})
      : super(key: key);
  final String titulo;
  final String descripcion;
  final covers;
  final temas;
  final String publicado;
  @override
  Widget build(BuildContext context) {
    List<String> listCovers = [];
    if (titulo.isEmpty) {
      return Container(
          color: Colors.amberAccent,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ));
    }
    listCovers.add('https://covers.openlibrary.org/b/id/${covers[0]}-L.jpg');

    return Scaffold(
        appBar: AppBar(
          title: Text(titulo, style: const TextStyle(color: Colors.black),),
          backgroundColor: Colors.amberAccent,
        ),
        body: SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Colors.purpleAccent,
                      Colors.amber,
                      Colors.blue,
                    ])),
                child: Column(children: [
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.network(
                          'https://covers.openlibrary.org/b/id/${covers[0]}-M.jpg',
                          fit: BoxFit.fill,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 5, color: Colors.black),
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(children: [
                            const SizedBox(height: 5),
                            Text(titulo,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Raleway')),
                            const SizedBox(height: 5),
                            Text('Subjects: \n' + temas[0] + ',\n' + temas[1],
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w900)),
                            const SizedBox(height: 5),
                            Text("Published: " + publicado),
                          ]),
                        ),
                      ]),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Icon(Icons.book),
                        Text(
                          "Summary",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ]),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 5, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          descripcion,
                          style: const TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  )
                ]))));
  }
}
