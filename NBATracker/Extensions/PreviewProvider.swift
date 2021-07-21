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
        isActive: true,
        teamID: "1610612763",
        jersey: "12",
        pos: "G",
        dateOfBirthUTC: "1999-08-10",
        heightMeters: 1.9, weightKilograms: 78.9,
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
        firstName: "Chris", lastName: "Boucher",
        isActive: true,
        teamID: "1610612761",
        jersey: "25",
        pos: "F-C",
        dateOfBirthUTC: "1993-01-11",
        heightMeters: 2.06, weightKilograms: 90.7,
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
        id: "202236",
        firstName: "DeMarcus",
        lastName: "Cousins",
        isActive: false,
        teamID: nil,
        jersey: "99",
        pos: nil,
        dateOfBirthUTC: nil,
        heightMeters: nil, weightKilograms: nil,
        teams: nil,
        draft: nil,
        nbaDebutYear: nil,
        yearsPro: nil,
        collegeName: nil,
        lastAffiliation: nil,
        country: nil
    )
    
    let inactivePlayer2 = Player(
        id: "1627775",
        firstName: "Patrick",
        lastName: "McCaw",
        isActive: false,
        teamID: nil,
        jersey: "22",
        pos: nil,
        dateOfBirthUTC: "1995-10-25",
        heightMeters: nil, weightKilograms: nil,
        teams: nil,
        draft: Draft(teamID: "1610612744", pickNum: "38", roundNum: "2", seasonYear: "2016"),
        nbaDebutYear: "2016",
        yearsPro: nil,
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
    
    let scoreboardNotStarted = Scoreboard(id: "0042000225",
                                          gameUrlCode: "20210616/LACUTA",
                                          startTimeUTC: "2021-06-16T23:30:00.000Z",
                                          currentPeriod: 0,
                                          clock: "",
                                          visitorTeam: SBTeam(teamId: "1610612746", triCode: "LAC", win: "47", loss: "25", score: "", linescore: ["", "", "", ""]),
                                          homeTeam: SBTeam(teamId: "1610612762", triCode: "UTA", win: "52", loss: "20", score: "", linescore: ["-", "-", "-", "-"]),
                                          arenaInfo: Arena(name: "State Farm Arena", city: "Atlanta", stateAbbr: "GA", country: "USA"),
                                          gameStatus: .isNotStarted)
    
    let scoreboardIsPlaying = Scoreboard(id: "0042000203",
                                         gameUrlCode: "20210611/PHIATL",
                                         startTimeUTC: "2021-06-11T23:30:00.000Z",
                                         currentPeriod: 4,
                                         clock: "3:23",
                                         visitorTeam: SBTeam(teamId: "1610612755", triCode: "PHI", win: "49", loss: "23", score: "115", linescore: ["28", "33", "34", "20"]),
                                         homeTeam: SBTeam(teamId: "1610612737", triCode: "ATL", win: "41", loss: "31", score: "100", linescore: ["20", "36", "19", "25"]),
                                         arenaInfo: Arena(name: "Fiserv Forum", city: "Milwaukee", stateAbbr: "WI", country: "USA"),
                                         gameStatus: .isPlaying)
    
    let scoreboardIsHalftime = Scoreboard(id: "0022000983",
                                          gameUrlCode: "20210504/PHXCLE",
                                          startTimeUTC: "2021-06-11T23:30:00.000Z",
                                          currentPeriod: 2,
                                          clock: "",
                                          visitorTeam: SBTeam(teamId: "1610612756", triCode: "PHX", win: "46", loss: "18", score: "59", linescore: ["30", "29", "0", "0"]),
                                          homeTeam: SBTeam(teamId: "1610612739", triCode: "CLE", win: "21", loss: "43", score: "53", linescore: ["24", "29", "0", "0"]),
                                          arenaInfo: Arena(name: "ScotiaBank Arena", city: "Toronto", stateAbbr: "ON", country: "Canada"),
                                          gameStatus: .isHalftime)
    
    let scoreboardIsEndOfPeriod = Scoreboard(id: "0022000985",
                                             gameUrlCode: "20210504/BKNMIL",
                                             startTimeUTC: "2021-05-04T23:00:00.000Z",
                                             currentPeriod: 1,
                                             clock: "",
                                             visitorTeam: SBTeam(teamId: "1610612751", triCode: "BKN", win: "43", loss: "22", score: "33", linescore: ["33", "0", "0", "0"]),
                                             homeTeam: SBTeam(teamId: "1610612749", triCode: "MIL", win: "40", loss: "24", score: "34", linescore: ["34", "0", "0", "0"]), arenaInfo: Arena(name: "ScotiaBank Arena", city: "Toronto", stateAbbr: "ON", country: "Canada"),
                                             gameStatus: .isEndOfPeriod)
    
    let scoreboardIsFinished = Scoreboard(id: "0042000204",
                                          gameUrlCode: "20210614/PHIATL",
                                          startTimeUTC: "2021-06-14T23:30:00.000Z",
                                          currentPeriod: 4,
                                          clock: "",
                                          visitorTeam: SBTeam(teamId: "1610612755", triCode: "PHI", win: "49", loss: "23", score: "100", linescore: ["28", "34", "20", "18"]),
                                          homeTeam: SBTeam(teamId: "1610612737", triCode: "ATL", win: "41", loss: "31", score: "103", linescore: ["20", "29", "31", "23"]), arenaInfo: Arena(name: "State Farm Arena", city: "Atlanta", stateAbbr: "GA", country: "USA"),
                                          gameStatus: .isFinished)
    
    let allTeamGeneralStats1 = [
        GameStatistic<(Int, Int)>(title: "Assists", value: (13, 16)),
        GameStatistic<(Int, Int)>(title: "Total Rebounds", value: (51, 59)),
        GameStatistic<(Int, Int)>(title: "Offensive Rebounds", value: (15, 17)),
        GameStatistic<(Int, Int)>(title: "Steals", value: (4, 4)),
        GameStatistic<(Int, Int)>(title: "Blocks", value: (2, 8)),
        GameStatistic<(Int, Int)>(title: "Turnovers", value: (10, 14))]
    
    let allTeamShootingStats1 = [
        GameStatistic<(home: (made: Int, attempted: Int, percentage: Double), visitor: (made: Int, attempted: Int, percentage: Double))>(
            title: "Field Goals",
            value: (
                home: (made: 39, attempted: 84, percentage: 0.46399999999999997),
                visitor: (made: 45, attempted: 88, percentage: 0.511)
            )),
        GameStatistic<(home: (made: Int, attempted: Int, percentage: Double), visitor: (made: Int, attempted: Int, percentage: Double))>(
            title: "Three Points",
            value: (
                home: (made: 15, attempted: 37, percentage: 0.405),
                visitor: (made: 11, attempted: 29, percentage: 0.379)
            )),
        GameStatistic<(home: (made: Int, attempted: Int, percentage: Double), visitor: (made: Int, attempted: Int, percentage: Double))>(
            title: "Free Throws",
            value: (
                home: (made: 9, attempted: 16, percentage: 0.562),
                visitor: (made: 12, attempted: 21, percentage: 0.5710000000000001)
            ))
    ]
    
    let allTeamLeadersStats1 = [
        GameStatistic<(home: StatLeader, visitor: StatLeader)>(
            title: "Points",
            value: (
                home: StatLeader(
                    number: 35,
                    player: Optional(BasePlayer(personId: "1629027", firstName: "Trae", lastName: "Young"))),
                visitor: StatLeader(
                    number: 38,
                    player: Optional(BasePlayer(personId: "203114", firstName: "Khris", lastName: "Middleton")))
            )),
        GameStatistic<(home: StatLeader, visitor: StatLeader)>(
            title: "Assists",
            value: (
                home: StatLeader(
                    number: 7,
                    player: Optional(BasePlayer(personId: "1628989", firstName: "Kevin", lastName: "Huerter"))),
                visitor: StatLeader(
                    number: 12,
                    player: Optional(BasePlayer(personId: "201950", firstName: "Jrue", lastName: "Holiday")))
            )),
        GameStatistic<(home: StatLeader, visitor: StatLeader)>(
            title: "Rebounds",
            value: (
                home: StatLeader(
                    number: 11,
                    player: Optional(BasePlayer(personId: "203991", firstName: "Clint", lastName: "Capela"))),
                visitor: StatLeader(
                    number: 8,
                    player: Optional(BasePlayer(personId: "203507", firstName: "Giannis", lastName: "Antetokounmpo")))
            ))
    ]
    
    let allTeamLeadersStatsEmpty = [
        GameStatistic<(home: StatLeader, visitor: StatLeader)>(
            title: "Points",
            value: (
                home: StatLeader(
                    number: 0,
                    player: nil),
                visitor: StatLeader(
                    number: 0,
                    player: nil)
            )),
        GameStatistic<(home: StatLeader, visitor: StatLeader)>(
            title: "Assists",
            value: (
                home: StatLeader(
                    number: 0,
                    player: nil),
                visitor: StatLeader(
                    number: 0,
                    player: nil)
            )),
        GameStatistic<(home: StatLeader, visitor: StatLeader)>(
            title: "Rebounds",
            value: (
                home: StatLeader(
                    number: 0,
                    player: nil),
                visitor: StatLeader(
                    number: 0,
                    player: nil)
            ))
    ]
    
    let westTeamStandingInfoFirst = TeamStandingInfo(id: "1610612762", teamTriCode: "UTA", teamName: "Jazz", teamCity: "Utah", wins: 52, losses: 20, winPercentage: 0.722, gamesBehind: 0.0, lastTen: "7-3", streak: "W2", clinchedPlayoffs: true)
    
    let eastTeamStandingInfoLast = TeamStandingInfo(id: "1610612765", teamTriCode: "DET", teamName: "Pistons", teamCity: "Detroit", wins: 20, losses: 52, winPercentage: 0.278, gamesBehind: 29.0, lastTen: "1-9", streak: "L5", clinchedPlayoffs: false)
}
