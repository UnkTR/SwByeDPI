//
//  SBDURLSessionUtil.swift
//  SwByeDPI
//
//  Created by developer on 19.02.2026.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public class URLSessionUtil {

    //"kCF.." defs error at non-Apple swift SDK
    //Fix - set direct values from https://github.com/apple-oss-distributions/CF/blob/main/CFSocketStream.c
    
    private init() {}
    
    public static func initHttpProxySession(addr: String, port: UInt16, timeoutIntervalForResourceInS: UInt16? = nil, ephemeral: Bool = false) -> URLSession {
        var configuration = URLSessionConfiguration.default
        if (ephemeral) {
            configuration = URLSessionConfiguration.ephemeral
        }
        if let safeTimeoutIntervalForResourceInS = timeoutIntervalForResourceInS, safeTimeoutIntervalForResourceInS > 0 {
            configuration.timeoutIntervalForResource = TimeInterval(safeTimeoutIntervalForResourceInS)
        }
        configuration.connectionProxyDictionary = [
            "HTTPSEnable": 1,//kCFNetworkProxiesHTTPEnable as String: 1,
            "HTTPSProxy": addr,//kCFNetworkProxiesHTTPProxy as String: addr,
            "HTTPSPort": port,//kCFNetworkProxiesHTTPPort as String: port,
        ]
        let session = URLSession(configuration: configuration)
        return session
    }
    
    public static func initSocksProxySession(addr: String, port: UInt16, timeoutIntervalForResourceInS: UInt16? = nil, ephemeral: Bool = false) -> URLSession {
        var configuration = URLSessionConfiguration.default
        if (ephemeral) {
            configuration = URLSessionConfiguration.ephemeral
        }
        if let safeTimeoutIntervalForResourceInS = timeoutIntervalForResourceInS, safeTimeoutIntervalForResourceInS > 0 {
            configuration.timeoutIntervalForResource = TimeInterval(safeTimeoutIntervalForResourceInS)
        }
        configuration.connectionProxyDictionary = [
            //kCFNetworkProxiesSOCKSEnable: true,
            //kCFNetworkProxiesSOCKSProxy: addr,
            //kCFNetworkProxiesSOCKSPort: port,
            "SOCKSEnable": true,//kCFStreamPropertySOCKSProxyHost: true,
            "SOCKSProxy": addr,//kCFStreamPropertySOCKSProxyPort: addr,
            "SOCKSPort": port,//kCFStreamPropertySOCKSProxyPort: port,
            "kCFStreamPropertySOCKSVersion": "kCFStreamSocketSOCKSVersion5",//kCFStreamPropertySOCKSVersion: kCFStreamSocketSOCKSVersion5
        ]
        
        let session = URLSession(configuration: configuration)
        return session
    }
    
}
