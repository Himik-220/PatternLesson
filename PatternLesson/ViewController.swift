//
//  ViewController.swift
//  PatternLesson
//
//  Created by Leonid Shchipkov on 24.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var alertsFactory: DefaultsAlertsFactory = DefaultsAlertsFactoryIml()
    var alertsBuilder: DefaultsAlertsBuilder = DefaultsAlertsBuilderImpl()
    var userManager = UserManager.configuredManager()
    var observation: NSKeyValueObservation?
    var trashManager = TrashManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let alert = alertsBuilder.buildOkAlert(with: "", message: "")
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        let user = userManager.obtainMainUser()
        observation = user.observe(\.info, options: .new) { (updateUser, change) in
            print("Updated: \(updateUser.info)")
        }
        
        user.info = "New info!"
        
        let trash = Trash(type: .unexpected)
        trashManager.trashCan.deal(with: trash)
        view.addSubview(button)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//
//        let alert = alertsFactory.getAlert(by: .okAlert)
//        present(alert, animated: true)
    }
    
    @objc func buttonPressed() {
        print("Hi")
    }
}

enum TrashType {
    case paper
    case plastic
    case organic
    case unexpected
}

struct Trash {
    var type: TrashType
}

protocol TrashCan {
    var diffTrash: TrashCan? { get set }
    func deal(with trash: Trash)
}

class PaperTrashCan: TrashCan {
    var diffTrash: TrashCan?
    init(nextTrash: TrashCan?){
        diffTrash = nextTrash
    }
    func deal(with trash: Trash) {
        if trash.type == .paper {
            print("deal with it")
        } else {
            diffTrash?.deal(with: trash)
        }
    }
}
class PlasticTrashCan: TrashCan {
    var diffTrash: TrashCan?
    init(nextTrash: TrashCan?){
        diffTrash = nextTrash
    }
    func deal(with trash: Trash) {
        if trash.type == .plastic {
            print("deal with it plastic")
        } else {
            diffTrash?.deal(with: trash)
        }
    }
}
class OrganicTrashCan: TrashCan {
    var diffTrash: TrashCan?
    init(nextTrash: TrashCan?){
        diffTrash = nextTrash
    }
    func deal(with trash: Trash) {
        if trash.type == .organic {
            print("deal with it organic")
        } else {
            print("nil")
        }
    }
}

class TrashManager {
    var trashCan: TrashCan
    
    init() {
        let organicTrash = OrganicTrashCan(nextTrash: nil)
        let plasticTrash = PlasticTrashCan(nextTrash: organicTrash)
        let paperTrash = PaperTrashCan(nextTrash: plasticTrash)
        trashCan = paperTrash
    }
}
