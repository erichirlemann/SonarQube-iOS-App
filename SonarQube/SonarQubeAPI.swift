//
//  SonarProject.swift
//  SonarQube
//
//  Created by Elena Vilchik on 07/10/15.
//  Copyright (c) 2015 Hirle Sonar. All rights reserved.
//

import Foundation

class SonarQubeAPI {
    
    static func getProjects()-> [SonarProject] {
        let project = SonarProject(1, "My project", "OK")
        return [SonarProject(1, "Apache", "OK"), SonarProject(2, "Git", "ERROR"), SonarProject(3, "Apache Tika", "WARN")]
    }
    
    static func getProperties(project: SonarProject) -> [String: String] {
        return ["blocker issues": "100", "debt": "1h15min"]
    }
}