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
}
