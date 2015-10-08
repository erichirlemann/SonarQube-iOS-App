//
//  ViewController.swift
//  SonarQube
//
//  Created by Elena Vilchik on 08/10/15.
//  Copyright (c) 2015 SonarSource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qualityGateMessage: UILabel!
    @IBOutlet weak var qualityGateImage: UIImageView!
    
    @IBOutlet weak var issues: UILabel!
    @IBOutlet weak var debt: UILabel!
    
    @IBOutlet weak var blockerIssues: UILabel!
    @IBOutlet weak var criticalIssues: UILabel!
    @IBOutlet weak var MajorIssues: UILabel!
    @IBOutlet weak var MinorIssues: UILabel!
    @IBOutlet weak var InfoIssues: UILabel!
    
    var project: SonarProject!

    override func viewDidLoad(){
        super.viewDidLoad()
        
        title = "\(project.name)"
        qualityGateMessage.text! = project.qualityGate.getMessage()
        qualityGateImage.image = QualityGateImages.image(project.qualityGate)
        
        let properties = SonarQubeAPI.getProperties(project)
        
        for property in properties {
            let value = property.1
            switch property.0 {
            case "violations":
                issues.text! = value
            case "sqale_index":
                debt.text! = value
            case "blocker_violations":
                blockerIssues.text! = value
            case "critical_violations":
                criticalIssues.text! = value
            case "major_violations":
                MajorIssues.text! = value
            case "minor_violations":
                MinorIssues.text! = value
            case "info_violations":
                InfoIssues.text! = value
            default:
                break
            }
        }
    }

}

