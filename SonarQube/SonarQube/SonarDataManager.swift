//
//  DataManager.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/2/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//

import Foundation

let DoryQGURL = "https://dory.internal.sonarsource.com/api/resources?format=json&depth=1&scopes=PRJ&qualifiers=TRK&metrics=team_at_sonarsource,alert_status,quality_gate_details,issues,violations,blocker_violations,critical_violations,major_violations,minor_violations,info_violations"

let NemoQGURL = "http://nemo.sonarqube.org/api/resources?format=json&depth=1&scopes=PRJ&qualifiers=TRK&metrics=team_at_sonarsource,alert_status,quality_gate_details,sqale_index,violations,blocker_violations,critical_violations,major_violations,minor_violations,info_violations"


class SonarDataManager {
    
    
    class func getQGDataFromNemoWithSuccess(success: ((iNemoData: NSData!) -> Void)) {
        
        let nemoPreparedURL = NSURL(string: NemoQGURL)
        
        // fire off the request
        // make sure your class conforms to NSURLConnectionDelegate
        // let urlConnection = NSURLConnection(doryRequest: request, delegate: self)
        loadDataFromURL(nemoPreparedURL!, completion: {(data, error) -> Void in
            //2
            if let urlData = data {
                //3
                success(iNemoData: urlData)
            }
        })
    }

    
    
    
    class func getQGDataFromDoryWithSuccess(success: ((iDoryData: NSData!) -> Void)) {

    
    // http://stackoverflow.com/questions/24379601/how-to-make-an-http-request-basic-auth-in-swift
    // https://github.com/SonarSource/wallboard/blob/master/packages/default/jobs/dory-filter/dory-filter.js
    let doryPreparedURL = NSURL(string: DoryQGURL)
    
    // set up the base64-encoded credentials
    let base64LoginString =	"ZXJpYy5oaXJsZW1hbm46aGlybGU="
    
    // create the request
    let doryRequest = NSMutableURLRequest(URL: doryPreparedURL!)
    doryRequest.HTTPMethod = "GET"
    doryRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
    
    // fire off the request
    // make sure your class conforms to NSURLConnectionDelegate
    // let urlConnection = NSURLConnection(doryRequest: request, delegate: self)
        loadDataFromRequest(doryRequest, completion: {(data, error) -> Void in
            //2
            if let urlData = data {
                //3
                success(iDoryData: urlData)
            }
        })
    }

  
    class func loadDataFromRequest( request: NSURLRequest, completion:(data: NSData?, error: NSError?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
    
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
    let session = NSURLSession.sharedSession()
    
    // Use NSURLSession to get data from an NSURL
    let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
      if let responseError = error {
        completion(data: nil, error: responseError)
      } else if let httpResponse = response as? NSHTTPURLResponse {
        if httpResponse.statusCode != 200 {
          let statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
          completion(data: nil, error: statusError)
        } else {
          completion(data: data, error: nil)
        }
      }
    })
    
    loadDataTask.resume()
  }
}