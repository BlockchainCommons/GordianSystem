//
//  Log.swift
//  StandUp
//
//  Created by Peter on 20/11/19.
//  Copyright © 2019 Peter. All rights reserved.
//

import Foundation

class Log {
    
    var logText = ""
    
    func writeToLog(content: String) {
        
        getLog {
            
            let file = "log.txt"
            self.logText += content
            
            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                
                let fileURL = dir.appendingPathComponent(file)
                
                do {
                    
                    try self.logText.write(to: fileURL, atomically: false, encoding: .utf8)
                    
                } catch {
                    
                    print("error setting log")
                    
                }
                
            }
            
        }
        
    }
    
    func getLog(completion: @escaping () -> Void) {
        
        let file = "log.txt"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            do {
                
                self.logText = try String(contentsOf: fileURL, encoding: .utf8)
                completion()
                
            } catch {
                
                self.logText = "error reading log"
                completion()
                
            }
            
        }
        
    }
    
}
