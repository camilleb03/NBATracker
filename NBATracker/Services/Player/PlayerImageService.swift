//
//  PlayerImageService.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import Foundation
import SwiftUI
import Combine

class PlayerImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let playerID: String
    private let fileManager = LocalFileManager.instance
    private let folderName = "player_images"
    private let imageName: String
    
    init(playerID: String) {
        self.playerID = playerID
        self.imageName = playerID
        getPlayerImage()
    }
    
    private func getPlayerImage() {
        if let savedImage = fileManager.getImage(imageName: self.imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager")
        } else {
            downloadPlayerImage()
            print("Downloading image now")
        }
    }
    
    private func downloadPlayerImage() {
        let url = Endpoint.headshot(for: playerID).headshotURL
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
