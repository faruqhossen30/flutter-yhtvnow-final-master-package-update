class PostModel {
  int? id;
  int? order;
  int? isPodcast;
  String? title;
  String? slug;
  int? views;
  String? tags;
  String? description;
  String? excerpt;
  String? videoUrl;
  String? thumbnail;
  String? visibility;
  int? userId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<Sponsors>? sponsors;

  PostModel(
      {this.id,
        this.order,
        this.isPodcast,
        this.title,
        this.slug,
        this.views,
        this.tags,
        this.description,
        this.excerpt,
        this.videoUrl,
        this.thumbnail,
        this.visibility,
        this.userId,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.sponsors});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order = json['order'];
    isPodcast = json['is_podcast'];
    title = json['title'];
    slug = json['slug'];
    views = json['views'];
    tags = json['tags'];
    description = json['description'];
    excerpt = json['excerpt'];
    videoUrl = json['video_url'];
    thumbnail = json['thumbnail'];
    visibility = json['visibility'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['sponsors'] != null) {
      sponsors = <Sponsors>[];
      json['sponsors'].forEach((v) {
        sponsors!.add(new Sponsors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order'] = this.order;
    data['is_podcast'] = this.isPodcast;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['views'] = this.views;
    data['tags'] = this.tags;
    data['description'] = this.description;
    data['excerpt'] = this.excerpt;
    data['video_url'] = this.videoUrl;
    data['thumbnail'] = this.thumbnail;
    data['visibility'] = this.visibility;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.sponsors != null) {
      data['sponsors'] = this.sponsors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
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

  Category(
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

  Category.fromJson(Map<String, dynamic> json) {
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
  int? isPodcast;
  String? title;
  String? slug;
  int? views;
  String? tags;
  String? description;
  String? excerpt;
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
        this.isPodcast,
        this.title,
        this.slug,
        this.views,
        this.tags,
        this.description,
        this.excerpt,
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
    isPodcast = json['is_podcast'];
    title = json['title'];
    slug = json['slug'];
    views = json['views'];
    tags = json['tags'];
    description = json['description'];
    excerpt = json['excerpt'];
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
    data['is_podcast'] = this.isPodcast;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['views'] = this.views;
    data['tags'] = this.tags;
    data['description'] = this.description;
    data['excerpt'] = this.excerpt;
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

class Sponsors {
  int? id;
  String? title;
  String? slug;
  String? tagline;
  String? link;
  String? number;
  String? thumbnail;
  String? visibility;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Sponsors(
      {this.id,
        this.title,
        this.slug,
        this.tagline,
        this.link,
        this.number,
        this.thumbnail,
        this.visibility,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Sponsors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    tagline = json['tagline'];
    link = json['link'];
    number = json['number'];
    thumbnail = json['thumbnail'];
    visibility = json['visibility'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['tagline'] = this.tagline;
    data['link'] = this.link;
    data['number'] = this.number;
    data['thumbnail'] = this.thumbnail;
    data['visibility'] = this.visibility;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? postId;
  int? sponsorId;

  Pivot({this.postId, this.sponsorId});

  Pivot.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    sponsorId = json['sponsor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['sponsor_id'] = this.sponsorId;
    return data;
  }
}
