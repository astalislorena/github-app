//
//  RepositoryDetailsView.swift
//  Github
//
//  Created by Lorena Astalis on 12.02.2022.
//

import SwiftUI

struct RepositoryDetails { }

extension RepositoryDetails {
    
    struct ContentView: View {
        @ObservedObject var viewModel: ViewModel
        
        var body: some View {
            VStack {
                header
                ScrollView {
                    VStack {
                        details
                        description
                        readMe
                    }
                }
            }
            .background(Color.midnight.edgesIgnoringSafeArea(.all))
            .onAppear {
                viewModel.getReadMe()
            }
        }
        
        var backButton: some View {
            Button(action: viewModel.onBackAction) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(Color.grey)
                    .padding(24)
            }
        }
        
        var header: some View {
            HStack {
                backButton
                Spacer()
                copyUrlButton
            }.overlay {
                title
            }
        }
        
        var title: some View {
            Text(viewModel.repository.name ?? "N/A")
                .font(.headline.bold())
                .foregroundColor(Color.grey)
        }
        
        var copyUrlButton: some View {
            Button(action: viewModel.onCopyLink) {
                Image(systemName: "link")
                    .foregroundColor(Color.grey)
                    .padding(24)
            }
        }
        
        @ViewBuilder
        var description: some View {
            if let description = viewModel.repository.repositoryDescription {
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.subheadline.bold())
                        .foregroundColor(Color.grey)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 12)
                    Text(description)
                        .font(.body)
                        .foregroundColor(Color.grey)
                }
                .padding(24)
            } else {
                EmptyView()
            }
        }
        
        var stars: some View {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                    .frame(width: 24, height: 24)
                Text("\(viewModel.repository.stargazersCount ?? 0)")
                    .font(.caption)
                    .foregroundColor(Color.lavander)
            }
        }
        
        var fork: some View {
            HStack {
                Image(systemName: "tuningfork")
                    .foregroundColor(Color.denim)
                    .frame(width: 24, height: 24)
                Text("\(viewModel.repository.isFork ? "yes" : "no")")
                    .font(.caption)
                    .foregroundColor(Color.lavander)
            }
        }
        
        var details: some View {
            HStack {
                stars
                fork
                Spacer()
            }.padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        }
        
        var readMe: some View {
            Text(viewModel.readMe.description)
                .font(.body)
                .foregroundColor(.lavander)
                .padding(24)
        }

    }
}

