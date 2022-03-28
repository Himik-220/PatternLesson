//
//  UserManager.swift
//  PatternLesson
//
//  Created by Leonid Shchipkov on 24.03.2022.
//

import Foundation

@objc class User: NSObject {
    
    @objc dynamic var info: String
    init (info: String) {
        self.info = info
    }
}


class UserManager {
    fileprivate var userDefaults: UserDefaults!
    fileprivate var userInfoService: UserInfoService!
    private static let sharedUser = User(info: "First")
    typealias Class = UserManager
    
    class func configuredManager() -> UserManager {
        let manager = UserManager()
        manager.userDefaults = UserDefaults.standard
        manager.userInfoService = ServicesFacadeRelease().configureUserInfoService()
        return manager
    }
    
    func obtainMainUser() -> User {
        let user = Class.sharedUser
        return user
    }
    
    func chaingeUserInfo(_ info: String) {
        Class.sharedUser.info = info
    }
}

class UserInfoHandler {
    
}
