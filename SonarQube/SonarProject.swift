//
//  SonarProject.swift
//  SonarQube
//
//  Created by Elena Vilchik on 07/10/15.
//  Copyright (c) 2015 Hirle Sonar. All rights reserved.
//

import Foundation

class SonarProject {
    
    enum QualityGate {
        case red, orange, green
        
        static func fromString(str: String)->QualityGate? {
            switch str {
            case "OK":
                return QualityGate.green
            case "WARN":
                return QualityGate.orange
            case "ERROR":
                return QualityGate.red
            default:
                return nil
            }
        }
    }
    
    var id: Int
    var name: String
    var qualityGate: QualityGate
    
    init(_ id: Int, _ name: String, _ qualityGate: String) {
        self.id = id;
        self.name = name
        self.qualityGate = QualityGate.fromString(qualityGate)!
    }
}