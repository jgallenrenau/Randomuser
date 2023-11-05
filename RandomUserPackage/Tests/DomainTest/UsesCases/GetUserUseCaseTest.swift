//
//  GetUserUseCaseTest.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import XCTest

@testable import Domain

final class GetUsersUseCaseTest: XCTestCase {
    
    var mockRepository: MockRepository!
    var sut: GetUsersUseCase!
    
    override func setUp() {
        
        mockRepository = MockRepository()
        sut = GetUsersUseCase(repository: mockRepository)
    }
    
    override func tearDown() {
        
        mockRepository = .none
        sut = .none
        super.tearDown()
    }

    func test_should_get_users() {
        
        // given
        let users = [
            User(gender: "male",
                 name: Name(title: "Mr", first: "Jordi", last: "Renau"),
                 location: Location(street: Street(number: 220,
                                                       name: "Concell de cent"),
                                      city: "Barcelona",
                                      state: "Catalunya",
                                      country: "Spain",
                                      coordinates: Coordinates(latitude: "-30.5565", longitude: "-131.7762")),
                 email: "jordigr.bcn@gmail.com",
                 login: Login(uuid: "ab92b927-e804-422a-9b2d-ecaa01c28be4",
                              username: "blackswan919"),
                 phone: "900-715-692",
                 picture: Picture(large: "https://randomuser.me/api/portraits/men/66.jpg",
                                  thumbnail: "https://randomuser.me/api/portraits/thumb/men/66.jpg"),
                 nat: "ES"),
            User(gender: "female",
                 name: Name(title: "Ms", first: "Clara", last: "Guillamon"),
                 location: Location(street: Street(number: 220,
                                                       name: "Concell de cent"),
                                      city: "Barcelona",
                                      state: "Catalunya",
                                      country: "Spain",
                                      coordinates: Coordinates(latitude: "-30.5565", longitude: "-131.7762")),
                 email: "jordigr.bcn@gmail.com",
                 login: Login(uuid: "ab92b927-e804-422a-9b2d-ecaa01c28be4",
                              username: "blackswan919"),
                 phone: "900-715-692",
                 picture: Picture(large: "https://randomuser.me/api/portraits/men/66.jpg",
                                  thumbnail: "https://randomuser.me/api/portraits/thumb/men/66.jpg"),
                 nat: "ES")

        ]
        let params = GetUsersUseCaseParams(page: 1)
        mockRepository.getUsers.result = .success(users)

        // when
        let captor = CompletionResultCaptor<[User]>(testCase: self)
        sut.execute(params: params, completion: captor.capture())
        let result =  captor.waitAndGet()

        // THEN
        XCTAssertNil(captor.error())
        XCTAssertNotNil(result)
        XCTAssertTrue(mockRepository.getUsers.called)
        XCTAssertEqual(result?.count, users.count)
    }
}
