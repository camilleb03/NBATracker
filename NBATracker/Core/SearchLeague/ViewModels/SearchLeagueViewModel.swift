//
//  SearchLeagueViewModel.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import Foundation
import Combine

class SearchLeagueViewModel: ObservableObject {
    
    @Published var allPlayers: [Player] = []
    @Published var allTeams: [Team] = []
    
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    
    private let playerDataService = PlayerDataService()
    private let teamDataService = TeamDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates allPlayers and allTeams
        $searchText
            .combineLatest(playerDataService.$allPlayers, teamDataService.$allTeams)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterPlayersAndTeams)
            .sink { [weak self] (returnedArrays) in
                self?.allPlayers = returnedArrays.filteredPlayers
                self?.allTeams = returnedArrays.filteredTeams
            }
            .store(in: &cancellables)
    }
    
    private func filterPlayersAndTeams(text: String, players: [Player], teams: [Team] ) -> (filteredPlayers: [Player], filteredTeams: [Team]) {
        
        guard !text.isEmpty else {
            return (players, teams)
        }
        
        let lowerCasedText = text.lowercased()
        
        let filteredPlayers = players.filter { (player) -> Bool in
            return player.firstName.lowercased().contains(lowerCasedText) ||
                player.lastName.lowercased().contains(lowerCasedText)
        }
        let filteredTeams = teams.filter { (team) -> Bool in
            return team.name.lowercased().contains(lowerCasedText) ||
                team.city.lowercased().contains(lowerCasedText)
        }
        return (filteredPlayers, filteredTeams)
    }
    
    func reloadData() {
        isLoading = true
        playerDataService.getPlayers()
    }
}
