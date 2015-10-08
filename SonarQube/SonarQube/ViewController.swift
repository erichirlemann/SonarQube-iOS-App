//
//  ViewController.swift
//  SonarQube
//
//  Created by Elena Vilchik on 08/10/15.
//  Copyright (c) 2015 SonarSource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    var projectId: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Project #\(projectId)"
    }

}

