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

struct PlayerDetail {
    let currentTeamID: String?
    let careerSummary: PlayerStats
    let regularSeason: [Season]
}

extension PlayerDetail: Decodable {
    
    private enum RootKeys: String, CodingKey {
        case currentTeamID = "teamId"
        case stats
        
        enum StatsKeys: String, CodingKey {
            case careerSummary
            case regularSeason
            
            enum RegularSeasonKeys: String, CodingKey {
                case season
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        
        // Root level
        let container = try decoder.container(keyedBy: RootKeys.self)
        self.currentTeamID = try container.decode(String.self, forKey: .currentTeamID)
        
        // Stats level
        let statsContainer = try container.nestedContainer(keyedBy: RootKeys.StatsKeys.self, forKey: .stats)
        self.careerSummary = try statsContainer.decode(PlayerStats.self, forKey: .careerSummary)
        
        // Regular Season level
        let regularSeasonContainer = try statsContainer.nestedContainer(keyedBy: RootKeys.StatsKeys.RegularSeasonKeys.self, forKey: .regularSeason)
        self.regularSeason = try regularSeasonContainer.decode([Season].self, forKey: .season)
    }
}

struct PlayerStats {
    
    let teamID: String?
    
    // Totals
    let totalPoints, totalRebounds, totalAssists, totalBlocks, totalSteals: Int
    let totalMin, totalTurnovers, totalPersonalFouls: Int
    let totalOffRebounds, totalDefRebounds: Int
    let gamesPlayed, gamesStarted: Int
    let totalDD2, totalTD3: Int
    let plusMinus: Double
    
    // Averages per game
    let mpg: Double
    let ppg: Double
    let apg: Double
    let rpg: Double
    let spg: Double
    let bpg: Double
    let topg: Double
    
    // Shooting stats
    let fgm, fga: Int
    let fgp: Double
    let tpm, tpa: Int
    let tpp: Double
    let ftm, fta: Int
    let ftp: Double
}

extension PlayerStats: Decodable {
    
    private enum RootKeys: String, CodingKey {
        
        case teamID = "teamId"
        case totalMin = "min"
        case totalPoints = "points"
        case totalRebounds = "totReb"
        case totalAssists = "assists"
        case totalSteals = "steals"
        case totalBlocks = "blocks"
        case totalOffRebounds = "offReb"
        case totalDefRebounds = "defReb"
        case totalTurnovers = "turnovers"
        case totalPersonalFouls = "pFouls"
        case gamesPlayed, gamesStarted, plusMinus
        case totalDD2 = "dd2"
        case totalTD3 = "td3"
        case mpg, ppg, apg, rpg, spg, bpg, topg
        case fgm, fga, fgp
        case ftm, fta, ftp
        case tpm, tpa, tpp
    }
    
    init(from decoder: Decoder) throws {
        // MARK: Root level
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        self.teamID = try container.decodeIfPresent(String.self, forKey: .teamID)
        
        // MARK: - Totals stats
        // MARK: General stats
        guard let totalMin = Int(try container.decode(String.self, forKey: .totalMin)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalMin], debugDescription: "Value for \"\(RootKeys.totalMin.rawValue)\" needs to be a valid Int"))
        }
        self.totalMin = totalMin
        
