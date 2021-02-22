//
//  userDefault.swift
//  SPV
//
//  Created by HappySanz Tech on 12/10/20.
//  Copyright © 2020 HappySanz Tech. All rights reserved.
//

import Foundation
import UIKit


enum UserDefaultsKey : String
{
      case userOtpListSessionkey
      case userIDkey
      case userNamekey
      case userProfilePicKey
      case userPhoneNumKey
      case userEmailIDkey
      case userGenderKey
      case userDobKey
      case userProfilekey
      case profileInfokey
}

extension UserDefaults
{
    open func setOtpArray<T: Codable>(_ value: [T], forKey defaultName: String){
        let data = value.map { try? JSONEncoder().encode($0) }
        
        set(data, forKey: UserDefaultsKey.userOtpListSessionkey.rawValue)
    }
    
    open func getsOtpArrayData<T>(_ type: T.Type, forKey defaultName: String) -> [T] where T : Decodable {
        guard let encodedData = array(forKey: UserDefaultsKey.userOtpListSessionkey.rawValue) as? [Data] else {
            return []
        }
        
        return encodedData.map { try! JSONDecoder().decode(type, from: $0) }
    }
    
    open func setProfileInfo<T: Codable>(_ value: [T], forKey defaultName: String){
        let data = value.map { try? JSONEncoder().encode($0) }
        
        set(data, forKey: UserDefaultsKey.profileInfokey.rawValue)
    }
    
    open func getProfileInfo<T>(_ type: T.Type, forKey defaultName: String) -> [T] where T : Decodable {
        guard let encodedData = array(forKey: UserDefaultsKey.profileInfokey.rawValue) as? [Data] else {
            return []
        }
        
        return encodedData.map { try! JSONDecoder().decode(type, from: $0) }
    }
    
    
    func clearUserData()
    {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.userOtpListSessionkey.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.userIDkey.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.userNamekey.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.userProfilePicKey.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.userPhoneNumKey.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.userEmailIDkey.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.userGenderKey.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.userDobKey.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.profileInfokey.rawValue)
    }
}
