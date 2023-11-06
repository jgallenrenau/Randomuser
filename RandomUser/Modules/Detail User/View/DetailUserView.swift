//
//  DetailUserView.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import SwiftUI
import MapKit
import Domain
import CoreTelephony

struct DetailUserView: View {
    
    let user: User!
        
    var onLoaded: () -> Void = {}
    let callController = CTCallCenter()
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                VStack {
                    
                    Text(user.login.username)
                        .font(.title)
                        .padding(.top, 6)
                    
                    Text(user.name.title + " " + user.name.first + " " + user.name.last)
                        .font(.headline)
                        .padding(.top, 6)
                    
                    Text("\(user.gender)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 6)
                    
                    Text("\(user.nat)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 6)
                    
                    AsyncImage(url: URL(string: user.picture.large))
                        .scaledToFill()
                        .clipShape(Circle())
                    
                    Text("\(user.location.street.name) - \(user.location.street.number)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 6)
                    
                    Text("\(user.location.city) - \(user.location.state)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 6)
                    
                    Text("\(user.location.country)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 6)
                    
                    Link(user.phone, destination: URL(string: "tel:\(user.phone)")!)
                        .font(.system(size: 14))
                        .padding(.top, 2)

                    Link(user.email, destination: URL(string: "mailto:\(user.email)")!)
                        .font(.system(size: 12))
                        .padding(.top, 2)
                }
                .padding(24)
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
