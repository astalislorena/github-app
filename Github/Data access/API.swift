//
//  API.swift
//  Github
//
//  Created by Lorena Astalis on 11.02.2022.
//

import Foundation
import OctoKit
import RequestKit
import Alamofire
import Down

struct API {
    static let baseUrl = "https://api.github.com/"
    
    // Lorena's Token: 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
    static func registerUser(token: String, _ callback: @escaping (Response<User>) -> Void) {
        let config = TokenConfiguration(token, url: baseUrl)
        Octokit(config).me() { response in
            callback(response)
        }
    }
    
    static func getRepositories( _ callback: @escaping (Response<[Repository]>) -> Void) {
        guard let token = Session.instance.authToken else {
            return
        }
        let config = TokenConfiguration(token, url: baseUrl)
        Octokit(config).repositories() { response in
            callback(response)
        }
    }
    
    func getRepositoryByName(name repositoryName: String, _ callback: @escaping (Response<Repository>) -> Void) {
        guard let owner = Session.instance.user?.name else {
            return
        }
        Octokit().repository(owner: owner, name: repositoryName) { response in
          callback(response)
        }
    }
    
    static func getStarredRepositories(name: String, _ callback: @escaping (Response<[Repository]>) -> Void) {
        Octokit().stars(name: name) { response in
          callback(response)
        }
    }
    
    static func getReadMe(repository: Repository,  _ callback: @escaping (Response<NSAttributedString?>) -> Void) {
        guard let  name = repository.fullName else {
            return
        }
        let path = "https://raw.githubusercontent.com/\(name)/master/README.md"
        AF.request(path, method: .get).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {
                    return
                }
                print(data)
            case .failure:
                print("failed")
            }
            if response.response?.statusCode == 200 {
                debugPrint(response)
                let downMdStr = Down(markdownString: response.response?.description ?? "")
                let attributedStr = try? downMdStr.toAttributedString()
                callback(.success(attributedStr))
            } else {
                callback(.failure(NSError()))
            }

        }
    }
    
}
