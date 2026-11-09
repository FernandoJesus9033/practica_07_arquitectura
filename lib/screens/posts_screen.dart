import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts_provider.dart';
import '../widgets/post_card.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    // Llamamos a cargar los datos cuando la pantalla se inicializa
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostsProvider>().cargarPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts (Ejercicio Evaluable)'),
      ),
      body: Consumer<PostsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${provider.errorMessage}'),
                  ElevatedButton(
                    onPressed: () => provider.cargarPosts(),
                    child: const Text('Reintentar'),
                  )
                ],
              ),
            );
          }

          if (provider.posts.isEmpty) {
            return const Center(child: Text('No hay posts'));
          }

          return RefreshIndicator(
            onRefresh: () => provider.cargarPosts(),
            child: ListView.builder(
              itemCount: provider.posts.length,
              itemBuilder: (_, i) {
                return PostCard(post: provider.posts[i]);
              },
            ),
          );
        },
      ),
    );
  }
}