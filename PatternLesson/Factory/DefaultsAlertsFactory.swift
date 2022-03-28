//
//  DefaultsAlertsFactory.swift
//  PatternLesson
//
//  Created by Leonid Shchipkov on 24.03.2022.
//

import Foundation
import UIKit

enum DefaultsAlerts {
    case okAlert
    case cancelAlert
    case unexpectedErrorAlert
}

protocol DefaultsAlertsFactory: AnyObject {
    func getAlert(by type: DefaultsAlerts) -> UIViewController
}

class DefaultsAlertsFactoryIml: DefaultsAlertsFactory {
    func getAlert(by type: DefaultsAlerts) -> UIViewController{
        switch type {
        case .okAlert             : return configureOkAlert()
        case .cancelAlert         : return configureCancelAlert()
        case .unexpectedErrorAlert: return configureUnexpectedAlert()
        }
    }
    
    private func configureOkAlert() -> UIViewController {
        let alertController = UIAlertController(title: nil, message: "Ok", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(action)
        return alertController
    }
    private func configureCancelAlert() -> UIViewController {
        let alertController = UIAlertController(title: nil, message: "Cancel", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(action)
        return alertController
    }
    private func configureUnexpectedAlert() -> UIViewController {
        let alertController = UIAlertController(title: nil, message: "Wow unexpected", preferredStyle: .alert)
        let action = UIAlertAction(title: "Unexpected", style: .default, handler: nil)
        
        alertController.addAction(action)
        return alertController
    }
    
}
