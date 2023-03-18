//
//  User.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import Foundation
enum UserType {
    case anon, signedIn
}
class User: ObservableObject {
    static let shared = User()
    
    
    private init() {
    }
    
    @Published var points = 1400
    @Published var userType: UserType = .anon
    
    
}
