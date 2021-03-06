//
//  Player.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-13.
//

import Foundation

// JSON Data
/*
 URL:
 http://data.nba.net/10s/prod/v2/2020/players.json

 Response:
 {
     "_internal": {
         "pubDateTime": "2021-06-13 23:10:22.138 EDT",
         "igorPath": "S3,1623640203891,1623640213209|router,1623640213209,1623640213213|domUpdater,1623640213962,1623640220640|feedProducer,1623640220742,1623640227153",
         "xslt": "NBA/xsl/league/roster/marty_active_players2.xsl",
         "xsltForceRecompile": "true",
         "xsltInCache": "false",
         "xsltCompileTimeMillis": "353",
         "xsltTransformTimeMillis": "5299",
         "consolidatedDomKey": "prod__transform__marty_active_players2__1473268060531",
         "endToEndTimeMillis": "23262"
     },
     "league": {
         "standard": [
             {
                 "firstName": "Devin",
                 "lastName": "Booker",
                 "temporaryDisplayName": "Booker, Devin",
                 "personId": "1626164",
                 "teamId": "1610612756",
                 "jersey": "1",
                 "isActive": true,
                 "pos": "G",
                 "heightFeet": "6",
                 "heightInches": "5",
                 "heightMeters": "1.96",
                 "weightPounds": "206",
                 "weightKilograms": "93.4",
                 "dateOfBirthUTC": "1996-10-30",
                 "teams": [
                     {
                         "teamId": "1610612756",
                         "seasonStart": "2015",
                         "seasonEnd": "2020"
                     }
                 ],
                 "draft": {
                     "teamId": "1610612756",
                     "pickNum": "13",
                     "roundNum": "1",
                     "seasonYear": "2015"
                 },
                 "nbaDebutYear": "2015",
                 "yearsPro": "5",
                 "collegeName": "Kentucky",
                 "lastAffiliation": "Kentucky/USA",
                 "country": "USA"
             },
             {
                 "firstName": "Chris",
                 "lastName": "Boucher",
                 "temporaryDisplayName": "Boucher, Chris",
                 "personId": "1628449",
                 "teamId": "1610612761",
                 "jersey": "25",
                 "isActive": true,
                 "pos": "F-C",
                 "heightFeet": "6",
                 "heightInches": "9",
                 "heightMeters": "2.06",
                 "weightPounds": "200",
                 "weightKilograms": "90.7",
                 "dateOfBirthUTC": "1993-01-11",
                 "teams": [
                     {
                         "teamId": "1610612744",
                         "seasonStart": "2017",
                         "seasonEnd": "2017"
                     },
                     {
                         "teamId": "1610612761",
                         "seasonStart": "2018",
                         "seasonEnd": "2020"
                     }
                 ],
                 "draft": {
                 "teamId": "",
                 "pickNum": "",
                 "roundNum": "",
                 "seasonYear": ""
                 },
                 "nbaDebutYear": "2017",
                 "yearsPro": "3",
                 "collegeName": "Oregon",
                 "lastAffiliation": "Oregon/Saint Lucia",
                 "country": "Saint Lucia"
             },
             {
                 "firstName": "Patrick",
                 "lastName": "McCaw",
                 "personId": "1627775",
                 "isallStar": false,
                 "teamId": "",
                 "jersey": "22",
                 "isActive": false,
                 "pos": "",
                 "heightFeet": "-",
                 "heightInches": "-",
                 "heightMeters": "",
                 "weightPounds": "",
                 "weightKilograms": "",
                 "dateOfBirthUTC": "1995-10-25",
                 "teams": [],
                 "draft": {
                     "teamId": "1610612744",
                     "pickNum": "38",
                     "roundNum": "2",
                     "seasonYear": "2016"
                 },
                 "nbaDebutYear": "2016",
                 "yearsPro": "",
                 "collegeName": "UNLV",
                 "lastAffiliation": "UNLV/USA",
                 "country": "USA"
             },
         ]
     }
 }
*/

