class Post {
  final String userName;
  final String content;
  final String profileImage;
  final bool isLiked;
  final String? photo;

  Post({
    required this.userName,
    required this.content,
    required this.profileImage,
    required this.isLiked,
    this.photo,
  });
}
