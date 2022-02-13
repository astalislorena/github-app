//
//  CoordinatorView.swift
//  Github
//
//  Created by Lorena Astalis on 12.02.2022.
//

import SwiftUI
import NavigationStack
import OctoKit

struct CoordinatorView: View {
    var navigationViewModel: NavigationStack = NavigationStack()
    
    var body: some View {
        NavigationStackView(navigationStack: navigationViewModel) {
            TokenInput.ContentView(viewModel: TokenInput.ViewModel(onFinishedInteraction: {
                handleRepositoriesList()
            }))
        }.onAppear {
            if Session.instance.isValidSession {
                handleRepositoriesList()
            }
        }
    }
    
    func handleRepositoriesList() {
        navigationViewModel.push(RepositoriesList.ContentView(viewModel: RepositoriesList.ViewModel(onRepository: { repository in
            handleRepositoryDetails(repository: repository)
        })), withId: "listView")
    }
    
    func handleRepositoryDetails(repository: Repository) {
        navigationViewModel.push(RepositoryDetails.ContentView(viewModel: RepositoryDetails.ViewModel(repository: repository, onFinishedInteraction: {
            navigationViewModel.pop()
        })), withId: "detailsView")
    }
}
