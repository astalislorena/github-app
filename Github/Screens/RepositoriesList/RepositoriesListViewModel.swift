//
//  RepositoriesListViewModel.swift
//  Github
//
//  Created by Lorena Astalis on 12.02.2022.
//

import Foundation
import OctoKit


extension RepositoriesList {
    class ViewModel: ObservableObject {
        @Published var repositories: [Repository] = []
        var onRepository: (Repository) -> Void
        
        init(onRepository: @escaping (Repository) -> Void) {
            self.onRepository = onRepository
        }
        
        func getRepositories() {
            API.getRepositories { response in
                switch response {
                case .success(let repositories):
                    DispatchQueue.main.async {
                        self.repositories = repositories
                    }
                case .failure:
                    break
                }
            }
        }
        
        func tapOnRepository(repository: Repository) {
            DispatchQueue.main.async {
                self.onRepository(repository)
            }
        }
    }
}
