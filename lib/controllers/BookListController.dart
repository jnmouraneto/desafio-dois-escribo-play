import 'dart:convert';
import 'package:book_reader/models/BookModel.dart';
import 'package:book_reader/screens/BookListView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookListController extends StatefulWidget {
  @override
  _BookListControllerState createState() => _BookListControllerState();
}

class _BookListControllerState extends State<BookListController> {
  late List<Book> books;

  @override
  void initState() {
    super.initState();
    books = [];
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final response =
        await http.get(Uri.parse('https://escribo.com/books.json'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        books = data.map((item) => Book.fromJson(item)).toList();
      });
    } else {
      throw Exception('Falha ao carregar os livros');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BookListView(books: books);
  }

}
