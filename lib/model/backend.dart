import 'package:json_annotation/json_annotation.dart';

part 'backend.g.dart';

@JsonSerializable()
class BackEnd extends Object {
  @JsonKey(name: 'err_no')
  int err_no;

  @JsonKey(name: 'err_msg')
  String err_msg;

  @JsonKey(name: 'data')
  List<BackData> data;

  @JsonKey(name: 'cursor')
  String cursor;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'has_more')
  bool has_more;

  BackEnd(
    this.err_no,
    this.err_msg,
    this.data,
    this.cursor,
    this.count,
    this.has_more,
  );

  factory BackEnd.fromJson(Map<String, dynamic> srcJson) =>
      _$BackEndFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BackEndToJson(this);
}

@JsonSerializable()
class BackData extends Object {
  @JsonKey(name: 'article_id')
  String article_id;

  @JsonKey(name: 'article_info')
  Article_info article_info;

  @JsonKey(name: 'author_user_info')
  Author_user_info author_user_info;

  @JsonKey(name: 'category')
  Category category;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'user_interact')
  User_interact user_interact;

  @JsonKey(name: 'org')
  Org org;

  BackData(
    this.article_id,
    this.article_info,
    this.author_user_info,
    this.category,
    this.tags,
    this.user_interact,
    this.org,
  );

  factory BackData.fromJson(Map<String, dynamic> srcJson) =>
      _$BackDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BackDataToJson(this);
}

@JsonSerializable()
class Article_info extends Object {
  @JsonKey(name: 'article_id')
  String article_id;

  @JsonKey(name: 'user_id')
  String user_id;

  @JsonKey(name: 'category_id')
  String category_id;

  @JsonKey(name: 'tag_ids')
  List<int> tag_ids;

  @JsonKey(name: 'visible_level')
  int visible_level;

  @JsonKey(name: 'link_url')
  String link_url;

  @JsonKey(name: 'cover_image')
  String cover_image;

  @JsonKey(name: 'is_gfw')
  int is_gfw;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'brief_content')
  String brief_content;

  @JsonKey(name: 'is_english')
  int is_english;

  @JsonKey(name: 'is_original')
  int is_original;

  @JsonKey(name: 'user_index')
  double user_index;

  @JsonKey(name: 'original_type')
  int original_type;

  @JsonKey(name: 'original_author')
  String original_author;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'ctime')
  String ctime;

  @JsonKey(name: 'mtime')
  String mtime;

  @JsonKey(name: 'rtime')
  String rtime;

  @JsonKey(name: 'draft_id')
  String draft_id;

  @JsonKey(name: 'view_count')
  int view_count;

  @JsonKey(name: 'collect_count')
  int collect_count;

  @JsonKey(name: 'digg_count')
  int digg_count;

  @JsonKey(name: 'comment_count')
  int comment_count;

  @JsonKey(name: 'hot_index')
  int hot_index;

  @JsonKey(name: 'is_hot')
  int is_hot;

  @JsonKey(name: 'rank_index')
  double rank_index;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'verify_status')
  int verify_status;

  @JsonKey(name: 'audit_status')
  int audit_status;

  @JsonKey(name: 'mark_content')
  String mark_content;

  Article_info(
    this.article_id,
    this.user_id,
    this.category_id,
    this.tag_ids,
    this.visible_level,
    this.link_url,
    this.cover_image,
    this.is_gfw,
    this.title,
    this.brief_content,
    this.is_english,
    this.is_original,
    this.user_index,
    this.original_type,
    this.original_author,
    this.content,
    this.ctime,
    this.mtime,
    this.rtime,
    this.draft_id,
    this.view_count,
    this.collect_count,
    this.digg_count,
    this.comment_count,
    this.hot_index,
    this.is_hot,
    this.rank_index,
    this.status,
    this.verify_status,
    this.audit_status,
    this.mark_content,
  );

  factory Article_info.fromJson(Map<String, dynamic> srcJson) =>
      _$Article_infoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Article_infoToJson(this);
}

@JsonSerializable()
class Author_user_info extends Object {
  @JsonKey(name: 'user_id')
  String user_id;

  @JsonKey(name: 'user_name')
  String user_name;

  @JsonKey(name: 'company')
  String company;

  @JsonKey(name: 'job_title')
  String job_title;

