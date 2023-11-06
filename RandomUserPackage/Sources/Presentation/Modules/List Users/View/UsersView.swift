//
//  UsersView.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 31/10/23.
//

import SwiftUI
import Domain

struct UsersView: View {
    
    @ObservedObject var viewModel: UsersViewModel
    
    var onLoaded: () -> Void = {}

    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search User", text: $viewModel.searchQuery)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray, lineWidth: 3)
                    ).padding()
                }
                .padding()
                
                if viewModel.searchQuery != "" {
                    
                    Text("Results finded".uppercased())
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                }
                
                if let fetchedUsers = viewModel.fetchedUsers {
                    
                    if fetchedUsers.isEmpty {
                        
                        Text("No results Founded....")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                            .padding(.top, 24)
                        
                        Image("noResults")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                    }
                    else {
                        
                        ForEach(fetchedUsers.indices, id: \.self) { i in
                            
                            let user: User = (viewModel.fetchedUsers?[i])!
                            
                            UserCellView(user: user)
                        }
                    }
                }
                else {
                    
                    if viewModel.searchQuery != "" {
                        
                        ProgressView()
                            .padding(.top, 24)
                    }
                }
                
                Text("All Users".uppercased())
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                
                VStack(spacing: 15) {
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 24)], spacing: 40) {
                        
                        ForEach(viewModel.users.indices, id: \.self) { i in
                            
                            let user: User = viewModel.users[i]
                            
                            NavigationLink(destination: UsersFeatureAssembly.detailUsers(user)) {
                                
                                VStack {
                                    
                                    UserCellView(user: user)
                                }
                            }
                        }
                    }
                    
                    if viewModel.offset == viewModel.users.count {
                        
                        ProgressView()
                            .padding(.vertical)
                            .onAppear(perform: {
                                
                                onLoaded()
                            })
                    }
                    else {
                        
                        GeometryReader { reader -> Color in
                            
                            let minY = reader.frame(in: .global).minY
                            let height = UIScreen.main.bounds.height / 1.3
                            
                            if !viewModel.users.isEmpty && minY < height {
                                                                
                                DispatchQueue.main.async {
                                    
                                    viewModel.offset += viewModel.users.count
                                    onLoaded()
                                }
                            }
                            
                            return Color.clear
                        }
                        .frame(width: 20, height: 20)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Random User")
        }
        .navigationViewStyle(.stack)
    }
}
