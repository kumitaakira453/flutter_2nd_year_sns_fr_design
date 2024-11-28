class Post {
  final int id;
  final String title;
  final String content;
  final String photoPath;
  final bool isFavorited;
  final int likeCount;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.photoPath,
    required this.isFavorited,
    required this.likeCount,
  });
}
