//
//  File.swift
//  
//
//  Created by Jude Alatawi on 28/08/2023.
//


import Fluent
import Vapor


final class Users: Model {
    
    static let schema = "users"
    
    @ID
    var id: UUID?
    
    @Field(key: "deviceId")
    var deviceId: String
    
    @Field(key: "phoneNumber")
    var phoneNumber: String
   
    @Field(key: "firstName")
    var firstName: String
    
    @Field(key: "lastName")
    var lastName: String
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "reEnterPassword")
    var reEnterPassword: String
    
    init() {
    }
    
    init(id: UUID? = nil, deviceId: String, phoneNumber: String, firstName: String, lastName: String, password: String, reEnterPassword: String) {
        self.id = id
        self.deviceId = deviceId
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.reEnterPassword = reEnterPassword
    }

    
   
      
}


extension Users: Content {}