  @JsonKey(name: 'avatar_large')
  String avatar_large;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'followee_count')
  int followee_count;

  @JsonKey(name: 'follower_count')
  int follower_count;

  @JsonKey(name: 'post_article_count')
  int post_article_count;

  @JsonKey(name: 'digg_article_count')
  int digg_article_count;

  @JsonKey(name: 'got_digg_count')
  int got_digg_count;

  @JsonKey(name: 'got_view_count')
  int got_view_count;

  @JsonKey(name: 'post_shortmsg_count')
  int post_shortmsg_count;

  @JsonKey(name: 'digg_shortmsg_count')
  int digg_shortmsg_count;

  @JsonKey(name: 'isfollowed')
  bool isfollowed;

  @JsonKey(name: 'favorable_author')
  int favorable_author;

  @JsonKey(name: 'power')
  int power;

  @JsonKey(name: 'study_point')
  int study_point;

  @JsonKey(name: 'university')
  University university;

  @JsonKey(name: 'major')
  Major major;

  @JsonKey(name: 'student_status')
  int student_status;

  @JsonKey(name: 'select_event_count')
  int select_event_count;

  @JsonKey(name: 'select_online_course_count')
  int select_online_course_count;

  @JsonKey(name: 'identity')
  int identity;

  @JsonKey(name: 'is_select_annual')
  bool is_select_annual;

  @JsonKey(name: 'select_annual_rank')
  int select_annual_rank;

  @JsonKey(name: 'annual_list_type')
  int annual_list_type;

  Author_user_info(
    this.user_id,
    this.user_name,
    this.company,
    this.job_title,
    this.avatar_large,
    this.level,
    this.description,
    this.followee_count,
    this.follower_count,
    this.post_article_count,
    this.digg_article_count,
    this.got_digg_count,
    this.got_view_count,
    this.post_shortmsg_count,
    this.digg_shortmsg_count,
    this.isfollowed,
    this.favorable_author,
    this.power,
    this.study_point,
    this.university,
    this.major,
    this.student_status,
    this.select_event_count,
    this.select_online_course_count,
    this.identity,
    this.is_select_annual,
    this.select_annual_rank,
    this.annual_list_type,
  );

  factory Author_user_info.fromJson(Map<String, dynamic> srcJson) =>
      _$Author_user_infoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Author_user_infoToJson(this);
}

@JsonSerializable()
class University extends Object {
  @JsonKey(name: 'university_id')
  String university_id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'logo')
  String logo;

  University(
    this.university_id,
    this.name,
    this.logo,
  );

  factory University.fromJson(Map<String, dynamic> srcJson) =>
      _$UniversityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UniversityToJson(this);
}

@JsonSerializable()
class Major extends Object {
  @JsonKey(name: 'major_id')
  String major_id;

  @JsonKey(name: 'parent_id')
  String parent_id;

  @JsonKey(name: 'name')
  String name;

  Major(
    this.major_id,
    this.parent_id,
    this.name,
  );

  factory Major.fromJson(Map<String, dynamic> srcJson) =>
      _$MajorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MajorToJson(this);
}

@JsonSerializable()
class Category extends Object {
  @JsonKey(name: 'category_id')
  String category_id;

  @JsonKey(name: 'category_name')
  String category_name;

  @JsonKey(name: 'category_url')
  String category_url;

  @JsonKey(name: 'rank')
  int rank;

  @JsonKey(name: 'ctime')
  int ctime;

  @JsonKey(name: 'mtime')
  int mtime;

  @JsonKey(name: 'show_type')
  int show_type;

  Category(
    this.category_id,
    this.category_name,
    this.category_url,
    this.rank,
    this.ctime,
    this.mtime,
    this.show_type,
  );

  factory Category.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Tags extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'tag_id')
  String tag_id;

  @JsonKey(name: 'tag_name')
  String tag_name;

  @JsonKey(name: 'color')
  String color;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'back_ground')
  String back_ground;

  @JsonKey(name: 'show_navi')
  int show_navi;

  @JsonKey(name: 'ctime')
  int ctime;

  @JsonKey(name: 'mtime')
  int mtime;

  @JsonKey(name: 'id_type')
  int id_type;

  @JsonKey(name: 'tag_alias')
  String tag_alias;

  @JsonKey(name: 'post_article_count')
  int post_article_count;

  @JsonKey(name: 'concern_user_count')
  int concern_user_count;

  Tags(
    this.id,
    this.tag_id,
    this.tag_name,
    this.color,
    this.icon,
    this.back_ground,
    this.show_navi,
    this.ctime,
    this.mtime,
    this.id_type,
    this.tag_alias,
    this.post_article_count,
    this.concern_user_count,
  );

  factory Tags.fromJson(Map<String, dynamic> srcJson) =>
      _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}

@JsonSerializable()
class User_interact extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'omitempty')
  int omitempty;

  @JsonKey(name: 'user_id')
  int user_id;

  @JsonKey(name: 'is_digg')
  bool is_digg;

  @JsonKey(name: 'is_follow')
  bool is_follow;

  @JsonKey(name: 'is_collect')
  bool is_collect;

  User_interact(
    this.id,
    this.omitempty,
    this.user_id,
    this.is_digg,
    this.is_follow,
    this.is_collect,
  );

  factory User_interact.fromJson(Map<String, dynamic> srcJson) =>
      _$User_interactFromJson(srcJson);

  Map<String, dynamic> toJson() => _$User_interactToJson(this);
}

@JsonSerializable()
class Org extends Object {
  @JsonKey(name: 'is_followed')
  bool is_followed;

  Org(
    this.is_followed,
  );

  factory Org.fromJson(Map<String, dynamic> srcJson) => _$OrgFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrgToJson(this);
}
