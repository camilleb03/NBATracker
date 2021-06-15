//
//  PlayerListViewModel.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import Foundation
import Combine

class PlayerListViewModel: ObservableObject {
    
    @Published var allPlayers: [Player] = []
    
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    
    private let playerDataService = PlayerDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updatesAllCoins
        $searchText
            .combineLatest(playerDataService.$allPlayers)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedPlayers) in
                self?.allPlayers = returnedPlayers
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, players: [Player]) -> [Player] {
        guard !text.isEmpty else {
            return players
        }
        let lowerCasedText = text.lowercased()
        return players.filter { (player) -> Bool in
            return player.firstName.lowercased().contains(lowerCasedText) ||
                player.lastName.lowercased().contains(lowerCasedText)
        }
    }
    
    func reloadData() {
        isLoading = true
        playerDataService.getPlayers()
    }
}
