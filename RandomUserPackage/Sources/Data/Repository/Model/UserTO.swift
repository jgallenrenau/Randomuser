//
//  UserTO.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

public struct UserTO: Decodable, Encodable {
    
    var gender: String
    var name: NameTO
    var location: LocationTO
    var email: String
    var login: LoginTO
    var dob: DobTO
    var registered: RegisteredTO
    var phone: String
    var cell: String
    var id: IdTO
    var picture: PictureTO
    var nat: String
}

public struct NameTO: Codable {
    
    var title: String
    var first: String
    var last: String
}

public struct LocationTO: Codable {
    
    var street: StreetTO
    var city: String
    var state: String
    var country: String
    var postcode: Int
    var coordinates: CoordinatesTO
    var timezone: TimezoneTO
}

public struct StreetTO: Codable {
    
    var number: Int
    var name: String
}

public struct CoordinatesTO: Codable {
    
    var latitude: String
    var longitude: String
}

public struct TimezoneTO: Codable {
    
    var offset: String
    var description: String
}

public struct LoginTO: Codable {
    
    var uuid: String
    var username: String
    var password: String
    var salt: String
    var md5: String
    var sha1: String
    var sha256: String
}

public struct DobTO: Codable {
    
    var date: String
    var age: Int
}

public struct RegisteredTO: Codable {
    
    var date: String
    var age: Int
}

public struct IdTO: Codable {
    
    var name: String
    var value: String
}

public struct PictureTO: Codable {
    
    var large: String
    var medium: String
    var thumbnail: String
}
