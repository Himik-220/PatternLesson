//
//  ServicesFacade.swift
//  PatternLesson
//
//  Created by Leonid Shchipkov on 24.03.2022.
//

import Foundation

protocol ServicesFacade {
    
    
}

class ServicesFacadeRelease {
    func configureAuthService() -> AuthService {
        return AuthServiceImpl()
    }
    func configureUserInfoService() -> UserInfoService {
        let service = UserInfoServiceIml()
        service.urlSession = URLSession.shared
        return service
    }
}

class ServicesFacadeDebug: ServicesFacadeRelease {
//    func configureAuthService() -> AuthService {
//
//    }
//    func configureUserInfoService() -> UserInfoService {
//
//    }
}
