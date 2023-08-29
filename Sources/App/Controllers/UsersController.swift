//
//  File.swift
//  
//
//  Created by Jude Alatawi on 28/08/2023.
//


import Fluent
import Vapor

struct UsersController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: index)
        users.post(use: create)

    }

    func index(req: Request) async throws -> [Users] {
        try await Users.query(on: req.db).all()
    }

    
    func create(req: Request) async throws -> HTTPStatus {
        let user = try req.content.decode(Users.self)
           try await user.save(on: req.db)
                return .ok
    }

   
}



struct CreateUser: Content {

    let deviceId: String
    
    let firstName: String
    
    let lastName: String
    
    let phoneNumber: String
    
    let password: String
    
    let reEnterPassword: String
}


