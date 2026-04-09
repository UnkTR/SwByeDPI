import NetworkExtension

extension NETunnelProviderProtocol {
    
    var byeDPIVPNRunning: Bool {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.byeDPIVPNRunning.rawValue] as? Bool ?? false
        }
        set {
            providerConfiguration?[UserDefaultsAppKeys.byeDPIVPNRunning.rawValue] = newValue as NSObject
        }
    }
    
    var byeDPIListenIp: String? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.selectedByeDPIListenIpAddrKey.rawValue] as? String
        }
        set {
            updateConfigStringValue(for: UserDefaultsAppKeys.selectedByeDPIListenIpAddrKey.rawValue, value: newValue)
        }
    }
    
    var byeDPIListenPort: UInt16? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.selectedByeDPIListenPortKey.rawValue] as? UInt16
        }
        set {
            updateConfigUInt16Value(for: UserDefaultsAppKeys.selectedByeDPIListenPortKey.rawValue, value: newValue)
        }
    }
    
    var byeDPIBufSize: UInt32? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.selectedByeDPIBufSizeKey.rawValue] as? UInt32
        }
        set {
            updateConfigUInt32Value(for: UserDefaultsAppKeys.selectedByeDPIBufSizeKey.rawValue, value: newValue)
        }
    }
    
    var byeDPIMaxConn: UInt16? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.selectedByeDPIMaxConn.rawValue] as? UInt16
        }
        set {
            updateConfigUInt16Value(for: UserDefaultsAppKeys.selectedByeDPIMaxConn.rawValue, value: newValue)
        }
    }
    
    var byeDPITTL: UInt8? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.selectedByeDPITTL.rawValue] as? UInt8
        }
        set {
            updateConfigUInt8Value(for: UserDefaultsAppKeys.selectedByeDPITTL.rawValue, value: newValue)
        }
    }
    
    var byeDPINoDomains: Bool {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.byeDPIRestrictDomainResolve.rawValue] as? Bool ?? false
        }
        set {
            providerConfiguration?[UserDefaultsAppKeys.byeDPIRestrictDomainResolve.rawValue] = newValue as NSObject
        }
    }
    
    var byeDPINoUDP: Bool {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.byeDPIRestrictUDP.rawValue] as? Bool ?? false
        }
        set {
            providerConfiguration?[UserDefaultsAppKeys.byeDPIRestrictUDP.rawValue] = newValue as NSObject
        }
    }
    
    var byeDPILogLevel: UInt8? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.selectedbyeDPILogLevel.rawValue] as? UInt8
        }
        set {
            updateConfigUInt8Value(for: UserDefaultsAppKeys.selectedbyeDPILogLevel.rawValue, value: newValue)
        }
    }
    
    var byeDPICmdArgs: [String]? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.selectedByeDPICmdArgsKey.rawValue] as? [String]
        }
        set {
            updateConfigStringArrValue(for: UserDefaultsAppKeys.selectedByeDPICmdArgsKey.rawValue, value: newValue)
        }
    }
    
    var resolvedDnsServers: [String]? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.resolvedDnsServersKey.rawValue] as? [String]
        }
        set {
            updateConfigStringArrValue(for: UserDefaultsAppKeys.resolvedDnsServersKey.rawValue, value: newValue)
        }
    }
    
    var dnsOverAddr: String? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.selectedDnsOverAddrKey.rawValue] as? String
        }
        set {
            updateConfigStringValue(for: UserDefaultsAppKeys.selectedDnsOverAddrKey.rawValue, value: newValue)
        }
    }
    
    var tunMtu: UInt16? {
        get {
            return providerConfiguration?[UserDefaultsAppKeys.selectedTunMtuKey.rawValue] as? UInt16
        }
        set {
            updateConfigUInt16Value(for: UserDefaultsAppKeys.selectedTunMtuKey.rawValue, value: newValue)
        }
    }
    
    fileprivate func updateConfigStringValue(for key: String, value: String?) {
        guard let safeValue = value, !safeValue.isEmpty else {
            providerConfiguration?.removeValue(forKey: key)
            return
        }
        providerConfiguration?[key] = safeValue as NSObject
    }
    
    fileprivate func updateConfigStringArrValue(for key: String, value: [String]?) {
        guard let safeValue = value, !safeValue.isEmpty else {
            providerConfiguration?.removeValue(forKey: key)
            return
        }
        providerConfiguration?[key] = safeValue as NSObject
    }
    
    fileprivate func updateConfigUInt8Value(for key: String, value: UInt8?) {
        guard let safeValue = value, safeValue != 0 else {
            providerConfiguration?.removeValue(forKey: key)
            return
        }
        providerConfiguration?[key] = safeValue as NSObject
    }
    
    fileprivate func updateConfigUInt16Value(for key: String, value: UInt16?) {
        guard let safeValue = value, safeValue != 0 else {
            providerConfiguration?.removeValue(forKey: key)
            return
        }
        providerConfiguration?[key] = safeValue as NSObject
    }
    
    fileprivate func updateConfigUInt32Value(for key: String, value: UInt32?) {
        guard let safeValue = value, safeValue != 0 else {
            providerConfiguration?.removeValue(forKey: key)
            return
        }
        providerConfiguration?[key] = safeValue as NSObject
    }
}
