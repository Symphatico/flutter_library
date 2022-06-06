import 'package:about_me/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class LibraryService extends ChangeNotifier{
  final String _urlBase='openlibrary.org';

  Map<String,dynamic> propiedadesLibro={};
  var listaLibros=[];
  LibraryService() {
    getService();
  }
  getService() async {
    final url = Uri.https(_urlBase, 'works/OL891793W.json');
    final respuesta = await http.get(url);
    final libro1 = BookModel.fromJson(respuesta.body);
    //Things fall apart
    propiedadesLibro={'titulo':libro1.title,'descripcion':libro1.description.value ,'covers':libro1.covers.toString(),'temas':libro1.subjects,'publicado':libro1.firstPublishDate};
    listaLibros.add(propiedadesLibro);

    //Lord of the rings
    final url2 = Uri.https(_urlBase, 'works/OL27448W.json');
    final respuesta2 = await http.get(url2);
    final libro2 = BookModel.fromJson(respuesta2.body);
    propiedadesLibro={'titulo':libro2.title,'descripcion':libro2.description.value ,'covers':libro2.covers.toString(),'temas':libro2.subjects,'publicado':libro2.firstPublishDate};

    listaLibros.add(propiedadesLibro);

    final url3=Uri.https(_urlBase,'works/OL2234851W.json');
    final respuesta3=await http.get(url3);
    final libro3=BookModel.fromJson(respuesta3.body);
    propiedadesLibro={'titulo':libro3.title,'descripcion':libro3.description.value ,'covers':libro3.covers.toString(),'temas':libro3.subjects,'publicado':libro3.firstPublishDate};
    listaLibros.add(propiedadesLibro);

    final url4=Uri.https(_urlBase,'works/OL2758708W.json');
    final respuesta4=await http.get(url4);
    final libro4=BookModel.fromJson(respuesta4.body);
    propiedadesLibro={'titulo':libro4.title,'descripcion':libro4.description.value ,'covers':libro4.covers.toString(),'temas':libro4.subjects,'publicado':libro4.firstPublishDate};
    listaLibros.add(propiedadesLibro);

    final url5=Uri.https(_urlBase, 'works/OL1898309W.json');
    final respuesta5=await http.get(url5);
    final libro5=BookModel.fromJson(respuesta5.body);
    propiedadesLibro={'titulo':libro5.title,'descripcion':libro5.description.value ,'covers':libro5.covers.toString(),'temas':libro5.subjects,'publicado':libro5.firstPublishDate};
    listaLibros.add(propiedadesLibro);

    final url6=Uri.https(_urlBase,'works/OL23200W.json');
    final respuesta6=await http.get(url6);
    final libro6=BookModel.fromJson(respuesta6.body);
    propiedadesLibro={'titulo':libro6.title,'descripcion':libro6.description.value ,'covers':libro6.covers.toString(),'temas':libro6.subjects,'publicado':libro6.firstPublishDate};
    listaLibros.add(propiedadesLibro);

    final url7=Uri.https(_urlBase, 'works/OL278022W.json');
    final respuesta7=await http.get(url7);
    final libro7=BookModel.fromJson(respuesta7.body);
    propiedadesLibro={'titulo':libro7.title,'descripcion':libro7.description.value ,'covers':libro7.covers.toString(),'temas':libro7.subjects,'publicado':libro7.firstPublishDate};
    listaLibros.add(propiedadesLibro);
    notifyListeners();
  }



}