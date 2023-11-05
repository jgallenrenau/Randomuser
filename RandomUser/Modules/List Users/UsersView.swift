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
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 40) {
                    
                    ForEach(store.users.indices, id: \.self) { i in
                        
                        let user: User = store.users[i]
                        
                        NavigationLink(destination: UsersFeatureAssembly.detailUsers(user)) {
                            
                            VStack {

                                AsyncImage(url: URL(string: user.picture.large))
                                    .scaledToFill()
                                    .foregroundColor(.gray)
                                    .clipShape(Circle())
                                
                                Text(user.login.username)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 10)
                                
                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)

                                Text(user.phone)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
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
