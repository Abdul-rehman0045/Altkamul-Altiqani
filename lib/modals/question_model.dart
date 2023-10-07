class QuestionModel {
  List<Item>? items;
  bool? hasMore;
  int? quotaMax;
  int? quotaRemaining;

  QuestionModel({this.items, this.hasMore, this.quotaMax, this.quotaRemaining});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(new Item.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    quotaMax = json['quota_max'];
    quotaRemaining = json['quota_remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['has_more'] = this.hasMore;
    data['quota_max'] = this.quotaMax;
    data['quota_remaining'] = this.quotaRemaining;
    return data;
  }
}

class Item {
  List<String>? tags;
  Owner? owner;
  bool? isAnswered;
  int? viewCount;
  int? answerCount;
  int? score;
  int? lastActivityDate;
  int? creationDate;
  int? questionId;
  String? contentLicense;
  String? link;
  String? title;
  int? closedDate;
  int? lastEditDate;
  String? closedReason;
  int? acceptedAnswerId;

  Item(
      {this.tags,
      this.owner,
      this.isAnswered,
      this.viewCount,
      this.answerCount,
      this.score,
      this.lastActivityDate,
      this.creationDate,
      this.questionId,
      this.contentLicense,
      this.link,
      this.title,
      this.closedDate,
      this.lastEditDate,
      this.closedReason,
      this.acceptedAnswerId});

  Item.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    isAnswered = json['is_answered'];
    viewCount = json['view_count'];
    answerCount = json['answer_count'];
    score = json['score'];
    lastActivityDate = json['last_activity_date'];
    creationDate = json['creation_date'];
    questionId = json['question_id'];
    contentLicense = json['content_license'];
    link = json['link'];
    title = json['title'];
    closedDate = json['closed_date'];
    lastEditDate = json['last_edit_date'];
    closedReason = json['closed_reason'];
    acceptedAnswerId = json['accepted_answer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tags'] = this.tags;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['is_answered'] = this.isAnswered;
    data['view_count'] = this.viewCount;
    data['answer_count'] = this.answerCount;
    data['score'] = this.score;
    data['last_activity_date'] = this.lastActivityDate;
    data['creation_date'] = this.creationDate;
    data['question_id'] = this.questionId;
    data['content_license'] = this.contentLicense;
    data['link'] = this.link;
    data['title'] = this.title;
    data['closed_date'] = this.closedDate;
    data['last_edit_date'] = this.lastEditDate;
    data['closed_reason'] = this.closedReason;
    data['accepted_answer_id'] = this.acceptedAnswerId;
    return data;
  }
}

class Owner {
  int? accountId;
  int? reputation;
  int? userId;
  String? userType;
  String? profileImage;
  String? displayName;
  String? link;
  int? acceptRate;

  Owner(
      {this.accountId,
      this.reputation,
      this.userId,
      this.userType,
      this.profileImage,
      this.displayName,
      this.link,
      this.acceptRate});

  Owner.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    reputation = json['reputation'];
    userId = json['user_id'];
    userType = json['user_type'];
    profileImage = json['profile_image'];
    displayName = json['display_name'];
    link = json['link'];
    acceptRate = json['accept_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['reputation'] = this.reputation;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['profile_image'] = this.profileImage;
    data['display_name'] = this.displayName;
    data['link'] = this.link;
    data['accept_rate'] = this.acceptRate;
    return data;
  }
}
