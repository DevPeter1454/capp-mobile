// ignore_for_file: public_member_api_docs, sort_constructors_first
class LeaderProfile {
  final String id;
  final String name;
  final String title;
  final String allocation;
  final String profile;
  final String responsibility;
  final String lga;
  final String constituency;
  final List<dynamic> ratings;
  final List<Map<dynamic, dynamic>> comments;
  final String url;
  final String party;
  final String state;

  LeaderProfile({
    required this.id,
    required this.name,
    required this.title,
    required this.allocation,
    required this.profile,
    required this.responsibility,
    required this.lga,
    required this.constituency,
    required this.ratings,
    required this.comments,
    required this.url,
    required this.party,
    required this.state,
  });

  factory LeaderProfile.fromJson(Map<String, dynamic> json) {
    return LeaderProfile(
        id: json['_id'] ?? "",
        name: json['name'] ?? "",
        title: json['title'] ?? "",
        allocation: json['allocation'] ?? "",
        profile: json['profile'] ?? "",
        responsibility: json['responsibility'] ?? "",
        lga: json['lga'] ?? "",
        url: json["url"] ?? "",
        constituency: json['constituency'] ?? "",
        ratings: List<dynamic>.from(json['ratings']),
        comments: List<Map<dynamic, dynamic>>.from(json['comments']),
        state: json["state"] ?? "",
        party: json["party"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'allocation': allocation,
      'profile': profile,
      'responsibility': responsibility,
      'lga': lga,
      'constituency': constituency,
      'ratings': ratings,
      'comments': comments,
    };
  }

  LeaderProfile copyWith({
    String? id,
    String? name,
    String? title,
    String? allocation,
    String? profile,
    String? responsibility,
    String? lga,
    String? constituency,
    List<dynamic>? ratings,
    List<Map<dynamic, dynamic>>? comments,
    String? url,
    String? party,
    String? state,
  }) {
    return LeaderProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      allocation: allocation ?? this.allocation,
      profile: profile ?? this.profile,
      responsibility: responsibility ?? this.responsibility,
      lga: lga ?? this.lga,
      constituency: constituency ?? this.constituency,
      ratings: ratings ?? this.ratings,
      comments: comments ?? this.comments,
      url: url ?? this.url,
      party: party ?? this.party,
      state: state ?? this.state,
    );
  }
  //explain what copywith is used for
  //copyWith is used to create a new instance of the class with the updated values of the fields passed as arguments. It is used to create a new instance of the class with the same values as the original instance, except for the fields that are passed as arguments. This is useful for updating the values of the fields of an object without changing the original object.

  //create one for test
  factory LeaderProfile.forTest() {
    return LeaderProfile(
        id: '66917a53e2f6b86e3191cdec',
        name: 'John Doe',
        title: 'Governor',
        allocation: 'N100,0000',
        profile:
            "https://upload.wikimedia.org/wikipedia/commons/7/77/Bola_Tinubu_portrait.jpg",
        url:
            "https://upload.wikimedia.org/wikipedia/commons/7/77/Bola_Tinubu_portrait.jpg",
        responsibility: 'Governor of Lagos State',
        lga: 'Ikeja',
        constituency: 'Lagos Central',
        ratings: [5, 4, 3, 2, 1],
        party: "APC",
        state: "Lagos",
        comments: [
          {
            "user": {
              "firstname": "Glory",
              "lastname": "Olaifa",
            },
            "comment": "A bad president",
            "createdAt": DateTime.parse("2024-07-14T09:11:30.640Z"),
          },
          {
            "user": {
              "firstname": "John",
              "lastname": "Doe",
            },
            "comment": "A good president",
            "createdAt": DateTime.parse("2024-07-14T09:11:30.640Z"),
          },
        ]);
  }
}
