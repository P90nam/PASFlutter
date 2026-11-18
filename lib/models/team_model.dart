import 'dart:convert';
  PremierLeagueModel premierLeagueModelFromJson(String str) => 
    PremierLeagueModel.fromJson(json.decode(str));
  String premierLeagueModelToJson(PremierLeagueModel data) =>
    json.encode(data.toJson());
  
  class PremierLeagueModel {
    PremierLeagueModel({
      required this.teams,
    });
  
    List<Team> teams;
  
    factory PremierLeagueModel.fromJson(Map<String, dynamic> json) => 
      PremierLeagueModel(
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
      );
  
    Map<String, dynamic> toJson() => {
      "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
    };
  }

class Team {
  String IdTeam;
  String strTeam;
  String strStadium;
  String strBadge;
  String strDescriptionEn;

  Team({
    required this.IdTeam,
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    required this.strDescriptionEn,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        IdTeam: json["idTeam"],
        strTeam: json["strTeam"],
        strStadium: json["strStadium"],
        strBadge: json["strBadge"],
        strDescriptionEn: json["strDescriptionEN"],
  );

  Map<String, dynamic> toJson() => {
        "idTeam": IdTeam,
        "strTeam": strTeam,
        "strStadium": strStadium,
        "strBadge": strBadge,
        "strDescriptionEN": strDescriptionEn,
  };
  
}


































