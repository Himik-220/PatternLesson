//
//  DefaultsAlertsBuilder.swift
//  PatternLesson
//
//  Created by Leonid Shchipkov on 24.03.2022.
//

import Foundation
import UIKit

protocol DefaultsAlertsBuilder: AnyObject {
    func buildOkAlert(with title: String, message: String) -> UIViewController
    func buildCancelAlert(with message: String, handler: (() -> Void)?) -> UIViewController
}

class DefaultsAlertsBuilderImpl: DefaultsAlertsBuilder {

    func buildOkAlert(with title: String, message: String) -> UIViewController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(action)
        return alertController
    }
    func buildCancelAlert(with message: String, handler: (() -> Void)?) -> UIViewController {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .default) { _ in
            handler?()
        }
        alertController.addAction(action)
        return alertController
    }
    
}
