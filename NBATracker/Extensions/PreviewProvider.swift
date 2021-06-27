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
    
    let boxscore = Boxscore(timesTied: "6", leadChanges: "7", visitorTeam: StatsTeam(fastBreakPoints: "7", pointsInPaint: "26", biggestLead: "6", secondChancePoints: "7", pointsOffTurnovers: "11", longestRun: "7", totals: Totals(points: "53", fgm: "21", fga: "52", fgp: "40.4", ftm: "6", fta: "7", ftp: "85.7", tpm: "5", tpa: "19", tpp: "26.3", offReb: "5", defReb: "19", totReb: "24", assists: "17", pFouls: "11", steals: "2", turnovers: "6", blocks: "3", plusMinus: "-5", min: "141:00", shortTimeoutRemaining: "0", fullTimeoutRemaining: "5", teamFouls: "11"), statsLeaders: StatsLeaders(points: GameStat(value: "12", players: [BasePlayer(personId: "1629028", firstName: "Deandre", lastName: "Ayton")]), rebounds: GameStat(value: "6", players: [BasePlayer(personId: "1629028", firstName: "Deandre", lastName: "Ayton")]), assists: GameStat(value: "9", players: [BasePlayer(personId: "101108", firstName: "Chris", lastName: "Paul")]))), homeTeam: StatsTeam(fastBreakPoints: "6", pointsInPaint: "26", biggestLead: "8", secondChancePoints: "10", pointsOffTurnovers: "7", longestRun: "8", totals: Totals(points: "58", fgm: "21", fga: "50", fgp: "42.0", ftm: "13", fta: "17", ftp: "76.5", tpm: "3", tpa: "18", tpp: "16.7", offReb: "8", defReb: "23", totReb: "31", assists: "9", pFouls: "8", steals: "5", turnovers: "5", blocks: "3", plusMinus: "5", min: "141:00", shortTimeoutRemaining: "0", fullTimeoutRemaining: "4", teamFouls: "7"), statsLeaders: StatsLeaders(points: GameStat(value: "15", players: [BasePlayer(personId: "202331", firstName: "Paul", lastName: "George")]), rebounds: GameStat(value: "12", players: [BasePlayer(personId: "1627826", firstName: "Ivica", lastName: "Zubac")]), assists: GameStat(value: "3", players: [BasePlayer(personId: "202331", firstName: "Paul", lastName: "George")]))), activePlayers: [ActivePlayer(personID: "1628969", playerCode: "mikal_bridges", firstName: "Mikal", lastName: "Bridges", jersey: "25", position: "SF", teamID: "1610612756", isOnCourt: true, minutes: "18:03", points: "10", assists: "2", totalRebound: "4", fgm: "4", fga: "6", fgp: "66.7", ftm: "1", fta: "1", ftp: "100", tpm: "1", tpa: "3", tpp: "33.3", pFouls: "2", steals: "0", turnovers: "0", blocks: "0", plusMinus: "-1"), ActivePlayer(personID: "203109", playerCode: "jae_crowder", firstName: "Jae", lastName: "Crowder", jersey: "99", position: "PF", teamID: "1610612756", isOnCourt: true, minutes: "18:13", points: "6", assists: "0", totalRebound: "4", fgm: "2", fga: "6", fgp: "33.3", ftm: "0", fta: "0", ftp: "0.0", tpm: "2", tpa: "5", tpp: "40.0", pFouls: "3", steals: "0", turnovers: "1", blocks: "0", plusMinus: "-7"), ActivePlayer(personID: "1629028", playerCode: "deandre_ayton", firstName: "Deandre", lastName: "Ayton", jersey: "22", position: "C", teamID: "1610612756", isOnCourt: true, minutes: "22:10", points: "12", assists: "0", totalRebound: "6", fgm: "6", fga: "8", fgp: "75.0", ftm: "0", fta: "1", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "2", steals: "0", turnovers: "0", blocks: "2", plusMinus: "-15"), ActivePlayer(personID: "1626164", playerCode: "devin_booker", firstName: "Devin", lastName: "Booker", jersey: "1", position: "SG", teamID: "1610612756", isOnCourt: true, minutes: "24:06", points: "7", assists: "4", totalRebound: "2", fgm: "2", fga: "10", fgp: "20.0", ftm: "2", fta: "2", ftp: "100", tpm: "1", tpa: "4", tpp: "25.0", pFouls: "2", steals: "0", turnovers: "3", blocks: "0", plusMinus: "-11"), ActivePlayer(personID: "101108", playerCode: "chris_paul", firstName: "Chris", lastName: "Paul", jersey: "3", position: "PG", teamID: "1610612756", isOnCourt: true, minutes: "24:04", points: "7", assists: "9", totalRebound: "0", fgm: "2", fga: "11", fgp: "18.2", ftm: "3", fta: "3", ftp: "100", tpm: "0", tpa: "3", tpp: "0.0", pFouls: "1", steals: "2", turnovers: "1", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "1629661", playerCode: "cameron_johnson", firstName: "Cameron", lastName: "Johnson", jersey: "23", position: "", teamID: "1610612756", isOnCourt: false, minutes: "15:09", points: "7", assists: "1", totalRebound: "4", fgm: "3", fga: "5", fgp: "60.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "1", tpa: "3", tpp: "33.3", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "1626166", playerCode: "cameron_payne", firstName: "Cameron", lastName: "Payne", jersey: "15", position: "", teamID: "1610612756", isOnCourt: false, minutes: "4:19", points: "2", assists: "1", totalRebound: "0", fgm: "1", fga: "4", fgp: "25.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "1", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "-5"), ActivePlayer(personID: "1628470", playerCode: "torrey_craig", firstName: "Torrey", lastName: "Craig", jersey: "12", position: "", teamID: "1610612756", isOnCourt: false, minutes: "9:37", points: "2", assists: "0", totalRebound: "1", fgm: "1", fga: "2", fgp: "50.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "1", blocks: "1", plusMinus: "4"), ActivePlayer(personID: "203967", playerCode: "dario_saric", firstName: "Dario", lastName: "Saric", jersey: "20", position: "", teamID: "1610612756", isOnCourt: false, minutes: "6:13", points: "0", assists: "0", totalRebound: "3", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "1", steals: "0", turnovers: "0", blocks: "0", plusMinus: "10"), ActivePlayer(personID: "1630234", playerCode: "ty-shon_alexander", firstName: "Ty-Shon", lastName: "Alexander", jersey: "0", position: "", teamID: "1610612756", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "1628975", playerCode: "jevon_carter", firstName: "Jevon", lastName: "Carter", jersey: "4", position: "", teamID: "1610612756", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "204038", playerCode: "langston_galloway", firstName: "Langston", lastName: "Galloway", jersey: "2", position: "", teamID: "1610612756", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "1626163", playerCode: "frank_kaminsky", firstName: "Frank", lastName: "Kaminsky", jersey: "8", position: "", teamID: "1610612756", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "202734", playerCode: "e\'twaun_moore", firstName: "E\'Twaun", lastName: "Moore", jersey: "55", position: "", teamID: "1610612756", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "1630188", playerCode: "jalen_smith", firstName: "Jalen", lastName: "Smith", jersey: "10", position: "", teamID: "1610612756", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "202331", playerCode: "paul_george", firstName: "Paul", lastName: "George", jersey: "13", position: "SF", teamID: "1610612746", isOnCourt: true, minutes: "24:51", points: "15", assists: "3", totalRebound: "8", fgm: "6", fga: "15", fgp: "40.0", ftm: "2", fta: "3", ftp: "66.7", tpm: "1", tpa: "6", tpp: "16.7", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "12"), ActivePlayer(personID: "1629611", playerCode: "terance_mann", firstName: "Terance", lastName: "Mann", jersey: "14", position: "PF", teamID: "1610612746", isOnCourt: true, minutes: "19:08", points: "10", assists: "1", totalRebound: "3", fgm: "5", fga: "7", fgp: "71.4", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "1", tpp: "0.0", pFouls: "2", steals: "0", turnovers: "0", blocks: "0", plusMinus: "8"), ActivePlayer(personID: "1627826", playerCode: "ivica_zubac", firstName: "Ivica", lastName: "Zubac", jersey: "40", position: "C", teamID: "1610612746", isOnCourt: true, minutes: "20:45", points: "11", assists: "1", totalRebound: "12", fgm: "2", fga: "6", fgp: "33.3", ftm: "7", fta: "8", ftp: "87.5", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "1", turnovers: "0", blocks: "2", plusMinus: "13"), ActivePlayer(personID: "202704", playerCode: "reggie_jackson", firstName: "Reggie", lastName: "Jackson", jersey: "1", position: "SG", teamID: "1610612746", isOnCourt: true, minutes: "20:36", points: "11", assists: "2", totalRebound: "1", fgm: "4", fga: "9", fgp: "44.4", ftm: "2", fta: "4", ftp: "50.0", tpm: "1", tpa: "5", tpp: "20.0", pFouls: "3", steals: "1", turnovers: "1", blocks: "0", plusMinus: "1"), ActivePlayer(personID: "201976", playerCode: "patrick_beverley", firstName: "Patrick", lastName: "Beverley", jersey: "21", position: "PG", teamID: "1610612746", isOnCourt: true, minutes: "18:46", points: "3", assists: "1", totalRebound: "4", fgm: "1", fga: "6", fgp: "16.7", ftm: "0", fta: "0", ftp: "0.0", tpm: "1", tpa: "5", tpp: "20.0", pFouls: "1", steals: "1", turnovers: "0", blocks: "0", plusMinus: "9"), ActivePlayer(personID: "202694", playerCode: "marcus_morris", firstName: "Marcus", lastName: "Morris Sr.", jersey: "8", position: "", teamID: "1610612746", isOnCourt: false, minutes: "10:32", points: "2", assists: "1", totalRebound: "3", fgm: "0", fga: "2", fgp: "0.0", ftm: "2", fta: "2", ftp: "100", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "1", steals: "0", turnovers: "1", blocks: "0", plusMinus: "-5"), ActivePlayer(personID: "1628379", playerCode: "luke_kennard", firstName: "Luke", lastName: "Kennard", jersey: "5", position: "", teamID: "1610612746", isOnCourt: false, minutes: "11:13", points: "2", assists: "0", totalRebound: "0", fgm: "1", fga: "1", fgp: "100", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "1"), ActivePlayer(personID: "200765", playerCode: "rajon_rondo", firstName: "Rajon", lastName: "Rondo", jersey: "4", position: "", teamID: "1610612746", isOnCourt: false, minutes: "7:38", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "1", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "1", turnovers: "3", blocks: "0", plusMinus: "-8"), ActivePlayer(personID: "201587", playerCode: "nicolas_batum", firstName: "Nicolas", lastName: "Batum", jersey: "33", position: "", teamID: "1610612746", isOnCourt: false, minutes: "8:24", points: "4", assists: "0", totalRebound: "0", fgm: "2", fga: "3", fgp: "66.7", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "1", tpp: "0.0", pFouls: "1", steals: "1", turnovers: "0", blocks: "1", plusMinus: "-6"), ActivePlayer(personID: "1629599", playerCode: "amir_coffey", firstName: "Amir", lastName: "Coffey", jersey: "7", position: "", teamID: "1610612746", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "202326", playerCode: "demarcus_cousins", firstName: "DeMarcus", lastName: "Cousins", jersey: "15", position: "", teamID: "1610612746", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "1627812", playerCode: "yogi_ferrell", firstName: "Yogi", lastName: "Ferrell", jersey: "11", position: "", teamID: "1610612746", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "1630187", playerCode: "daniel_oturu", firstName: "Daniel", lastName: "Oturu", jersey: "10", position: "", teamID: "1610612746", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "202335", playerCode: "patrick_patterson", firstName: "Patrick", lastName: "Patterson", jersey: "54", position: "", teamID: "1610612746", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0"), ActivePlayer(personID: "1630206", playerCode: "jay_scrubb", firstName: "Jay", lastName: "Scrubb", jersey: "0", position: "", teamID: "1610612746", isOnCourt: false, minutes: "0:00", points: "0", assists: "0", totalRebound: "0", fgm: "0", fga: "0", fgp: "0.0", ftm: "0", fta: "0", ftp: "0.0", tpm: "0", tpa: "0", tpp: "0.0", pFouls: "0", steals: "0", turnovers: "0", blocks: "0", plusMinus: "0")])
    
    let boxscoreNil: Boxscore? = nil
}
