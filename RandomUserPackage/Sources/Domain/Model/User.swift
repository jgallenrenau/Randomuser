//
//  User.swift
//  
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

public struct UserResult: Codable {
    
    public var result: [User]
    
    public init(result: [User]) {
        self.result = result
    }
}

public struct User: Codable {
    
    public var gender: String
    public var name: Name
    public var location: Location
    public var email: String
    public var login: Login
    public var phone: String
    public var picture: Picture
    public var nat: String

    public init(gender: String,
                name: Name,
                location: Location,
                email: String,
                login: Login,
                phone: String,
                picture: Picture,
                nat: String) {
        
        self.gender = gender
        self.name = name
        self.location = location
        self.email = email
        self.login = login
        self.phone = phone
        self.picture = picture
        self.nat = nat
    }
}

public struct Name: Codable {
    
    public var title: String
    public var first: String
    public var last: String

    public init(title: String,
                first: String,
                last: String) {
        
        self.title = title
        self.first = first
        self.last = last
    }
}

public struct Location: Codable {
    
    public var street: Street
    public var city: String
    public var state: String
    public var country: String
    public var coordinates: Coordinates

    public init(street: Street,
                city: String,
                state: String,
                country: String,
                coordinates: Coordinates
    ) {
        
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.coordinates = coordinates
    }
}

public struct Street: Codable {
    
    public var number: Int
    public var name: String
    
    public init(number: Int,
                name: String) {
        
        self.number = number
        self.name = name
    }
}

public struct Coordinates: Codable {
    
    public var latitude: String
    public var longitude: String
    
    public init(latitude: String,
                longitude: String) {
        
        self.latitude = latitude
        self.longitude = longitude
    }
}

public struct Login: Codable {
    
    public var uuid: String
    public var username: String

    public init(uuid: String,
                username: String) {
        
        self.uuid = uuid
        self.username = username
    }
}

public struct Picture: Codable {
    
    public var large: String
    public var thumbnail: String
    
    public init(large: String,
                thumbnail: String) {
        
        self.large = large
        self.thumbnail = thumbnail
    }
}
