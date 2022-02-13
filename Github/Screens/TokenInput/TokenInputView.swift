//
//  TokenInput.swift
//  Github
//
//  Created by Lorena Astalis on 11.02.2022.
//

import SwiftUI
import Introspect

struct TokenInput { }

extension TokenInput {
    struct ContentView: View {
        @ObservedObject var viewModel: ViewModel
        
        var body: some View {
            VStack(alignment: .leading) {
                image
                title
                textField
                ctaButton
                Spacer()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .background(Color.midnight.edgesIgnoringSafeArea(.all))
        }
        
        var image: some View {
            Image("github_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .padding(24)
        }
        
        var title: some View {
            Text("Github app")
                .font(.largeTitle.bold())
                .foregroundColor(Color.grey)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
        }
        
        var textField: some View {
            VStack(alignment: .leading) {
                Text("Personal Access Token")
                    .font(.caption)
                    .foregroundColor(Color.lavander)
                TextField("", text: $viewModel.token)
                    .foregroundColor(Color.lavander)
                    .padding(.vertical, 8)
                    .accentColor(Color.lavander)
                    .frame(maxWidth: .infinity)
                    .introspectTextField { textView in
                        textView.becomeFirstResponder()
                    }
                Color.lavander.opacity(viewModel.token == "" ? 0.5 : 1).frame(height: 2)
            }.padding(EdgeInsets(top: 80, leading: 24, bottom: 0, trailing: 24))
        }
        
        var ctaButton: some View {
            Button(action: viewModel.loginUser) {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.lavander)
                    .frame(maxWidth: .infinity, minHeight: 56, idealHeight: 56, maxHeight: 56)
                    .overlay {
                        Text("Verify Token")
                            .font(.body.bold())
                            .foregroundColor(Color.denim)
                    }
            }.padding(EdgeInsets(top: 48, leading: 24, bottom: 0, trailing: 24))
        }
    }
}

struct TokenInputView_Previews: PreviewProvider {
    static var previews: some View {
        TokenInput.ContentView(viewModel: TokenInput.ViewModel(onFinishedInteraction: {}))
    }
}

