//
//  PreviewProvider.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-13.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() {}
    
    let activePlayer1 = Player(
        id: "1629630", firstName: "Ja",
        lastName: "Morant",
        temporaryDisplayName: "Morant, Ja",
        teamID: "1610612763",
        jersey: "12",
        isActive: true,
        pos: "G",
        heightFeet: "6",
        heightInches: "3",
        heightMeters: "1.9",
        weightPounds: "174",
        weightKilograms: "78.9",
        dateOfBirthUTC: "1999-08-10",
        teams: [
            TeamPlayed(teamID: "1610612763", seasonStart: "2019", seasonEnd: "2020")
        ],
        draft: Draft(teamID: "1610612763", pickNum: "2", roundNum: "1", seasonYear: "2019"),
        nbaDebutYear: "2019",
        yearsPro: "1",
        collegeName: "Murray State",
        lastAffiliation: "Murray State/USA",
        country: "USA"
    )
    
    let activePlayer2 = Player(
        id: "1628449",
        firstName: "Chris",
        lastName: "Boucher",
        temporaryDisplayName: "Boucher, Chris",
        teamID: "1610612761",
        jersey: "25",
        isActive: true,
        pos: "F-C",
        heightFeet: "6",
        heightInches: "9",
        heightMeters: "2.06",
        weightPounds: "200",
        weightKilograms: "90.7",
        dateOfBirthUTC: "1993-01-11",
        teams: [
            TeamPlayed(teamID: "1610612744", seasonStart: "2017", seasonEnd: "2017"),
            TeamPlayed(teamID: "1610612761", seasonStart: "2018", seasonEnd: "2020")
        ],
        draft: Draft(teamID: "", pickNum: "", roundNum: "", seasonYear: ""),
        nbaDebutYear: "2017",
        yearsPro: "3",
        collegeName: "Oregon",
        lastAffiliation: "Oregon/Saint Lucia",
        country: "Saint Lucia"
    )
    
    let inactivePlayer1 = Player(
        id: "1627775",
        firstName: "Patrick",
        lastName: "McCaw",
        temporaryDisplayName: nil,
        teamID: "",
        jersey: "22",
        isActive: false,
        pos: "",
        heightFeet: "-",
        heightInches: "-",
        heightMeters: "",
        weightPounds: "",
        weightKilograms: "",
        dateOfBirthUTC: "1995-10-25",
        teams: [],
        draft: Draft(teamID: "1610612744", pickNum: "38", roundNum: "2", seasonYear: "2016"),
        nbaDebutYear: "2016",
        yearsPro: "",
        collegeName: "UNLV",
        lastAffiliation: "UNLV/USA",
        country: "USA"
    )
    
    let team1 = Team(id: "1610612763",
                     name: "Grizzlies",
                     city: "Memphis",
                     tricode: "MEM",
                     urlName: "grizzlies",
                     conferenceName: "West",
                     divisionName: "Southwest")
    
    let team2 = Team(id: "1610612761",
                     name: "Raptors",
                     city: "Toronto",
                     tricode: "TOR",
                     urlName: "raptors",
                     conferenceName: "East",
                     divisionName: "Atlantic")
    
    private let iso8601FullFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    
    let scoreboardNotStarted = Scoreboard(id: "0042000225",
                                 gameUrlCode: "20210616/LACUTA",
                                 startTimeUTC: "2021-06-16T23:30:00.000Z",
                                 currentPeriod: 0,
                                 clock: "",
                                 visitorTeam: Scoreboard.SBTeam(teamId: "1610612746", triCode: "LAC", win: "47", loss: "25", score: ""),
                                 homeTeam: Scoreboard.SBTeam(teamId: "1610612762", triCode: "UTA", win: "52", loss: "20", score: ""),
                                 gameStatus: .isNotStarted)
    
    let scoreboardIsPlaying = Scoreboard(id: "0042000203",
                                 gameUrlCode: "20210611/PHIATL",
                                 // 2021-06-11 23:30:00 GMT
                                 startTimeUTC: "2021-06-11T23:30:00.000Z",
                                 currentPeriod: 4,
                                 clock: "3:23",
                                 visitorTeam: Scoreboard.SBTeam(teamId: "1610612755", triCode: "PHI", win: "49", loss: "23", score: "115"),
                                 homeTeam: Scoreboard.SBTeam(teamId: "1610612737", triCode: "ATL", win: "41", loss: "31", score: "100"),
                                 gameStatus: .isPlaying)
    
    let scoreboardIsHalftime = Scoreboard(id: "0022000983",
                                 gameUrlCode: "20210504/PHXCLE",
                                 startTimeUTC: "2021-06-11T23:30:00.000Z",
                                 currentPeriod: 2,
                                 clock: "",
                                 visitorTeam: Scoreboard.SBTeam(teamId: "1610612756", triCode: "PHX", win: "46", loss: "18", score: "59"),
                                 homeTeam: Scoreboard.SBTeam(teamId: "1610612739", triCode: "CLE", win: "21", loss: "43", score: "53"),
                                 gameStatus: .isHalftime)
    
    let scoreboardIsEndOfPeriod = Scoreboard(id: "0022000985",
                                 gameUrlCode: "20210504/BKNMIL",
                                 startTimeUTC: "2021-05-04T23:00:00.000Z",
                                 currentPeriod: 1,
                                 clock: "",
                                 visitorTeam: Scoreboard.SBTeam(teamId: "1610612751", triCode: "BKN", win: "43", loss: "22", score: "33"),
                                 homeTeam: Scoreboard.SBTeam(teamId: "1610612749", triCode: "MIL", win: "40", loss: "24", score: "34"),
                                 gameStatus: .isEndOfPeriod)
    
    let scoreboardIsFinished = Scoreboard(id: "0042000204",
                                 gameUrlCode: "20210614/PHIATL",
                                 startTimeUTC: "2021-06-14T23:30:00.000Z",
                                 currentPeriod: 4,
                                 clock: "",
                                 visitorTeam: Scoreboard.SBTeam(teamId: "1610612755", triCode: "PHI", win: "49", loss: "23", score: "100"),
                                 homeTeam: Scoreboard.SBTeam(teamId: "1610612737", triCode: "ATL", win: "41", loss: "31", score: "103"),
                                 gameStatus: .isFinished)
}
