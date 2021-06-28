//
//  TeamImageViewModel.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import Foundation
import SwiftUI
import Combine

class TeamImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let teamTricode: String
    private let logoType: LogoType
    private let dataService: TeamImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(teamTricode: String, logoType: LogoType) {
        self.teamTricode = teamTricode
        self.logoType = logoType
        self.dataService = TeamImageService(teamTricode: teamTricode, logoType: logoType)
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
