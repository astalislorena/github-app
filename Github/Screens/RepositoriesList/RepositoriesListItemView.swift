//
//  RepositoryListItemView.swift
//  Github
//
//  Created by Lorena Astalis on 12.02.2022.
//

import SwiftUI
import OctoKit
import Kingfisher

extension RepositoriesList {

    struct ItemView: View {
        let repository: Repository
        
        var body: some View {
            VStack(alignment: .leading) {
                name
                lastPush
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.lavander))
            .overlay(alignment: .topTrailing) {
                owner
            }.padding(.horizontal, 24)
        }
        
        var name: some View {
            Text(repository.name ?? "N/A")
                .font(.title)
                .foregroundColor(Color.midnight)
                .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                
        }
        
        var owner: some View {
            KFImage(URL(string: repository.owner.avatarURL ?? ""))
                .resizable()
                .frame(width: 24, height: 24)
                .clipShape(Circle())
                .padding(8)
        }
        
        var lastPush: some View {
            Text("Last push: \(repository.lastPush?.description ?? "N/A")")
                .font(.caption)
                .foregroundColor(.darkGrey)
                .padding(EdgeInsets(top: 0, leading: 12, bottom: 12, trailing: 12))
        }
    }
}
