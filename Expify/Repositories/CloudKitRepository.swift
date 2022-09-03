//
//  CloudKitRepository.swift
//  Expify
//
//  Created by Alex173 on 03.09.2022.
//

import Foundation

final class CloudKitRepository {
    
    private let appCloudKitSettingKey = "com.alex173.cloud_kit_setting"
    
    private let defaults = UserDefaults.standard
    
    func saveCloudKitSetting(isOn: Bool) {
        defaults.setValue(isOn, forKey: appCloudKitSettingKey)
    }
    
    func getCloudKitSetting() -> Bool {
        return defaults.bool(forKey: appCloudKitSettingKey)
    }

}

