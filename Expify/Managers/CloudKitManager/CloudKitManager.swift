//
//  CloudKitManager.swift
//  Expify
//
//  Created by Alex173 on 03.09.2022.
//

import Foundation

final class CloudKitManager {
    
    private let repository = CloudKitRepository()
    
    public func turnOnCloudKit() {
        repository.saveCloudKitSetting(isOn: true)
    }
    
    public func turnOffCloudKit() {
        repository.saveCloudKitSetting(isOn: false)
    }
    
    public func isCloudKitEnabled() -> Bool {
        repository.getCloudKitSetting()
    }
    
}


