//
//  UsersView.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 31/10/23.
//

import SwiftUI
import Domain

struct UsersView: View {
    
    @ObservedObject var store: UsersViewStore
    
    var onLoaded: () -> Void = {}

    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                if store.searchQuery != "" {
                    
                    Text("Results finded".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                }
                
                VStack(spacing: 16) {
                    
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search User", text: $store.searchQuery)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding(.vertical,12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                    
                }
                .padding()
                
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
                            
                            UserRowView(user: user)
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

                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 40) {
                    
                    ForEach(store.users.indices, id: \.self) { i in
                        
                        let user: User = store.users[i]
                        
                        NavigationLink(destination: UsersFeatureAssembly.detailUsers(user)) {
                            
                            VStack {
                                
                                UserRowView(user: user)
                        
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

struct UserRowView: View {
    
    var user: User
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 40) {
            
            NavigationLink(destination: UsersFeatureAssembly.detailUsers(user)) {
                
                VStack {

                    AsyncImage(url: URL(string: user.picture.large))
                        .scaledToFill()
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                    
                    Text(user.login.username)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.horizontal, 12)
                    
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text(user.phone)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        UsersView(store: .init())
    }
}
