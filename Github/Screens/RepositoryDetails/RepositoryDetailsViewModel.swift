//
//  RepositoryDetailsViewModel.swift
//  Github
//
//  Created by Lorena Astalis on 12.02.2022.
//

import Foundation
import UIKit
import OctoKit

extension RepositoryDetails {
    class ViewModel: ObservableObject {
        @Published var readMe: NSAttributedString = NSAttributedString()
        let repository: Repository
        let onFinishedInteraction: () -> Void
        
        init(repository: Repository, onFinishedInteraction: @escaping () -> Void) {
            self.repository = repository
            self.onFinishedInteraction = onFinishedInteraction
        }
        
        func onBackAction() {
            DispatchQueue.main.async {
                self.onFinishedInteraction()
            }
        }
        
        func onCopyLink() {
            UIPasteboard.general.string = repository.gitURL
        }
        
        func getReadMe() {
            API.getReadMe(repository: repository) { response in
                switch response {
                case .success(let readMe):
                    DispatchQueue.main.async {
                        self.readMe = readMe ?? NSAttributedString()
                    }
                case .failure:
                    break
                }
            }
        }
    }
}
