class CategoryModel {
  int? id;
  int? order;
  String? name;
  String? wordANumber;
  String? slug;
  String? description;
  String? thumbnail;
  String? createdAt;
  String? updatedAt;
  List<Posts>? posts;

  CategoryModel(
      {this.id,
        this.order,
        this.name,
        this.wordANumber,
        this.slug,
        this.description,
        this.thumbnail,
        this.createdAt,
        this.updatedAt,
        this.posts});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order = json['order'];
    name = json['name'];
    wordANumber = json['word_a_number'];
    slug = json['slug'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order'] = this.order;
    data['name'] = this.name;
    data['word_a_number'] = this.wordANumber;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  int? order;
  String? title;
  String? slug;
  String? tags;
  String? description;
  String? videoUrl;
  String? thumbnail;
  String? visibility;
  int? userId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Posts(
      {this.id,
        this.order,
        this.title,
        this.slug,
        this.tags,
        this.description,
        this.videoUrl,
        this.thumbnail,
        this.visibility,
        this.userId,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order = json['order'];
    title = json['title'];
    slug = json['slug'];
    tags = json['tags'];
    description = json['description'];
    videoUrl = json['video_url'];
    thumbnail = json['thumbnail'];
    visibility = json['visibility'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order'] = this.order;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['tags'] = this.tags;
    data['description'] = this.description;
    data['video_url'] = this.videoUrl;
    data['thumbnail'] = this.thumbnail;
    data['visibility'] = this.visibility;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
