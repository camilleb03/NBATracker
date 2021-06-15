//
//  Team.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-13.
//

import Foundation

// JSON Data
/*
 URL:
 http://data.nba.net/10s/prod/v2/2020/teams.json

 Response:
 {
     "_internal": {
         "pubDateTime": "2020-11-17 10:30:16.813 EST",
         "igorPath": "cron,1605627010823,1605627010823|router,1605627010823,1605627010828|domUpdater,1605627011040,1605627016242|feedProducer,1605627016447,1605627017092",
         "xslt": "NBA/xsl/league/roster/marty_teams_list.xsl",
         "xsltForceRecompile": "true",
         "xsltInCache": "true",
         "xsltCompileTimeMillis": "335",
         "xsltTransformTimeMillis": "238",
         "consolidatedDomKey": "prod__transform__marty_teams_list__1929228391129",
         "endToEndTimeMillis": "6269"
     },
     "league": {
         "standard": [
             {
                 "isNBAFranchise": true,
                 "isAllStar": false,
                 "city": "Atlanta",
                 "altCityName": "Atlanta",
                 "fullName": "Atlanta Hawks",
                 "tricode": "ATL",
                 "teamId": "1610612737",
                 "nickname": "Hawks",
                 "urlName": "hawks",
                 "teamShortName": "Atlanta",
                 "confName": "East",
                 "divName": "Southeast"
             },
             {
                 "isNBAFranchise": true,
                 "isAllStar": false,
                 "city": "Washington",
                 "altCityName": "Washington",
                 "fullName": "Washington Wizards",
                 "tricode": "WAS",
                 "teamId": "1610612764",
                 "nickname": "Wizards",
                 "urlName": "wizards",
                 "teamShortName": "Washington",
                 "confName": "East",
                 "divName": "Southeast"
             }
         ],
         "africa": [],
         "sacramento": [],
         "vegas": [],
         "utah": []
     }
}
*/

struct TeamRawResponse {
    
    let teams: [Team]
}

extension TeamRawResponse: Decodable {
    
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
        let standard = try leagueContainer.decode([Team].self, forKey: .standard)
        self.teams = standard
    }
}

struct Team: Identifiable {
    
    let id: String
    let name: String
    let city: String
    let tricode: String
    let urlName: String
    let conferenceName: String
    let divisionName: String
    
    var fullName: String {
        return "\(city) \(name)"
    }
}

extension Team: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "teamId"
        case name = "nickname"
        case city, tricode, urlName
        case conferenceName = "confName"
        case divisionName = "divName"
    }
}
