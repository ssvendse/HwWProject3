//
//  InterfaceController.swift
//  HwWProject3 WatchKit Extension
//
//  Created by Skyler Svendsen on 12/17/17.
//  Copyright © 2017 Skyler Svendsen. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        testUserDefaults()
        testUserDefaults()
        
        testKeychain()
        testKeychain()
        
        testFile()
        testFile()
    }
    
    func testUserDefaults() {
        let defaults = UserDefaults.standard
        
        if let contents = defaults.string(forKey: "shared_default") {
            print("Reading from defaults")
            print(contents)
        } else {
            print("Writing to defaults")
            defaults.set("This is the saved default.", forKey: "shared_default")
        }
    }
    
    func testKeychain() {
        let keychain = KeychainWrapper.standard
        
        if let contents = keychain.string(forKey: "shared_keychain") {
            print("Reading from keychain")
            print(contents)
        } else {
            print("Writing to keychain")
            keychain.set("This is the saved keychain.", forKey: "shared_keychain")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func testFile() {
        let saveURL = getDocumentsDirectory().appendingPathComponent("shared_file")
        
        if let contents = try? String(contentsOf: saveURL) {
            print("Reading from file")
            print(contents)
        } else {
            print("Writing to file")
            try? "This is the saved file".write(to: saveURL, atomically: true, encoding: String.Encoding.utf8)
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
