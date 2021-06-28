//
//  Boxscore.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-18.
//

import Foundation

// Complete Decodable
/*
 
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
     let totals: TotalStats
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

 struct TotalStats {
     // main stats
     let points, totReb, assists, steals, blocks: Int
     let turnovers, pFouls, teamFouls: Int
     // field goal stats
     let fgm, fga: Int
     let fgp: Double
     // free throw stats
     let ftm, fta: Int
     let ftp: Double
     // three points stats
     let tpa, tpm: Int
     let tpp: Double
     // rebounds stats
     let offReb, defReb: Double
     // advanced stats
     let plusMinus, shortTimeoutRemaining, fullTimeoutRemaining: Double
 }

 extension TotalStats: Decodable {
     
     private enum CodingKeys: String, CodingKey {
         case points, fgm, fga, fgp, ftm, fta, ftp, tpm, tpa, tpp, offReb, defReb, totReb, assists, pFouls, steals, turnovers, blocks, plusMinus
         case shortTimeoutRemaining = "short_timeout_remaining"
         case fullTimeoutRemaining = "full_timeout_remaining"
         case teamFouls = "team_fouls"
     }
 }

 */

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
    let visitorTeam, homeTeam: TeamGameStats
}

extension Boxscore: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case visitorTeam = "vTeam"
        case homeTeam = "hTeam"
    }
}

struct TeamGameStats {
    // general points stats
    let fastBreakPoints, pointsInPaint, biggestLead, secondChancePoints: Int
    let pointsOffTurnovers, longestRun: Int
    // main stats
    let points, totReb, assists, steals, blocks: Int
    let turnovers, pFouls, teamFouls: Int
    // field goal stats
    let fgm, fga: Int
    let fgp: Double
    // free throw stats
    let ftm, fta: Int
    let ftp: Double
    // three points stats
    let tpa, tpm: Int
    let tpp: Double
    // rebounds stats
    let offReb, defReb: Int
    // advanced stats
    let plusMinus: Double
    let shortTimeoutRemaining, fullTimeoutRemaining: Int
}

extension TeamGameStats: Decodable {
    
    private enum RootKeys: String, CodingKey {
        case fastBreakPoints, pointsInPaint, biggestLead, secondChancePoints,
             pointsOffTurnovers, longestRun, totals
        
        enum TotalsKeys: String, CodingKey {
            case points, fgm, fga, fgp, ftm, fta, ftp, tpm, tpa, tpp, offReb, defReb, totReb, assists, pFouls, steals, turnovers, blocks, plusMinus
            case shortTimeoutRemaining = "short_timeout_remaining"
            case fullTimeoutRemaining = "full_timeout_remaining"
            case teamFouls = "team_fouls"
        }
    }
    
