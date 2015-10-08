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
        
        func getMessage()->String {
            switch self {
            case .orange:
                return "The project has warnings"
            case .red:
                return "The project failed the quality gate"
            case .green:
                return "The project has passed the quality gate"
            }
        }
    }
    
    var id: Int
    var name: String
    var qualityGate: QualityGate
    var properties: [String:String]
    
    init(_ id: Int, _ name: String, _ qualityGate: String) {
        self.id = id;
        self.name = name
        self.qualityGate = QualityGate.fromString(qualityGate)!
        self.properties = [String:String]()
    }
    

}