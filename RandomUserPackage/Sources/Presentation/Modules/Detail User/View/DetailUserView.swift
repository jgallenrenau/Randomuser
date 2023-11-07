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
    
    init(user: User) {
        self.user = user
    }
        
    var onLoaded: () -> Void = {}
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Info User".uppercased())) {
                
                Text(user.name.title + " " + user.name.first + " " + user.name.last + " (\(user.login.username)) ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 6)
                
                Text("\(user.gender)".uppercased())
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.top, 6)
                
                AsyncImage(url: URL(string: user.picture.large))
                    .scaledToFill()
                    .clipShape(Circle())
                
                Text("\(user.location.street.name) - \(user.location.street.number)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 6)
                
                Text("\(user.location.city) - \(user.location.state) (\(user.location.country))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 6)
                
                Link(user.phone, destination: URL(string: "tel:\(user.phone)")!)
                    .font(.system(size: 16))
                    .padding(.top, 2)
                
                Link(user.email, destination: URL(string: "mailto:\(user.email)")!)
                    .font(.system(size: 16))
                    .padding(.top, 2)
                
            }
        }
        Image("delete")
            .scaledToFill()
            .foregroundColor(.gray)
            .clipShape(Circle())
            .padding(.top, 10)

        .navigationTitle("User Detail")
    }
}

struct DetailUserView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DetailUserView(user: User(gender: "", 
                                  name: Name(title: "", 
                                             first: "",
                                             last: ""),
                                  location: Location(street: Street(number: 0, name: ""),
                                                     city: "",
                                                     state: "",
                                                     country: "",
                                                     coordinates: Coordinates(latitude: "", longitude: "")),
                                  email: "",
                                  login: Login(uuid: "", username: ""),
                                  phone: "", picture: Picture(large: "", thumbnail: ""),
                                  nat: ""))
    }
}
