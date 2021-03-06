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
        
        // create a semaphore to deal with the asynch call
        // it is the poorest implementation
        // look at http://www.raywenderlich.com/79150/grand-central-dispatch-tutorial-swift-part-2
        // TO DO improve the handling
        let semaphore = dispatch_semaphore_create(0) // 1
        
        var returned = [SonarProject]()
        
        // Get the #1 project from dory
        SonarDataManager.getQGDataFromNemoWithSuccess { (iNemoData) -> Void in
            
            let json = JSON(data: iNemoData)
            if let projectsArray = json.array {
                
                for project in projectsArray {
                    
                    let id = project["id"].int
                    let key = project["key"].string
                    let name = project["name"].string
                    
                    print("Processing \(key)")
                    // will be filled by processing of measures
                    var alert_status : String = "";
                    var quality_gate : String = "";

                    // measures requires a bit more work
                    let measures = project["msr"].array
                    for measure in measures! {
                        if measure["key"].string == "quality_gate_details"
                            && measure["data"].string != nil {
                            
                            let data : String = measure["data"].string!
                            let data_obj = NSString(string: data)
                            let QG_raw = data_obj.dataUsingEncoding(NSUTF8StringEncoding)
                            // TO DO continue the processing
                            quality_gate = data
                            
                        } else if measure["key"].string == "alert_status"
                            && measure["data"].string != nil{
                            alert_status = measure["data"].string!
                        }
                    }
                    
                    let projectObj = SonarProject(id!,name!, alert_status)
                    returned.append(projectObj)
                }
            }
            
            dispatch_semaphore_signal(semaphore) // 2
        }
        
        let projectObjOneMore = SonarProject(1, "Apache", "OK")
        returned.append(projectObjOneMore)
        print("Got \(returned.count)")

        let DefaultTimeoutLengthInNanoSeconds: Int64 = 10000000000 // 10 Seconds
        let timeout = dispatch_time(DISPATCH_TIME_NOW, DefaultTimeoutLengthInNanoSeconds)
        dispatch_semaphore_wait(semaphore, timeout)
        return returned
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