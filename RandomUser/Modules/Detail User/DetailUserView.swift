//
//  DetailUserView.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import SwiftUI
import MapKit
import Domain

struct DetailUserView: View {
    
    let user: User!
        
    var onLoaded: () -> Void = {}
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                VStack {
                    
                    Text(user.login.username)
                        .font(.title)
                        .padding(.top, 5)
                    
                    Text(user.name.title + " " + user.name.first + " " + user.name.last)
                        .font(.headline)
                        .padding(.top, 5)
                    
                    Text("\(user.gender)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    Text("\(user.nat)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    AsyncImage(url: URL(string: user.picture.large))
                        .scaledToFill()
                        .clipShape(Circle())
                    
                    Text("\(user.location.street.name) - \(user.location.street.number)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    Text("\(user.location.city) - \(user.location.state)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    Text("\(user.location.country)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
                .padding(20)
            }
            .navigationTitle("User Detail")
        }
    }
}

struct DetailUserView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DetailUserView(user: nil)
    }
}