        guard let totalPoints = Int(try container.decode(String.self, forKey: .totalPoints)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalPoints], debugDescription: "Value for \"\(RootKeys.totalPoints.rawValue)\" needs to be a valid Int"))
        }
        self.totalPoints = totalPoints
        
        guard let totalRebounds = Int(try container.decode(String.self, forKey: .totalRebounds)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalRebounds], debugDescription: "Value for \"\(RootKeys.totalRebounds.rawValue)\" needs to be a valid Int"))
        }
        self.totalRebounds = totalRebounds
        
        guard let totalAssists = Int(try container.decode(String.self, forKey: .totalAssists)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalAssists], debugDescription: "Value for \"\(RootKeys.totalAssists.rawValue)\" needs to be a valid Int"))
        }
        self.totalAssists = totalAssists
        
        guard let totalSteals = Int(try container.decode(String.self, forKey: .totalSteals)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalSteals], debugDescription: "Value for \"\(RootKeys.totalSteals.rawValue)\" needs to be a valid Int"))
        }
        self.totalSteals = totalSteals
        
        guard let totalBlocks = Int(try container.decode(String.self, forKey: .totalBlocks)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalBlocks], debugDescription: "Value for \"\(RootKeys.totalBlocks.rawValue)\" needs to be a valid Int"))
        }
        self.totalBlocks = totalBlocks
        
        guard let totalOffRebounds = Int(try container.decode(String.self, forKey: .totalOffRebounds)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalOffRebounds], debugDescription: "Value for \"\(RootKeys.totalOffRebounds.rawValue)\" needs to be a valid Int"))
        }
        self.totalOffRebounds = totalOffRebounds
        
        guard let totalDefRebounds = Int(try container.decode(String.self, forKey: .totalDefRebounds)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalDefRebounds], debugDescription: "Value for \"\(RootKeys.totalDefRebounds.rawValue)\" needs to be a valid Int"))
        }
        self.totalDefRebounds = totalDefRebounds
        
        guard let totalTurnovers = Int(try container.decode(String.self, forKey: .totalTurnovers)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalTurnovers], debugDescription: "Value for \"\(RootKeys.totalTurnovers.rawValue)\" needs to be a valid Int"))
        }
        self.totalTurnovers = totalTurnovers
        
        guard let totalPersonalFouls = Int(try container.decode(String.self, forKey: .totalPersonalFouls)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalPersonalFouls], debugDescription: "Value for \"\(RootKeys.totalPersonalFouls.rawValue)\" needs to be a valid Int"))
        }
        self.totalPersonalFouls = totalPersonalFouls
        
        guard let gamesPlayed = Int(try container.decode(String.self, forKey: .gamesPlayed)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.gamesPlayed], debugDescription: "Value for \"\(RootKeys.gamesPlayed.rawValue)\" needs to be a valid Int"))
        }
        self.gamesPlayed = gamesPlayed
        
        guard let gamesStarted = Int(try container.decode(String.self, forKey: .gamesStarted)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.gamesStarted], debugDescription: "Value for \"\(RootKeys.gamesStarted.rawValue)\" needs to be a valid Int"))
        }
        self.gamesStarted = gamesStarted
        
        // MARK: Advanced stats
        guard let plusMinus = Double(try container.decode(String.self, forKey: .plusMinus)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.plusMinus], debugDescription: "Value for \"\(RootKeys.plusMinus.rawValue)\" needs to be a valid Double"))
        }
        self.plusMinus = plusMinus
        
        guard let totalDD2 = Int(try container.decode(String.self, forKey: .totalDD2)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalDD2], debugDescription: "Value for \"\(RootKeys.totalDD2.rawValue)\" needs to be a valid Int"))
        }
        self.totalDD2 = totalDD2
        
        guard let totalTD3 = Int(try container.decode(String.self, forKey: .totalTD3)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.totalTD3], debugDescription: "Value for \"\(RootKeys.totalTD3.rawValue)\" needs to be a valid Int"))
        }
        self.totalTD3 = totalTD3
        
        // MARK: - Averages stats (mpg, ppg, apg, rpg, spg, bpg, topg)
        
        guard let mpg = Double(try container.decode(String.self, forKey: .mpg)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.mpg], debugDescription: "Value for \"\(RootKeys.mpg.rawValue)\" needs to be a valid Double"))
        }
        self.mpg = mpg
        
        guard let ppg = Double(try container.decode(String.self, forKey: .ppg)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.ppg], debugDescription: "Value for \"\(RootKeys.ppg.rawValue)\" needs to be a valid Double"))
        }
        self.ppg = ppg
        
        guard let apg = Double(try container.decode(String.self, forKey: .apg)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.apg], debugDescription: "Value for \"\(RootKeys.apg.rawValue)\" needs to be a valid Double"))
        }
        self.apg = apg
        
        guard let rpg = Double(try container.decode(String.self, forKey: .rpg)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.rpg], debugDescription: "Value for \"\(RootKeys.rpg.rawValue)\" needs to be a valid Double"))
        }
        self.rpg = rpg
        
        guard let spg = Double(try container.decode(String.self, forKey: .spg)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.spg], debugDescription: "Value for \"\(RootKeys.spg.rawValue)\" needs to be a valid Double"))
        }
        self.spg = spg
        
        guard let bpg = Double(try container.decode(String.self, forKey: .bpg)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.bpg], debugDescription: "Value for \"\(RootKeys.bpg.rawValue)\" needs to be a valid Double"))
        }
        self.bpg = bpg
        
        guard let topg = Double(try container.decode(String.self, forKey: .topg)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.topg], debugDescription: "Value for \"\(RootKeys.topg.rawValue)\" needs to be a valid Double"))
        }
        self.topg = topg
        
        // MARK: - Shooting stats
        
        // MARK: Field goal stats
        guard let fgm = Int(try container.decode(String.self, forKey: .fgm)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.fgm], debugDescription: "Value for \"\(RootKeys.fgm.rawValue)\" needs to be a valid Int"))
        }
        self.fgm = fgm
        
        guard let fga = Int(try container.decode(String.self, forKey: .fga)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.fga], debugDescription: "Value for \"\(RootKeys.fga.rawValue)\" needs to be a valid Int"))
        }
        self.fga = fga
        
        guard let fgp = Double(try container.decode(String.self, forKey: .fgp)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.fgp], debugDescription: "Value for \"\(RootKeys.fgp.rawValue)\" needs to be a valid Double"))
        }
        self.fgp = fgp / 100
        
        // MARK: Free throws stats
        guard let ftm = Int(try container.decode(String.self, forKey: .ftm)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.ftm], debugDescription: "Value for \"\(RootKeys.ftm.rawValue)\" needs to be a valid Int"))
        }
        self.ftm = ftm
        
        guard let fta = Int(try container.decode(String.self, forKey: .fta)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.fta], debugDescription: "Value for \"\(RootKeys.fta.rawValue)\" needs to be a valid Int"))
        }
        self.fta = fta
        
        guard let ftp = Double(try container.decode(String.self, forKey: .ftp)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.ftp], debugDescription: "Value for \"\(RootKeys.ftp.rawValue)\" needs to be a valid Double"))
        }
        self.ftp = ftp / 100
        
        // MARK: Three points stats
        guard let tpm = Int(try container.decode(String.self, forKey: .tpm)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.tpm], debugDescription: "Value for \"\(RootKeys.tpm.rawValue)\" needs to be a valid Int"))
        }
        self.tpm = tpm
        
        guard let tpa = Int(try container.decode(String.self, forKey: .tpa)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.tpa], debugDescription: "Value for \"\(RootKeys.tpa.rawValue)\" needs to be a valid Int"))
        }
        self.tpa = tpa
        
        guard let tpp = Double(try container.decode(String.self, forKey: .tpp)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.tpp], debugDescription: "Value for \"\(RootKeys.tpp.rawValue)\" needs to be a valid Double"))
        }
        self.tpp = tpp / 100
    }
}

struct Season: Decodable {
    let seasonYear: Int?
    let teams: [PlayerStats]?
    let total: PlayerStats?
}
