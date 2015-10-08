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
        return [SonarProject(1, "Apache", "OK"), SonarProject(2, "Git", "ERROR"), SonarProject(3, "Apache Tika", "WARN")]
    }
    
    static func getProperties(project: SonarProject) -> [String: String] {
        return [
            "blocker issues": "104",
            "critical issues": "0",
            "major issues": "53",
            "minor issues": "45533",
            "info issues": "443",
            "debt": "3d 1h",
            "issues": "153"
        ]
    }
}