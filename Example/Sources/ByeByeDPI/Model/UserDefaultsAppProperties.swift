//
//  UserDefaultsProperties.swift
//  SwByeDPI
//
//  Created by developer on 26.03.2026.
//

import Foundation
import SwByeDPI

final class UserDefaultsAppProperties {
    
    static let appGroupUserDefaults = UserDefaults(suiteName: Constants.APP_GROUP_ID) ?? UserDefaults.standard
    
    static var byeDPIVPNRunning: Bool {
        get {
            return appGroupUserDefaults.bool(forKey: UserDefaultsAppKeys.byeDPIVPNRunning.rawValue)
        }
    }
    
    static var byeDPIListenIp: String {
        get {
            return appGroupUserDefaults.string(forKey: UserDefaultsAppKeys.selectedByeDPIListenIpAddrKey.rawValue) ?? SBDConfig.defaultListenIP
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.selectedByeDPIListenIpAddrKey.rawValue)
        }
    }
    
    static var byeDPIListenPort: UInt16 {
        get {
            return UInt16(appGroupUserDefaults.integer(forKey: UserDefaultsAppKeys.selectedByeDPIListenPortKey.rawValue))
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.selectedByeDPIListenPortKey.rawValue)
        }
    }
    
    static var byeDPIBufSize: Int32 {
        get {
            return Int32(appGroupUserDefaults.integer(forKey: UserDefaultsAppKeys.selectedByeDPIBufSizeKey.rawValue))
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.selectedByeDPIBufSizeKey.rawValue)
        }
    }
    
    static var byeDPIMaxConn: UInt16 {
        get {
            return UInt16(appGroupUserDefaults.integer(forKey: UserDefaultsAppKeys.selectedByeDPIMaxConn.rawValue))
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.selectedByeDPIMaxConn.rawValue)
        }
    }
    
    static var byeDPITTL: UInt8? {
        get {
            guard let safeObj = appGroupUserDefaults.object(forKey: UserDefaultsAppKeys.selectedByeDPITTL.rawValue) else {
                return nil
            }
            return UInt8(appGroupUserDefaults.integer(forKey: UserDefaultsAppKeys.selectedByeDPITTL.rawValue))
        }
        set {
            guard let safeNewValue = newValue else {
                appGroupUserDefaults.removeObject(forKey: UserDefaultsAppKeys.selectedByeDPITTL.rawValue)
                return
            }
            appGroupUserDefaults.set(safeNewValue, forKey: UserDefaultsAppKeys.selectedByeDPITTL.rawValue)
        }
    }
    
    static var byeDPIRestrictDomainResolve: Bool {
        get {
            return appGroupUserDefaults.bool(forKey: UserDefaultsAppKeys.byeDPIRestrictDomainResolve.rawValue)
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.byeDPIRestrictDomainResolve.rawValue)
        }
    }
    
    static var byeDPIRestrictUDP: Bool {
        get {
            return appGroupUserDefaults.bool(forKey: UserDefaultsAppKeys.byeDPIRestrictUDP.rawValue)
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.byeDPIRestrictUDP.rawValue)
        }
    }
    
    static var byeDPILogLevel: UInt8? {
        get {
            guard let safeObj = appGroupUserDefaults.object(forKey: UserDefaultsAppKeys.selectedbyeDPILogLevel.rawValue) else {
                return nil
            }
            return UInt8(appGroupUserDefaults.integer(forKey: UserDefaultsAppKeys.selectedbyeDPILogLevel.rawValue))
        }
        set {
            guard let safeNewValue = newValue else {
                appGroupUserDefaults.removeObject(forKey: UserDefaultsAppKeys.selectedbyeDPILogLevel.rawValue)
                return
            }
            appGroupUserDefaults.set(safeNewValue, forKey: UserDefaultsAppKeys.selectedbyeDPILogLevel.rawValue)
        }
    }
    
    static var byeDPICmdArgs: [String] {
        get {
            return (appGroupUserDefaults.array(forKey: UserDefaultsAppKeys.selectedByeDPICmdArgsKey.rawValue) as? [String]) ?? []
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.selectedByeDPICmdArgsKey.rawValue)
        }
    }
    
    static var resolvedDnsServers: [String] {
        get {
            return (appGroupUserDefaults.array(forKey: UserDefaultsAppKeys.resolvedDnsServersKey.rawValue) as? [String]) ?? []
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.resolvedDnsServersKey.rawValue)
        }
    }
    
    static var dnsOverAddr: String {
        get {
            return appGroupUserDefaults.string(forKey: UserDefaultsAppKeys.selectedDnsOverAddrKey.rawValue) ?? "8.8.8.8"
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.selectedDnsOverAddrKey.rawValue)
        }
    }
    
    static var tunMtu: UInt16 {
        get {
            return UInt16(appGroupUserDefaults.integer(forKey: UserDefaultsAppKeys.selectedTunMtuKey.rawValue))
        }
        set {
            appGroupUserDefaults.set(newValue, forKey: UserDefaultsAppKeys.selectedTunMtuKey.rawValue)
        }
    }
    
    fileprivate init() {}
    
}
