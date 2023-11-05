//
//  MoyaFactory.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import Domain

public struct UserMapper: Mapper {
    
    static public func mapName(input: NameTO) -> Name {
        
        Name(title: input.title, first: input.first, last: input.last)
    }
    
    static public func mapLocation(input: LocationTO) -> Location {
        
        Location(street: mapStreet(input: input.street),
                 city: input.city,
                 state: input.state,
                 country: input.country,
                 coordinates: mapCoordinates(input: input.coordinates)
        )
    }
    
    static public func mapStreet(input: StreetTO) -> Street {
        
        Street(number: input.number,
               name: input.name)
    }
    
    static public func mapCoordinates(input: CoordinatesTO) -> Coordinates {
        
        Coordinates(latitude: input.latitude,
                    longitude: input.longitude)
    }
    
    static public func mapLogin(input: LoginTO) -> Login {
        
        Login(uuid: input.uuid,
              username: input.username)
    }
    
    static public func mapPicture(input: PictureTO) -> Picture {
        
        Picture(large: input.large, thumbnail: input.thumbnail)
    }
    
    static public func mapUser(input: [UserTO]) -> [User] {
        
        return input.map { userTO -> User in
            
            User(gender: userTO.gender,
                 name: mapName(input: userTO.name),
                 location: mapLocation(input: userTO.location),
                 email: userTO.email,
                 login: mapLogin(input: userTO.login),
                 phone: userTO.phone,
                 picture: mapPicture(input: userTO.picture),
                 nat: userTO.nat)
        }
    }
    
    static public func map(input: UserResultTO) -> UserResult {
        
        UserResult(result: mapUser(input: input.results))
    }
}
