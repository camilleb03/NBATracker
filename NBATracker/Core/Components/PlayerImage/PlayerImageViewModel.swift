//
//  PlayerImageViewModel.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import Foundation
import SwiftUI
import Combine

class PlayerImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let playerID: String
    private let dataService: PlayerImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(playerID: String) {
        self.playerID = playerID
        self.dataService = PlayerImageService(playerID: playerID)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink(receiveCompletion: { [weak self] (_) in
                self?.isLoading = false
            }, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            })
            .store(in: &cancellables)
    }
}
