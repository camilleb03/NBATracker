//
//  Boxscore.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-18.
//

import Foundation

struct BoxscoreRawResponse {
    let boxscore: Boxscore?
}

extension BoxscoreRawResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case boxscore = "stats"
    }
    
    init(from decoder: Decoder) throws {
        // Root level
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.boxscore = try container.decodeIfPresent(Boxscore.self, forKey: .boxscore)
    }
}

struct Boxscore {
    let timesTied, leadChanges: String
    let visitorTeam, homeTeam: StatsTeam
    let activePlayers: [ActivePlayer]
}

extension Boxscore: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case visitorTeam = "vTeam"
        case homeTeam = "hTeam"
        case timesTied, leadChanges, activePlayers
    }
}

struct StatsTeam {
    let fastBreakPoints, pointsInPaint, biggestLead, secondChancePoints: String
    let pointsOffTurnovers, longestRun: String
    let totals: Totals
    let statsLeaders: StatsLeaders
}

extension StatsTeam: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case statsLeaders = "leaders"
        case fastBreakPoints, pointsInPaint, biggestLead, secondChancePoints,
             pointsOffTurnovers, longestRun, totals
    }
}

struct ActivePlayer: Decodable {
    let personID, playerCode, firstName, lastName, jersey, position: String
    let teamID: String
    let isOnCourt: Bool
    let minutes, points, assists, totalRebound: String
    let fgm, fga, fgp: String
    let ftm, fta, ftp: String
    let tpm, tpa, tpp: String
    let pFouls, steals, turnovers, blocks: String
    let plusMinus: String

    enum CodingKeys: String, CodingKey {
        case personID = "personId"
        case firstName, lastName, jersey, isOnCourt
        case position = "pos"
        case teamID = "teamId"
        case playerCode = "player_code"
        case minutes = "min"
        case points, assists
        case totalRebound = "totReb"
        case fgm, fga, fgp
        case ftm, fta, ftp
        case tpm, tpa, tpp
        case pFouls, steals, turnovers, blocks
        case plusMinus
    }
}

struct BasePlayer: Decodable {
    let personId, firstName, lastName: String
}

struct StatsLeaders: Decodable {
    let points, rebounds, assists: GameStat
}

struct GameStat: Decodable {
    let value: String
    let players: [BasePlayer]
}

struct Totals: Decodable {
    let points, fgm, fga, fgp: String
    let ftm, fta, ftp, tpm: String
    let tpa, tpp, offReb, defReb: String
    let totReb, assists, pFouls, steals: String
    let turnovers, blocks, plusMinus, min: String
    let shortTimeoutRemaining, fullTimeoutRemaining, teamFouls: String

    enum CodingKeys: String, CodingKey {
        case points, fgm, fga, fgp, ftm, fta, ftp, tpm, tpa, tpp, offReb, defReb, totReb, assists, pFouls, steals, turnovers, blocks, plusMinus, min
        case shortTimeoutRemaining = "short_timeout_remaining"
        case fullTimeoutRemaining = "full_timeout_remaining"
        case teamFouls = "team_fouls"
    }
}
