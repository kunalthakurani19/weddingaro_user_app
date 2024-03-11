class GetAllCheckListModel {
  final String? message;
  final bool? success;
  final List<Tasks>? tasks;
  final Pagination? pagination;

  GetAllCheckListModel({
    this.message,
    this.success,
    this.tasks,
    this.pagination,
  });

  GetAllCheckListModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        success = json['success'] as bool?,
        tasks = (json['tasks'] as List?)?.map((dynamic e) => Tasks.fromJson(e as Map<String, dynamic>)).toList(),
        pagination = (json['pagination'] as Map<String, dynamic>?) != null
            ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'tasks': tasks?.map((e) => e.toJson()).toList(),
        'pagination': pagination?.toJson()
      };
}

class Tasks {
  final String? id;
  final String? user;
  final String? name;
  final String? description;
  final dynamic category;
  final String? startdate;
  final bool? isCompleted;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Tasks({
    this.id,
    this.user,
    this.name,
    this.description,
    this.category,
    this.startdate,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Tasks.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        user = json['user'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        category = json['category'],
        startdate = json['startdate'] as String?,
        isCompleted = json['isCompleted'] as bool?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'name': name,
        'description': description,
        'category': category,
        'startdate': startdate,
        'isCompleted': isCompleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class Pagination {
  final String? limit;
  final String? page;
  final int? totalpage;

  Pagination({
    this.limit,
    this.page,
    this.totalpage,
  });

  Pagination.fromJson(Map<String, dynamic> json)
      : limit = json['limit'] as String?,
        page = json['page'] as String?,
        totalpage = json['totalpage'] as int?;

  Map<String, dynamic> toJson() => {'limit': limit, 'page': page, 'totalpage': totalpage};
}
