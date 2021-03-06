//
//  ConferenceStandings.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-07-20.
//

import Foundation

struct StandingsRawResponse {
    
    let conferenceStandings: [TeamStandingInfo]
    
}

extension StandingsRawResponse: Decodable {
    
    private enum RootKeys: String, CodingKey {
        
        case league = "league"
        
        enum LeagueKeys: String, CodingKey {
            
            case standard = "standard"
            
            enum StandardKeys: String, CodingKey {
                
                case conference = "conference"
                
                enum ConferenceKeys: String, CodingKey {
                    
                    case east
                    case west
                }
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        
        // Root level
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        // League level
        let leagueContainer = try container.nestedContainer(keyedBy: RootKeys.LeagueKeys.self, forKey: .league)
        
        // Standard level
        let standardContainer = try leagueContainer.nestedContainer(keyedBy: RootKeys.LeagueKeys.StandardKeys.self, forKey: .standard)
        
        // Conference level
        let conferenceContainer = try standardContainer.nestedContainer(keyedBy: RootKeys.LeagueKeys.StandardKeys.ConferenceKeys.self, forKey: .conference)
        var eastStandings = try conferenceContainer.decode([TeamStandingInfo].self, forKey: .east)
        eastStandings.indices.forEach({ eastStandings[$0].conference = .east })
        
        var westStandings = try conferenceContainer.decode([TeamStandingInfo].self, forKey: .west)
        westStandings.indices.forEach({ westStandings[$0].conference = .west })
        
        self.conferenceStandings = westStandings + eastStandings
    }
}

struct TeamStandingInfo: Identifiable {
    
    let id: String
    let teamTriCode: String
    let teamName: String
    let teamCity: String
    let wins: Int
    let losses: Int
    let winPercentage: Double
    let gamesBehind: Double
    let lastTen: String
    let streak: String
    let clinchedPlayoffs: Bool
    
    var conference: Conference? = nil
}

extension TeamStandingInfo: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case teamId = "teamId"
        case wins = "win"
        case losses = "loss"
        case winPercentage = "winPct"
        case gamesBehind = "gamesBehind"
        case lastTenWin = "lastTenWin"
        case lastTenLoss = "lastTenLoss"
        case streak = "streak"
        case isWinStreak = "isWinStreak"
        
        case teamSitesOnly = "teamSitesOnly"
        
        enum TeamSitesOnlyKeys: String, CodingKey {
            case teamTriCode = "teamTricode"
            case teamCity = "teamName"
            case teamName = "teamNickname"
            case clinchedPlayoffs = "clinchedPlayoffs"
            
        }
        
    }
    
    init(from decoder: Decoder) throws {
        
        // Root level
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Team id
        self.id = try container.decode(String.self, forKey: .teamId)
        
        // Win number
        guard let winsInt = Int(try container.decode(String.self, forKey: .wins)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [CodingKeys.wins], debugDescription: "value for \"win\" needs to be a valid Int"))
        }
        self.wins = winsInt
        
        // Loss number
        guard let lossesInt = Int(try container.decode(String.self, forKey: .losses)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [CodingKeys.losses], debugDescription: "value for \"loss\" needs to be a valid Int"))
        }
        self.losses = lossesInt
        
        // Win Percentage
        guard let winPercentageDouble = Double(try container.decode(String.self, forKey: .winPercentage)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [CodingKeys.winPercentage], debugDescription: "value for \"winPct\" needs to be a valid Double"))
        }
        self.winPercentage = winPercentageDouble
        
        // Games behind
        guard let gamesBehindDouble = Double(try container.decode(String.self, forKey: .gamesBehind)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [CodingKeys.gamesBehind], debugDescription: "value for \"gamesBehind\" needs to be a valid Double"))
        }
        self.gamesBehind = gamesBehindDouble
        
        // Last ten games
        let lastTenWin = try container.decode(String.self, forKey: .lastTenWin)
        let lastTenLoss = try container.decode(String.self, forKey: .lastTenLoss)
        self.lastTen = "\(lastTenWin)-\(lastTenLoss)"
        
        // Streak
        let streakString = try container.decode(String.self, forKey: .streak)
        let isWinStreak = try container.decode(Bool.self, forKey: .isWinStreak)
        self.streak = isWinStreak ? "W\(streakString)" : "L\(streakString)"
        
        // TeamSitesOnly level
        let teamSitesOnlyContainer = try container.nestedContainer(keyedBy: CodingKeys.TeamSitesOnlyKeys.self, forKey: .teamSitesOnly)
        
        self.teamName = try teamSitesOnlyContainer.decode(String.self, forKey: .teamName)
        self.teamCity = try teamSitesOnlyContainer.decode(String.self, forKey: .teamCity)
        self.teamTriCode = try teamSitesOnlyContainer.decode(String.self, forKey: .teamTriCode)
        
        let clinchedPlayoffsString = try teamSitesOnlyContainer.decode(String.self, forKey: .clinchedPlayoffs)
        self.clinchedPlayoffs = clinchedPlayoffsString == "1" ? true : false
        
    }
}

enum Conference {
    case west
    case east
}
