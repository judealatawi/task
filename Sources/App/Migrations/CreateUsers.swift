//
//  File.swift
//  
//
//  Created by Jude Alatawi on 28/08/2023.
//

import Fluent

struct CreateUsers: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("users")
            .id()
            .field("deviceId", .string, .required)
            .field("firstName", .string, .required)
            .field("lastName", .string, .required)
            .field("phoneNumber", .string, .required)
            .field("password", .string, .required)
            .field("reEnterPassword", .string, .required)
        //gender
        //birthday
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("users").delete()
    }
}

