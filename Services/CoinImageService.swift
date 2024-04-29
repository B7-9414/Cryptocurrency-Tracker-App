//
//  CoinImageService.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/29/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = LocalFileManager.shared
    private let folderName = "coin_images"
    private var imageName: String {
        coin.id
    }
    
    init(coin: Coin) {
        self.coin = coin
        getCoinImage()
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkManager.download(from: url)
            .tryMap { data -> UIImage? in
                UIImage(data: data)
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion) { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, withName: self.imageName, in: self.folderName)
            }
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(withName: imageName, from: folderName) {
            image = savedImage
        } else {
            // Check if the folder exists, if not, create it
            let localFileManager = LocalFileManager.shared
            localFileManager.createFolderIfNeeded(withName: folderName)
            downloadCoinImage()
        }
    }
}
