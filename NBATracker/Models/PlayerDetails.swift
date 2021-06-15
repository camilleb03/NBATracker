//
//  PlayerDetails.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-13.
//

import Foundation

// JSON Data
/*
 URL:
 http://data.nba.net/10s/prod/v1/2020/players/203932_profile.json

 Response:
 {
     "_internal": {
         "pubDateTime": "2021-06-14 00:11:03.560 EDT",
         "igorPath": "S3,1623643857179,1623643859404|router,1623643859404,1623643859412|xmlProcessor,1623643859515,1623643860173|domUpdater,1623643860669,1623643863306|feedProducer,1623643863478,1623643863603",
         "xslt": "NBA/xsl/player/marty_player_profile.xsl",
         "xsltForceRecompile": "true",
         "xsltInCache": "false",
         "xsltCompileTimeMillis": "61",
         "xsltTransformTimeMillis": "37",
         "consolidatedDomKey": "prod__transform__marty_player_profile__1664159991419",
         "endToEndTimeMillis": "6424"
     },
     "league": {
         "standard": {
             "teamId": "1610612761",
             "stats": {
                 "latest": {
                     "seasonYear": 2020,
                     "seasonStageId": 4,
                     "ppg": "-1",
                     "rpg": "-1",
                     "apg": "-1",
                     "mpg": "-1",
                     "topg": "-1",
                     "spg": "-1",
                     "bpg": "-1",
                     "tpp": "-1",
                     "ftp": "-1",
                     "fgp": "-1",
                     "assists": "-1",
                     "blocks": "-1",
                     "steals": "-1",
                     "turnovers": "-1",
                     "offReb": "-1",
                     "defReb": "-1",
                     "totReb": "-1",
                     "fgm": "-1",
                     "fga": "-1",
                     "tpm": "-1",
                     "tpa": "-1",
                     "ftm": "-1",
                     "fta": "-1",
                     "pFouls": "-1",
                     "points": "-1",
                     "gamesPlayed": "-1",
                     "gamesStarted": "-1",
                     "plusMinus": "-1",
                     "min": "-1",
                     "dd2": "-1",
                     "td3": "-1"
                 },
                 "careerSummary": {
                     "tpp": "39.3",
                     "ftp": "77.8",
                     "fgp": "41.7",
                     "ppg": "11",
                     "rpg": "2",
                     "apg": "1.1",
                     "bpg": "0.2",
                     "mpg": "24.2",
                     "spg": "0.8",
                     "assists": "146",
                     "blocks": "28",
                     "steals": "105",
                     "turnovers": "68",
                     "offReb": "53",
                     "defReb": "210",
                     "totReb": "263",
                     "fgm": "532",
                     "fga": "1276",
                     "tpm": "282",
                     "tpa": "718",
                     "ftm": "123",
                     "fta": "158",
                     "pFouls": "186",
                     "points": "1469",
                     "gamesPlayed": "134",
                     "gamesStarted": "47",
                     "plusMinus": "-121",
                     "min": "3244",
                     "dd2": "0",
                     "td3": "0"
                 },
                 "regularSeason": {
                     "season": [
                         {
                             "seasonYear": 2020,
                             "teams": [
                                 {
                                     "teamId": "0",
                                     "ppg": "15.3",
                                     "rpg": "2.6",
                                     "apg": "1.4",
                                     "mpg": "31.1",
                                     "topg": "0.7",
                                     "spg": "1",
                                     "bpg": "0.2",
                                     "tpp": "38.5",
                                     "ftp": "78.3",
                                     "fgp": "40.8",
                                     "assists": "80",
                                     "blocks": "10",
                                     "steals": "56",
                                     "turnovers": "43",
                                     "offReb": "27",
                                     "defReb": "125",
                                     "totReb": "152",
                                     "fgm": "320",
                                     "fga": "785",
                                     "tpm": "165",
                                     "tpa": "429",
                                     "ftm": "83",
                                     "fta": "106",
                                     "pFouls": "92",
                                     "points": "888",
                                     "gamesPlayed": "58",
                                     "gamesStarted": "38",
                                     "plusMinus": "-180",
                                     "min": "1802",
                                     "dd2": "0",
                                     "td3": "0"
                                 },
                                 {
                                     "teamId": "1610612761",
                                     "ppg": "16.2",
                                     "rpg": "3.6",
                                     "apg": "1.3",
                                     "mpg": "31.8",
                                     "topg": "0.7",
                                     "spg": "1.1",
                                     "bpg": "0.2",
                                     "tpp": "35.5",
                                     "ftp": "80.6",
                                     "fgp": "39.5",
                                     "assists": "22",
                                     "blocks": "4",
                                     "steals": "19",
                                     "turnovers": "12",
                                     "offReb": "6",
                                     "defReb": "55",
                                     "totReb": "61",
                                     "fgm": "103",
                                     "fga": "261",
                                     "tpm": "44",
                                     "tpa": "124",
                                     "ftm": "25",
                                     "fta": "31",
                                     "pFouls": "29",
                                     "points": "275",
                                     "gamesPlayed": "17",
                                     "gamesStarted": "15",
                                     "plusMinus": "-153",
                                     "min": "540",
                                     "dd2": "0",
                                     "td3": "0"
                                 },
                                 {
                                     "teamId": "1610612757",
                                     "ppg": "15",
                                     "rpg": "2.2",
                                     "apg": "1.4",
                                     "mpg": "30.8",
                                     "topg": "0.8",
                                     "spg": "0.9",
                                     "bpg": "0.2",
                                     "tpp": "39.7",
                                     "ftp": "77.3",
                                     "fgp": "41.4",
                                     "assists": "58",
                                     "blocks": "6",
                                     "steals": "37",
                                     "turnovers": "31",
                                     "offReb": "21",
                                     "defReb": "70",
                                     "totReb": "91",
                                     "fgm": "217",
                                     "fga": "524",
                                     "tpm": "121",
                                     "tpa": "305",
                                     "ftm": "58",
                                     "fta": "75",
                                     "pFouls": "63",
                                     "points": "613",
                                     "gamesPlayed": "41",
                                     "gamesStarted": "23",
                                     "plusMinus": "-27",
                                     "min": "1261",
                                     "dd2": "0",
                                     "td3": "0"
                                 }
                             ],
                             "total": {}
                         },
                         {
                             "seasonYear": 2019,
                             "teams": [
                                 {
                                     "teamId": "1610612757",
                                     "ppg": "8.9",
                                     "rpg": "1.6",
                                     "apg": "1",
                                     "mpg": "21.8",
                                     "topg": "0.3",
                                     "spg": "0.8",
                                     "bpg": "0.3",
                                     "tpp": "41.8",
                                     "ftp": "82.2",
                                     "fgp": "44.4",
                                     "assists": "61",
                                     "blocks": "16",
                                     "steals": "48",
                                     "turnovers": "21",
                                     "offReb": "25",
                                     "defReb": "75",
                                     "totReb": "100",
                                     "fgm": "196",
                                     "fga": "441",
                                     "tpm": "112",
                                     "tpa": "268",
                                     "ftm": "37",
                                     "fta": "45",
                                     "pFouls": "90",
                                     "points": "541",
                                     "gamesPlayed": "61",
                                     "gamesStarted": "8",
                                     "plusMinus": "-106",
                                     "min": "1332",
                                     "dd2": "0",
                                     "td3": "0"
                                 }
                             ],
                             "total": {
                                 "ppg": "8.9",
                                 "rpg": "1.6",
                                 "apg": "1",
                                 "mpg": "21.8",
                                 "topg": "0.3",
                                 "spg": "0.8",
                                 "bpg": "0.3",
                                 "tpp": "41.8",
                                 "ftp": "82.2",
                                 "fgp": "44.4",
                                 "assists": "61",
                                 "blocks": "16",
                                 "steals": "48",
                                 "turnovers": "21",
                                 "offReb": "25",
                                 "defReb": "75",
                                 "totReb": "100",
                                 "fgm": "196",
                                 "fga": "441",
                                 "tpm": "112",
                                 "tpa": "268",
                                 "ftm": "37",
                                 "fta": "45",
                                 "pFouls": "90",
                                 "points": "541",
                                 "gamesPlayed": "61",
                                 "gamesStarted": "8",
                                 "plusMinus": "-106",
                                 "min": "1332",
                                 "dd2": "0",
                                 "td3": "0"
                             }
                         },
                         {
                             "seasonYear": 2018,
                             "teams": [
                                 {
                                     "teamId": "1610612757",
                                     "ppg": "2.7",
                                     "rpg": "0.7",
                                     "apg": "0.3",
                                     "mpg": "7.4",
                                     "topg": "0.3",
                                     "spg": "0.1",
                                     "bpg": "0.1",
                                     "tpp": "23.8",
                                     "ftp": "42.9",
                                     "fgp": "32",
                                     "assists": "5",
                                     "blocks": "2",
                                     "steals": "1",
                                     "turnovers": "4",
                                     "offReb": "1",
                                     "defReb": "10",
                                     "totReb": "11",
                                     "fgm": "16",
                                     "fga": "50",
                                     "tpm": "5",
                                     "tpa": "21",
                                     "ftm": "3",
                                     "fta": "7",
                                     "pFouls": "4",
                                     "points": "40",
                                     "gamesPlayed": "15",
                                     "gamesStarted": "1",
                                     "plusMinus": "-32",
                                     "min": "110",
                                     "dd2": "0",
                                     "td3": "0"
                                 }
                             ],
                             "total": {
                                 "ppg": "2.7",
                                 "rpg": "0.7",
                                 "apg": "0.3",
                                 "mpg": "7.4",
                                 "topg": "0.3",
                                 "spg": "0.1",
                                 "bpg": "0.1",
                                 "tpp": "23.8",
                                 "ftp": "42.9",
                                 "fgp": "32",
                                 "assists": "5",
                                 "blocks": "2",
                                 "steals": "1",
                                 "turnovers": "4",
                                 "offReb": "1",
                                 "defReb": "10",
                                 "totReb": "11",
                                 "fgm": "16",
                                 "fga": "50",
                                 "tpm": "5",
                                 "tpa": "21",
                                 "ftm": "3",
                                 "fta": "7",
                                 "pFouls": "4",
                                 "points": "40",
                                 "gamesPlayed": "15",
                                 "gamesStarted": "1",
                                 "plusMinus": "-32",
                                 "min": "110",
                                 "dd2": "0",
                                 "td3": "0"
                             }
                         }
                     ]
                 }
             }
         }
     }
 }

*/

