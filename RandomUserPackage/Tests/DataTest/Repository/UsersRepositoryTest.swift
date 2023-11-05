//
//  UsersRepositoryTest.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import XCTest
@testable import Domain
@testable import Data

final class UsersRepositoryTest: XCTestCase {
    
    var mockApiManager: MockApiManager!
    var sut: RepositoryImpl!
    
    override func setUp() {
        
        mockApiManager = MockApiManager()
        sut = RepositoryImpl(apiManager: mockApiManager)
    }
    
    override func tearDown() {
        
        mockApiManager = .none
        sut = .none
        super.tearDown()
    }
    
    func test_should_get_users_from_api() {
        
        let users = [
            UserTO(gender: "male",
                   name: NameTO(title: "Mr", 
                                first: "Jordi",
                                last: "Renau"),
                   location: LocationTO(street: StreetTO(number: 220,
                                                         name: "Concell de cent"), 
                                        city: "Barcelona",
                                        state: "Catalunya",
                                        country: "Spain",
                                        coordinates: CoordinatesTO(latitude: "-30.5565",
                                                                   longitude: "-131.7762"),
                                        timezone: TimezoneTO(offset: "+3:30", 
                                                             description: "Tehran")),
                   email: "jordigr.bcn@gmail.com",
                   login: LoginTO(uuid: "ab92b927-e804-422a-9b2d-ecaa01c28be4",
                                  username: "blackswan919",
                                  password: "popcorn",
                                  salt: "5HdpiiNu",
                                  md5: "267cff364480336ea3a414fb4c41a668",
                                  sha1:  "14bb96bc9dfe1243abd3ddacd93d3eef22aca780",
                                  sha256: "13ab6d1f759d0868a95b76aa36873440a12d55736fa9c9ee855a3d04935f6219"),
                   dob: DobTO(date: "1987-09-15T11:06:00.334Z", 
                              age: 36),
                   registered: RegisteredTO(date: "2015-06-30T18:14:14.718Z", 
                                            age: 8),
                   phone: "900-715-692",
                   cell: "697-199-535",
                   id: IdTO(name: "DNI", value: "15276628-N"),
                   picture: PictureTO(large: "https://randomuser.me/api/portraits/men/66.jpg",
                                      medium: "https://randomuser.me/api/portraits/med/men/66.jpg",
                                      thumbnail: "https://randomuser.me/api/portraits/thumb/men/66.jpg"),
                   nat: "ES"),
            UserTO(gender: "female",
                   name: NameTO(title: "Ms", 
                                first: "Clara",
                                last: "Guillamon"),
                   location: LocationTO(street: StreetTO(number: 220,
                                                         name: "Concell de cent"),
                                        city: "Barcelona",
                                        state: "Catalunya",
                                        country: "Spain",
                                        coordinates: CoordinatesTO(latitude: "-30.5565", 
                                                                   longitude: "-131.7762"),
                                        timezone: TimezoneTO(offset: "+3:30", 
                                                             description: "Tehran")),
                   email: "jordigr.bcn@gmail.com",
                   login: LoginTO(uuid: "ab92b927-e804-422a-9b2d-ecaa01c28be4",
                                  username: "blackswan919",
                                  password: "popcorn",
                                  salt: "5HdpiiNu",
                                  md5: "267cff364480336ea3a414fb4c41a668",
                                  sha1:  "14bb96bc9dfe1243abd3ddacd93d3eef22aca780",
                                  sha256: "13ab6d1f759d0868a95b76aa36873440a12d55736fa9c9ee855a3d04935f6219"),
                   dob: DobTO(date: "1987-09-15T11:06:00.334Z", 
                              age: 36),
                   registered: RegisteredTO(date: "2015-06-30T18:14:14.718Z", 
                                            age: 8),
                   phone: "900-715-692",
                   cell: "697-199-535",
                   id: IdTO(name: "DNI", 
                            value: "15276628-N"),
                   picture: PictureTO(large: "https://randomuser.me/api/portraits/men/66.jpg",
                                      medium: "https://randomuser.me/api/portraits/med/men/66.jpg",
                                      thumbnail: "https://randomuser.me/api/portraits/thumb/men/66.jpg"),
                   nat: "ES")
        ]
        
        let userResult = UserResultTO.init(results: users)
        
        // given
        mockApiManager.getUsers.result = .success(userResult)
        
        // when
        let captor = CompletionResultCaptor<[User]>(testCase: self)
        sut.getUsers(page: 1, completion: captor.capture())
        let result =  captor.waitAndGet()
        
        // then
        XCTAssertNil(captor.error())
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.count, users.count)
    
    }
}
