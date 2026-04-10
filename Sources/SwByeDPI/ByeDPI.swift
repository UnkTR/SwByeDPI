//
//  ByeDPI.swift
//  SwByeDPI
//
//  Created by developer on 16.03.2026.
//

#if canImport(ByeDPIKit)
// Dynamic framework import
import ByeDPIKit

/// ByeDPI Swift wrapper
public class ByeDPI: ByeDPIKit.ByeDPI {}
#elseif canImport(ByeDPIKitLib)
// Static lib import
import ByeDPIKitLib

/// ByeDPI Swift wrapper
public class ByeDPI: ByeDPIKitLib.ByeDPI {}
#endif

#if swift(<5.5)
/// Fallback empty Sendable protocol
public protocol Sendable {}
#endif