    init(from decoder: Decoder) throws {
        // MARK: - Root level
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        // MARK: General points stats
        guard let fastBreakPoints = Int(try container.decode(String.self, forKey: .fastBreakPoints)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.fastBreakPoints], debugDescription: "Value for \"\(RootKeys.fastBreakPoints.rawValue)\" needs to be a valid Int"))
        }
        self.fastBreakPoints = fastBreakPoints
        
        guard let pointsInPaint = Int(try container.decode(String.self, forKey: .pointsInPaint)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.pointsInPaint], debugDescription: "Value for \"\(RootKeys.pointsInPaint.rawValue)\" needs to be a valid Int"))
        }
        self.pointsInPaint = pointsInPaint
        
        guard let biggestLead = Int(try container.decode(String.self, forKey: .biggestLead)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.biggestLead], debugDescription: "Value for \"\(RootKeys.biggestLead.rawValue)\" needs to be a valid Int"))
        }
        self.biggestLead = biggestLead
        
        guard let secondChancePoints = Int(try container.decode(String.self, forKey: .secondChancePoints)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.secondChancePoints], debugDescription: "Value for \"\(RootKeys.secondChancePoints.rawValue)\" needs to be a valid Int"))
        }
        self.secondChancePoints = secondChancePoints
        
        guard let pointsOffTurnovers = Int(try container.decode(String.self, forKey: .pointsOffTurnovers)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.pointsOffTurnovers], debugDescription: "Value for \"\(RootKeys.pointsOffTurnovers.rawValue)\" needs to be a valid Int"))
        }
        self.pointsOffTurnovers = pointsOffTurnovers
        
        guard let longestRun = Int(try container.decode(String.self, forKey: .longestRun)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.longestRun], debugDescription: "Value for \"\(RootKeys.longestRun.rawValue)\" needs to be a valid Int"))
        }
        self.longestRun = longestRun
        
        // MARK: - Team totals stats level
        let totalsContainer = try container.nestedContainer(keyedBy: RootKeys.TotalsKeys.self, forKey: .totals)
        
        // MARK: Main stats
        // Points
        guard let pointsInt = Int(try totalsContainer.decode(String.self, forKey: .points)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: totalsContainer.codingPath + [RootKeys.TotalsKeys.points], debugDescription: "Value for \"\(RootKeys.TotalsKeys.points.rawValue)\" needs to be a valid Int"))
        }
        self.points = pointsInt
        
        // Assists
        guard let assists = Int(try totalsContainer.decode(String.self, forKey: .assists)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: totalsContainer.codingPath + [RootKeys.TotalsKeys.assists], debugDescription: "Value for \"\(RootKeys.TotalsKeys.assists.rawValue)\" needs to be a valid Int"))
        }
        self.assists = assists
        
        // Total Rebounds
        guard let totReb = Int(try totalsContainer.decode(String.self, forKey: .totReb)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: totalsContainer.codingPath + [RootKeys.TotalsKeys.totReb], debugDescription: "Value for \"\(RootKeys.TotalsKeys.totReb.rawValue)\" needs to be a valid Int"))
        }
        self.totReb = totReb
        
        // Blocks
        guard let blocks = Int(try totalsContainer.decode(String.self, forKey: .blocks)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: totalsContainer.codingPath + [RootKeys.TotalsKeys.blocks], debugDescription: "Value for \"\(RootKeys.TotalsKeys.blocks.rawValue)\" needs to be a valid Int"))
        }
        self.blocks = blocks
        
        // Steals
        guard let steals = Int(try totalsContainer.decode(String.self, forKey: .steals)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.steals], debugDescription: "Value for \"\(RootKeys.TotalsKeys.steals.rawValue)\" needs to be a valid Int"))
        }
        self.steals = steals
        
        // Turnovers
        guard let turnovers = Int(try totalsContainer.decode(String.self, forKey: .turnovers)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.turnovers], debugDescription: "Value for \"\(RootKeys.TotalsKeys.turnovers.rawValue)\" needs to be a valid Int"))
        }
        self.turnovers = turnovers
        
        // Personal fouls
        guard let pFouls = Int(try totalsContainer.decode(String.self, forKey: .pFouls)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.pFouls], debugDescription: "Value for \"\(RootKeys.TotalsKeys.pFouls.rawValue)\" needs to be a valid Int"))
        }
        self.pFouls = pFouls
        
        // Team fouls
        guard let teamFouls = Int(try totalsContainer.decode(String.self, forKey: .teamFouls)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.teamFouls], debugDescription: "Value for \"\(RootKeys.TotalsKeys.teamFouls.rawValue)\" needs to be a valid Int"))
        }
        self.teamFouls = teamFouls
        
        // MARK: Field goal stats
        guard let fgm = Int(try totalsContainer.decode(String.self, forKey: .fgm)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.fgm], debugDescription: "Value for \"\(RootKeys.TotalsKeys.fgm.rawValue)\" needs to be a valid Int"))
        }
        self.fgm = fgm
        
        guard let fga = Int(try totalsContainer.decode(String.self, forKey: .fga)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.fga], debugDescription: "Value for \"\(RootKeys.TotalsKeys.fga.rawValue)\" needs to be a valid Int"))
        }
        self.fga = fga
        
        guard let fgp = Double(try totalsContainer.decode(String.self, forKey: .fgp)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.fgp], debugDescription: "Value for \"\(RootKeys.TotalsKeys.fgp.rawValue)\" needs to be a valid Double"))
        }
        self.fgp = fgp / 100
        
        // MARK: Free throws stats
        guard let ftm = Int(try totalsContainer.decode(String.self, forKey: .ftm)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.ftm], debugDescription: "Value for \"\(RootKeys.TotalsKeys.ftm.rawValue)\" needs to be a valid Int"))
        }
        self.ftm = ftm
        
        guard let fta = Int(try totalsContainer.decode(String.self, forKey: .fta)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.fta], debugDescription: "Value for \"\(RootKeys.TotalsKeys.fta.rawValue)\" needs to be a valid Int"))
        }
        self.fta = fta
        
        guard let ftp = Double(try totalsContainer.decode(String.self, forKey: .ftp)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.ftp], debugDescription: "Value for \"\(RootKeys.TotalsKeys.ftp.rawValue)\" needs to be a valid Double"))
        }
        self.ftp = ftp / 100
        
        // MARK: Three points stats
        guard let tpm = Int(try totalsContainer.decode(String.self, forKey: .tpm)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.tpm], debugDescription: "Value for \"\(RootKeys.TotalsKeys.tpm.rawValue)\" needs to be a valid Int"))
        }
        self.tpm = tpm
        
        guard let tpa = Int(try totalsContainer.decode(String.self, forKey: .tpa)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.tpa], debugDescription: "Value for \"\(RootKeys.TotalsKeys.tpa.rawValue)\" needs to be a valid Int"))
        }
        self.tpa = tpa
        
        guard let tpp = Double(try totalsContainer.decode(String.self, forKey: .tpp)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.tpp], debugDescription: "Value for \"\(RootKeys.TotalsKeys.tpp.rawValue)\" needs to be a valid Double"))
        }
        self.tpp = tpp / 100

        // MARK: Rebounds stats
        guard let offReb = Int(try totalsContainer.decode(String.self, forKey: .offReb)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.offReb], debugDescription: "Value for \"\(RootKeys.TotalsKeys.offReb.rawValue)\" needs to be a valid Int"))
        }
        self.offReb = offReb
        
        guard let defReb = Int(try totalsContainer.decode(String.self, forKey: .defReb)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.defReb], debugDescription: "Value for \"\(RootKeys.TotalsKeys.defReb.rawValue)\" needs to be a valid Int"))
        }
        self.defReb = defReb
        
        // MARK: Advanced stats
        guard let plusMinus = Double(try totalsContainer.decode(String.self, forKey: .plusMinus)) else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.plusMinus], debugDescription: "Value for \"\(RootKeys.TotalsKeys.plusMinus.rawValue)\" needs to be a valid Double"))
        }
        self.plusMinus = plusMinus
        
        guard let shortTimeoutRemaining = Int(try totalsContainer.decode(String.self, forKey: .shortTimeoutRemaining)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.shortTimeoutRemaining], debugDescription: "Value for \"\(RootKeys.TotalsKeys.shortTimeoutRemaining.rawValue)\" needs to be a valid Int"))
        }
        self.shortTimeoutRemaining = shortTimeoutRemaining
        
        guard let fullTimeoutRemaining = Int(try totalsContainer.decode(String.self, forKey: .fullTimeoutRemaining)) else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: container.codingPath + [RootKeys.TotalsKeys.fullTimeoutRemaining], debugDescription: "Value for \"\(RootKeys.TotalsKeys.fullTimeoutRemaining.rawValue)\" needs to be a valid Int"))
        }
        self.fullTimeoutRemaining = fullTimeoutRemaining
    }
}
