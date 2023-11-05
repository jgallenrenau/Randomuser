//
//  UsersView.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 31/10/23.
//

import SwiftUI
import Domain

struct UsersView: View {
    
    @ObservedObject var store: UsersViewModel
    
    var onLoaded: () -> Void = {}

    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search User", text: $store.searchQuery)
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
                            .stroke(Color.gray, lineWidth: 2)
                    ).padding()
                }
                .padding()
                
                if store.searchQuery != "" {
                    
                    Text("Results finded".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                }
                
                if let fetchedUsers = store.fetchedUsers {
                    
                    if fetchedUsers.isEmpty {
                        
                        Text("No results Founded")
                            .foregroundColor(.gray)
                            .font(.body)
                            .padding(.top, 24)
                        
                        Image("noResults")
                            .foregroundColor(.gray)
                            .padding(.top, 12)
                    }
                    else {
                        
                        ForEach(fetchedUsers.indices, id: \.self) { i in
                            
                            let user: User = (store.fetchedUsers?[i])!
                            
                            UserCellView(user: user)
                        }
                    }
                }
                else {
                    
                    if store.searchQuery != "" {
                        
                        ProgressView()
                            .padding(.top, 24)
                    }
                }
                
                Text("All Users".uppercased())
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.top, 32)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 24)], spacing: 40) {
                    
                    ForEach(store.users.indices, id: \.self) { i in
                        
                        let user: User = store.users[i]
                        
                        NavigationLink(destination: UsersFeatureAssembly.detailUsers(user)) {
                            
                            VStack {
                                
                                UserCellView(user: user)
                            }
                        }
                    }
                }.onAppear {
                    
                    onLoaded()
                }
            }
            .navigationTitle("Random User")
        }
        .navigationViewStyle(.stack)
    }
}

struct UsersView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        UsersView(store: .init())
    }
}
