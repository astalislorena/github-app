//
//  RepositoriesListView.swift
//  Github
//
//  Created by Lorena Astalis on 12.02.2022.
//

import SwiftUI

struct RepositoriesList { }

extension RepositoriesList {
    
    struct ContentView: View {
        @ObservedObject var viewModel: ViewModel
        
        var body: some View {
            VStack {
                header
                list
            }
            .background(Color.midnight.edgesIgnoringSafeArea(.all))
            .onAppear {
                viewModel.getRepositories()
            }
        }
        
        var list: some View {
            ScrollView {
                ForEach(0..<viewModel.repositories.count, id: \.self) { index in
                    ItemView(repository: viewModel.repositories[index])
                        .onTapGesture {
                            viewModel.tapOnRepository(repository: viewModel.repositories[index])
                        }
                }
            }
        }
        
        var header: some View {
            HStack {
                Text("Your Repository List")
                    .font(.body.bold())
                    .foregroundColor(.lavander)
                    .frame(maxWidth: .infinity, alignment: .center)
            }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        }
    }
}