struct PlayerDetailRawResponse {
    
    let playerDetail: PlayerDetail
}

extension PlayerDetailRawResponse: Decodable {
    
    private enum RootKeys: String, CodingKey {
        
        case league = "league"
        
        enum LeagueKeys: String, CodingKey {
            
            case standard = "standard"
        }
    }
    
    init(from decoder: Decoder) throws {
        
        // Root level
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        // League level
        let leagueContainer = try container.nestedContainer(keyedBy: RootKeys.LeagueKeys.self, forKey: .league)
        
        // Standard level
        let standard = try leagueContainer.decode(PlayerDetail.self, forKey: .standard)
        self.playerDetail = standard
    }
}

struct PlayerDetail: Decodable {
    let teamID: String?
    let stats: Stats?
    
    enum CodingKeys: String, CodingKey {
        case teamID = "teamId"
        case stats
    }
}

struct Stats: Codable {
    let latest, careerSummary: CareerSummary?
    let regularSeason: RegularSeason?
}

struct CareerSummary: Codable {
    let tpp, ftp, fgp, ppg: String?
    let rpg, apg, bpg, mpg: String?
    let spg, assists, blocks, steals: String?
    let turnovers, offReb, defReb, totReb: String?
    let fgm, fga, tpm, tpa: String?
    let ftm, fta, pFouls, points: String?
    let gamesPlayed, gamesStarted, plusMinus, min: String?
    let dd2, td3: String?
    let seasonYear, seasonStageID: Int?
    let topg, teamID: String?

    enum CodingKeys: String, CodingKey {
        case tpp, ftp, fgp, ppg, rpg, apg, bpg, mpg, spg, assists, blocks, steals, turnovers, offReb, defReb, totReb, fgm, fga, tpm, tpa, ftm, fta, pFouls, points, gamesPlayed, gamesStarted, plusMinus, min, dd2, td3, seasonYear
        case seasonStageID = "seasonStageId"
        case topg
        case teamID = "teamId"
    }
}

struct RegularSeason: Codable {
    let season: [Season]?
}

struct Season: Codable {
    let seasonYear: Int?
    let teams: [CareerSummary]?
    let total: CareerSummary?
}