struct PlayerRawResponse {
    
    let players: [Player]
}

extension PlayerRawResponse: Decodable {
    
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
        let standard = try leagueContainer.decode([Player].self, forKey: .standard)
        self.players = standard
    }
}

struct Player: Identifiable {
    let id: String
    let firstName, lastName: String
    let isActive: Bool
    let teamID, jersey, pos, dateOfBirthUTC: String?
    let heightMeters, weightKilograms: Double?
    let teams: [TeamPlayed]?
    let draft: Draft?
    let nbaDebutYear, yearsPro, collegeName, lastAffiliation: String?
    let country: String?
}

extension Player: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "personId"
        case teamID = "teamId"
        case firstName, lastName, isActive
        case jersey, pos, heightMeters, weightKilograms, dateOfBirthUTC, teams, draft, nbaDebutYear, yearsPro, collegeName, lastAffiliation, country
    }
    
    init(from decoder: Decoder) throws {
        // Root level
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        
        let teamID = try container.decode(String.self, forKey: .teamID)
        self.teamID = teamID.isEmpty ? nil : teamID
        
        let jersey = try container.decode(String.self, forKey: .jersey)
        self.jersey = jersey.isEmpty ? nil : jersey
        
        let pos = try container.decode(String.self, forKey: .pos)
        self.pos = pos.isEmpty ? nil : pos
        
        let dateOfBirthUTC = try container.decode(String.self, forKey: .dateOfBirthUTC)
        self.dateOfBirthUTC = dateOfBirthUTC.isEmpty ? nil : dateOfBirthUTC
        
        let heightMetersString = try container.decode(String.self, forKey: .heightMeters)
        if heightMetersString.isEmpty {
            self.heightMeters = nil
        } else {
            guard let heightMeters = Double(heightMetersString) else {
                throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [CodingKeys.heightMeters], debugDescription: "Value for \"\(CodingKeys.heightMeters.rawValue)\" needs to be a valid Double"))
            }
            self.heightMeters = heightMeters
        }
        
        let weightKilogramsString = try container.decode(String.self, forKey: .weightKilograms)
        if heightMetersString.isEmpty {
            self.weightKilograms = nil
        } else {
            guard let weightKilograms = Double(weightKilogramsString) else {
                throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath + [CodingKeys.weightKilograms], debugDescription: "Value for \"\(CodingKeys.weightKilograms.rawValue)\" needs to be a valid Double"))
            }
            self.weightKilograms = weightKilograms
        }
        
        let teams = try container.decode([TeamPlayed].self, forKey: .teams)
        self.teams = teams.isEmpty ? nil : teams
        
        let draft = try container.decode(Draft.self, forKey: .draft)
        self.draft = draft.teamID.isEmpty ? nil : draft
        
        let nbaDebutYear = try container.decode(String.self, forKey: .nbaDebutYear)
        self.nbaDebutYear = nbaDebutYear.isEmpty ? nil : nbaDebutYear
        
        let yearsPro = try container.decode(String.self, forKey: .yearsPro)
        self.yearsPro = yearsPro.isEmpty ? nil : yearsPro
        
        let collegeName = try container.decode(String.self, forKey: .collegeName)
        self.collegeName = collegeName.isEmpty ? nil : collegeName
        
        let lastAffiliation = try container.decode(String.self, forKey: .lastAffiliation)
        self.lastAffiliation = lastAffiliation.isEmpty ? nil : lastAffiliation
        
        let country = try container.decode(String.self, forKey: .country)
        self.country = country.isEmpty ? nil : country
    }
}

struct Draft: Decodable {
    let teamID, pickNum, roundNum, seasonYear: String

    enum CodingKeys: String, CodingKey {
        case teamID = "teamId"
        case pickNum, roundNum, seasonYear
    }
}

struct TeamPlayed: Decodable {
    let teamID, seasonStart, seasonEnd: String

    enum CodingKeys: String, CodingKey {
        case teamID = "teamId"
        case seasonStart, seasonEnd
    }
}
