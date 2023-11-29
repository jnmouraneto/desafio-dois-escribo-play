import 'package:book_reader/models/BookModel.dart';
import 'package:flutter/material.dart';

class BookListView extends StatelessWidget {
  final List<Book> books;

  BookListView({required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Reader'),
      ),
      body: books.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(books[index].title),
                  subtitle: Text(books[index].author),
                  leading: Image.network(books[index].coverUrl),
                  onTap: (){
                    onItemPressed(books[index]);
                  },
                );
              },
            ),
    );
  }

  void onItemPressed(Book book) {
    // Adicione a lógica que deseja executar quando um item for pressionado
    print('Livro clicado: ${book.title}');
  }
}
