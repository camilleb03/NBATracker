//
//  Endpoint.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-13.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    
    var NBAv1URL: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "data.nba.net"
        components.path = "/10s/prod/v1" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }

        return url
    }
    
    var NBAv2URL: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "data.nba.net"
        components.path = "/10s/prod/v2" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }

        return url
    }
    
    var logoURL: URL {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "cdn.nba.net"
        components.path = "/assets/logos/teams/primary/web" + path

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }

        return url
    }
    
    var headshotURL: URL {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "cdn.nba.com"
        components.path = "/headshots/nba/latest/260x190" + path

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }

        return url
    }
}

extension Endpoint {
    
    static var today: Self {
        Endpoint(path: "/today.json")
    }
    
    static var confStandings: Self {
        Endpoint(path: "/current/standings_conference.json")
    }

    static func scoreboard(for date: String) -> Self {
        Endpoint(path: "/\(date)/scoreboard.json")
    }

    static func teams(for seasonYear: String) -> Self {
        Endpoint(path: "/\(seasonYear)/teams.json")
    }
    
    static func players(for seasonYear: String) -> Self {
        Endpoint(path: "/\(seasonYear)/players.json")
    }
    
    static func logo(for teamTriCode: String) -> Self {
        Endpoint(path: "/\(teamTriCode).png")
    }
    
    static func headshot(for personId: String) -> Self {
        Endpoint(path: "/\(personId).png")
    }
    
    static func playerProfile(for seasonYear: String, by personID: String) -> Self {
        Endpoint(path: "/\(seasonYear)/players/\(personID)_profile.json")
    }
}
