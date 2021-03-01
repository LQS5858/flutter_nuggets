// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Popular _$PopularFromJson(Map<String, dynamic> json) {
  return Popular(
    json['err_no'] as int,
    json['err_msg'] as String,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['cursor'] as String,
    json['count'] as int,
    json['has_more'] as bool,
  );
}

Map<String, dynamic> _$PopularToJson(Popular instance) => <String, dynamic>{
      'err_no': instance.err_no,
      'err_msg': instance.err_msg,
      'data': instance.data,
      'cursor': instance.cursor,
      'count': instance.count,
      'has_more': instance.has_more,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['item_type'] as int,
    json['item_info'] == null
        ? null
        : Item_info.fromJson(json['item_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'item_type': instance.item_type,
      'item_info': instance.item_info,
    };

Item_info _$Item_infoFromJson(Map<String, dynamic> json) {
  return Item_info(
    json['article_id'] as String,
    json['article_info'] == null
        ? null
        : Article_info.fromJson(json['article_info'] as Map<String, dynamic>),
    json['author_user_info'] == null
        ? null
        : Author_user_info.fromJson(
            json['author_user_info'] as Map<String, dynamic>),
    json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    (json['tags'] as List)
        ?.map(
            (e) => e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['user_interact'] == null
        ? null
        : User_interact.fromJson(json['user_interact'] as Map<String, dynamic>),
    json['org'] == null
        ? null
        : Org.fromJson(json['org'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$Item_infoToJson(Item_info instance) => <String, dynamic>{
      'article_id': instance.article_id,
      'article_info': instance.article_info,
      'author_user_info': instance.author_user_info,
      'category': instance.category,
      'tags': instance.tags,
      'user_interact': instance.user_interact,
      'org': instance.org,
    };

Article_info _$Article_infoFromJson(Map<String, dynamic> json) {
  return Article_info(
    json['article_id'] as String,
    json['user_id'] as String,
    json['category_id'] as String,
    (json['tag_ids'] as List)?.map((e) => e as int)?.toList(),
    json['visible_level'] as int,
    json['link_url'] as String,
    json['cover_image'] as String,
    json['is_gfw'] as int,
    json['title'] as String,
    json['brief_content'] as String,
    json['is_english'] as int,
    json['is_original'] as int,
    (json['user_index'] as num)?.toDouble(),
    json['original_type'] as int,
    json['original_author'] as String,
    json['content'] as String,
    json['ctime'] as String,
    json['mtime'] as String,
    json['rtime'] as String,
    json['draft_id'] as String,
    json['view_count'] as int,
    json['collect_count'] as int,
    json['digg_count'] as int,
    json['comment_count'] as int,
    json['hot_index'] as int,
    json['is_hot'] as int,
    (json['rank_index'] as num)?.toDouble(),
    json['status'] as int,
    json['verify_status'] as int,
    json['audit_status'] as int,
    json['mark_content'] as String,
  );
}

Map<String, dynamic> _$Article_infoToJson(Article_info instance) =>
    <String, dynamic>{
      'article_id': instance.article_id,
      'user_id': instance.user_id,
      'category_id': instance.category_id,
      'tag_ids': instance.tag_ids,
      'visible_level': instance.visible_level,
      'link_url': instance.link_url,
      'cover_image': instance.cover_image,
      'is_gfw': instance.is_gfw,
      'title': instance.title,
      'brief_content': instance.brief_content,
      'is_english': instance.is_english,
      'is_original': instance.is_original,
      'user_index': instance.user_index,
      'original_type': instance.original_type,
      'original_author': instance.original_author,
      'content': instance.content,
      'ctime': instance.ctime,
      'mtime': instance.mtime,
      'rtime': instance.rtime,
      'draft_id': instance.draft_id,
      'view_count': instance.view_count,
      'collect_count': instance.collect_count,
      'digg_count': instance.digg_count,
      'comment_count': instance.comment_count,
      'hot_index': instance.hot_index,
      'is_hot': instance.is_hot,
      'rank_index': instance.rank_index,
      'status': instance.status,
      'verify_status': instance.verify_status,
      'audit_status': instance.audit_status,
      'mark_content': instance.mark_content,
    };

Author_user_info _$Author_user_infoFromJson(Map<String, dynamic> json) {
  return Author_user_info(
    json['user_id'] as String,
    json['user_name'] as String,
    json['company'] as String,
    json['job_title'] as String,
    json['avatar_large'] as String,
    json['level'] as int,
    json['description'] as String,
    json['followee_count'] as int,
    json['follower_count'] as int,
    json['post_article_count'] as int,
    json['digg_article_count'] as int,
    json['got_digg_count'] as int,
    json['got_view_count'] as int,
    json['post_shortmsg_count'] as int,
    json['digg_shortmsg_count'] as int,
    json['isfollowed'] as bool,
    json['favorable_author'] as int,
    json['power'] as int,
    json['study_point'] as int,
    json['university'] == null
        ? null
        : University.fromJson(json['university'] as Map<String, dynamic>),
    json['major'] == null
        ? null
        : Major.fromJson(json['major'] as Map<String, dynamic>),
    json['student_status'] as int,
    json['select_event_count'] as int,
    json['select_online_course_count'] as int,
    json['identity'] as int,
    json['is_select_annual'] as bool,
    json['select_annual_rank'] as int,
    json['annual_list_type'] as int,
  );
}

Map<String, dynamic> _$Author_user_infoToJson(Author_user_info instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'company': instance.company,
      'job_title': instance.job_title,
      'avatar_large': instance.avatar_large,
      'level': instance.level,
      'description': instance.description,
      'followee_count': instance.followee_count,
      'follower_count': instance.follower_count,
      'post_article_count': instance.post_article_count,
      'digg_article_count': instance.digg_article_count,
      'got_digg_count': instance.got_digg_count,
      'got_view_count': instance.got_view_count,
      'post_shortmsg_count': instance.post_shortmsg_count,
      'digg_shortmsg_count': instance.digg_shortmsg_count,
      'isfollowed': instance.isfollowed,
      'favorable_author': instance.favorable_author,
      'power': instance.power,
      'study_point': instance.study_point,
      'university': instance.university,
      'major': instance.major,
      'student_status': instance.student_status,
      'select_event_count': instance.select_event_count,
      'select_online_course_count': instance.select_online_course_count,
      'identity': instance.identity,
      'is_select_annual': instance.is_select_annual,
      'select_annual_rank': instance.select_annual_rank,
      'annual_list_type': instance.annual_list_type,
    };

University _$UniversityFromJson(Map<String, dynamic> json) {
  return University(
    json['university_id'] as String,
    json['name'] as String,
    json['logo'] as String,
  );
}

Map<String, dynamic> _$UniversityToJson(University instance) =>
    <String, dynamic>{
      'university_id': instance.university_id,
      'name': instance.name,
      'logo': instance.logo,
    };

Major _$MajorFromJson(Map<String, dynamic> json) {
  return Major(
    json['major_id'] as String,
    json['parent_id'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$MajorToJson(Major instance) => <String, dynamic>{
      'major_id': instance.major_id,
      'parent_id': instance.parent_id,
      'name': instance.name,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['category_id'] as String,
    json['category_name'] as String,
    json['category_url'] as String,
    json['rank'] as int,
    json['ctime'] as int,
    json['mtime'] as int,
    json['show_type'] as int,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'category_id': instance.category_id,
      'category_name': instance.category_name,
      'category_url': instance.category_url,
      'rank': instance.rank,
      'ctime': instance.ctime,
      'mtime': instance.mtime,
      'show_type': instance.show_type,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(
    json['id'] as int,
    json['tag_id'] as String,
    json['tag_name'] as String,
    json['color'] as String,
    json['icon'] as String,
    json['back_ground'] as String,
    json['show_navi'] as int,
    json['tag_alias'] as String,
    json['post_article_count'] as int,
    json['concern_user_count'] as int,
  );
}

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'tag_id': instance.tag_id,
      'tag_name': instance.tag_name,
      'color': instance.color,
      'icon': instance.icon,
      'back_ground': instance.back_ground,
      'show_navi': instance.show_navi,
      'tag_alias': instance.tag_alias,
      'post_article_count': instance.post_article_count,
      'concern_user_count': instance.concern_user_count,
    };

User_interact _$User_interactFromJson(Map<String, dynamic> json) {
  return User_interact(
    json['id'] as int,
    json['omitempty'] as int,
    json['user_id'] as int,
    json['is_digg'] as bool,
    json['is_follow'] as bool,
    json['is_collect'] as bool,
  );
}

Map<String, dynamic> _$User_interactToJson(User_interact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'omitempty': instance.omitempty,
      'user_id': instance.user_id,
      'is_digg': instance.is_digg,
      'is_follow': instance.is_follow,
      'is_collect': instance.is_collect,
    };

Org _$OrgFromJson(Map<String, dynamic> json) {
  return Org(
    json['is_followed'] as bool,
  );
}

Map<String, dynamic> _$OrgToJson(Org instance) => <String, dynamic>{
      'is_followed': instance.is_followed,
    };
