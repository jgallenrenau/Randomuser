//
//  UserCellView.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 5/11/23.
//

import SwiftUI
import Domain

struct UserCellView: View {
    
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
