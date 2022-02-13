//
//  TokenInputViewModel.swift
//  Github
//
//  Created by Lorena Astalis on 12.02.2022.
//

import Foundation
import SwiftMessages
import NavigationStack

extension TokenInput {
    class ViewModel: ObservableObject {
        @Published var token: String = ""
        @Published var isLoading: Bool = false
        var onFinishedInteraction: () -> Void
        
        init(onFinishedInteraction: @escaping () -> Void) {
            self.onFinishedInteraction = onFinishedInteraction
        }
        
        func loginUser() {
            isLoading = true
            API.registerUser(token: self.token) { response in
                switch response {
                case .success:
                    Session.instance.authToken = self.token
                    self.onFinishedInteraction()
                case .failure:
                    break
                }
            }
        }
    }
}
