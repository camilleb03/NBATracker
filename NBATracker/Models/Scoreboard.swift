//
//  Scoreboard.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-15.
//

import Foundation

struct ScoreboardRawResponse {
    
    let scoreboards: [Scoreboard]
}

extension ScoreboardRawResponse: Decodable {
    
    private enum RootKeys: String, CodingKey {
        
        case games = "games"
        
    }
    
    init(from decoder: Decoder) throws {
        
        // Root level
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        // Games level
        let games = try container.decode([Scoreboard].self, forKey: .games)
        self.scoreboards = games
    }
}

struct Scoreboard: Identifiable {
    
    let id: String
    let gameUrlCode: String
    let startTimeUTC: String
    let currentPeriod: Int
    let clock: String
    let visitorTeam: SBTeam
    let homeTeam: SBTeam
    var gameStatus: GameStatus
    
    var startTimeDate: Date {
        return Date(gameDateString: startTimeUTC)
    }
    
    var periodNames: [String] {
        var periodNames: [String] = ["Q1", "Q2", "Q3", "Q4"]
        if currentPeriod > 4 && homeTeam.linescore.count > 4 && visitorTeam.linescore.count > 4 {
            for i in 5..<(currentPeriod + 1) {
                periodNames.append("OT\(i-4)")
            }
        }
        return periodNames
    }
    
    public func getGameInfoString() -> String {
        switch gameStatus {
            case .isNotStarted:
                return startTimeDate.convertDateToLocalTimeShortString()
            case .isPlaying:
                return "Q\(currentPeriod) | \(clock)"
            case .isHalftime:
                return "HALF"
            case .isEndOfPeriod:
                return "END OF Q\(currentPeriod)"
            case .isFinished:
                return "FINAL"
            case .undefined:
                return "UNDEFINED"
        }
    }
}

extension Scoreboard: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "gameId"
        case gameUrlCode, statusNum, startTimeUTC, period, clock
        case visitorTeam = "vTeam"
        case homeTeam = "hTeam"
        
        enum PeriodKeys: String, CodingKey {
            case currentPeriod = "current"
            case isHalftime = "isHalftime"
            case isEndOfPeriod = "isEndOfPeriod"
        }
    }
    
    init(from decoder: Decoder) throws {
        
        // Root level
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.gameUrlCode = try container.decode(String.self, forKey: .gameUrlCode)
        
        self.startTimeUTC = try container.decode(String.self, forKey: .startTimeUTC)
        self.clock = try container.decode(String.self, forKey: .clock)
                
        self.visitorTeam = try container.decode(SBTeam.self, forKey: .visitorTeam)
        self.homeTeam = try container.decode(SBTeam.self, forKey: .homeTeam)
        
        let statusNum = try container.decode(Int.self, forKey: .statusNum)
        
        
        // Period level
        let periodContainer = try container.nestedContainer(keyedBy: CodingKeys.PeriodKeys.self, forKey: .period)
        self.currentPeriod = try periodContainer.decode(Int.self, forKey: .currentPeriod)
        let isHalftime = try periodContainer.decode(Bool.self, forKey: .isHalftime)
        let isEndOfPeriod = try periodContainer.decode(Bool.self, forKey: .isEndOfPeriod)
        
        // Set gameStatus
        self.gameStatus = GameStatus.undefined
        self.gameStatus = GameStatus.setGameStatus(statusNum: statusNum, isHalftime: isHalftime, isEndOfPeriod: isEndOfPeriod)
    }
}

enum GameStatus {
    case isNotStarted
    case isPlaying
    case isHalftime
    case isEndOfPeriod
    case isFinished
    case undefined
    
    static func setGameStatus(statusNum: Int, isHalftime: Bool, isEndOfPeriod: Bool) -> Self {
        
        if statusNum == 1 {
            // Game not started
            return .isNotStarted
            
        } else if statusNum == 2 {
            if isHalftime {
                // Game is in halftime
                return .isHalftime
            }
            if isEndOfPeriod {
                // Game is in the end of a period
                return .isEndOfPeriod
            }
            // Game is ongoing
            return .isPlaying
            
        } else if statusNum == 3 {
            // Game is over
            return .isFinished
        }
        // Not supposed to happen
        return .undefined
    }
}

struct Arena: Decodable {
    
    let name: String
    let city: String
    let stateAbbr: String
    let country: String
    
}

struct SBTeam {
    
    let teamId: String
    let triCode: String
    let win: String
    let loss: String
    let score: String
    let linescore: [String]
    
}

extension SBTeam: Decodable {
    
    private enum RootKeys: String, CodingKey {
        
        case teamId, triCode, win, loss, score, linescore
    }
    
    private struct Linescore: Decodable {
        let score: String
        
        private enum ScoreKeys: String, CodingKey {
            case score
        }
    }
    
    init(from decoder: Decoder) throws {
        // Root level
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.triCode = try container.decode(String.self, forKey: .triCode)
        self.win = try container.decode(String.self, forKey: .win)
        self.loss = try container.decode(String.self, forKey: .loss)
        self.score = try container.decode(String.self, forKey: .score)
        let linescoreObject = try container.decode([Linescore].self, forKey: .linescore)
        self.linescore = linescoreObject.isEmpty ? ["", "", "", ""] : linescoreObject.compactMap({ $0.score })
    }
}
