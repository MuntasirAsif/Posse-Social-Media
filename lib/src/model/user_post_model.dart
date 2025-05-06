class PossyModel {
  List<Posts>? posts;

  PossyModel({this.posts});

  PossyModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? userName;
  String? postDate;
  String? profilePicture;
  String? caption;
  int? reacts;
  int? comments;
  String? imagePath;

  Posts({
    this.userName,
    this.postDate,
    this.profilePicture,
    this.caption,
    this.reacts,
    this.comments,
    this.imagePath,
  });

  Posts.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    postDate = json['postDate'];
    profilePicture = json['profilePicture'];
    caption = json['caption'];
    reacts = json['reacts'];
    comments = json['comments'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['postDate'] = postDate;
    data['profilePicture'] = profilePicture;
    data['caption'] = caption;
    data['reacts'] = reacts;
    data['comments'] = comments;
    data['imagePath'] = imagePath;
    return data;
  }
}
