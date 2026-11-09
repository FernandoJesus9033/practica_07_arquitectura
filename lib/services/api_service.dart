import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  final String _url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> obtenerPosts() async {
    final response = await http.get(Uri.parse(_url));
    
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los posts');
    }
  }
}