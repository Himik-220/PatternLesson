//
//  UserInfoService.swift
//  PatternLesson
//
//  Created by Leonid Shchipkov on 24.03.2022.
//

import Foundation

struct UserInfo {
    var name: String
    var age: String
}

protocol UserInfoService {
    func obtainUserInfo() -> UserInfo
}

class UserInfoServiceIml: UserInfoService {
    
    var urlSession: URLSession!

    func obtainUserInfo() -> UserInfo {
        return UserInfo(name: "Leonid", age: "21")
    }
}
