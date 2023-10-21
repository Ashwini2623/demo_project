class HomePageResponse {
  bool? statusCode;
  List<Data> data = [];

  HomePageResponse({this.statusCode, this.data = const []});

  HomePageResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = statusCode;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  int? joiningFee;
  int? offeredJoiningFee;
  int? maxWinningAmt;
  int? firstWinningAmt;
  int? totalWinners;
  int? multiEntry;
  int? maxSpots;
  int? leftSpots;
  String? contestCategoryName;

  Data(
      {this.joiningFee,
      this.offeredJoiningFee,
      this.maxWinningAmt,
      this.firstWinningAmt,
      this.totalWinners,
      this.multiEntry,
      this.maxSpots,
      this.leftSpots,
      this.contestCategoryName});

  Data.fromJson(Map<String, dynamic> json) {
    joiningFee = json['joiningFee'];
    offeredJoiningFee = json['offeredJoiningFee'];
    maxWinningAmt = json['maxWinningAmt'];
    firstWinningAmt = json['firstWinningAmt'];
    totalWinners = json['totalWinners'];
    multiEntry = json['multiEntry'];
    maxSpots = json['maxSpots'];
    leftSpots = json['leftSpots'];
    contestCategoryName = json['contestCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['joiningFee'] = joiningFee;
    data['offeredJoiningFee'] = offeredJoiningFee;
    data['maxWinningAmt'] = maxWinningAmt;
    data['firstWinningAmt'] = firstWinningAmt;
    data['totalWinners'] = totalWinners;
    data['multiEntry'] = multiEntry;
    data['maxSpots'] = maxSpots;
    data['leftSpots'] = leftSpots;
    data['contestCategoryName'] = contestCategoryName;
    return data;
  }
}
