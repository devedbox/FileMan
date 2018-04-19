//
//  Path.swift
//  Path
//
//  Created by devedbox on 2018/4/19.
//

#if os(Linux)
import Glibc
#else
import Darwin
#endif
import Foundation

// MARK: - Path.Kind

extension Path {
    /// The Kind of the `Path`.
    public enum Kind {
        /// Case indicates path `.`.
        case `self`
        /// Case indicates path `..`.
        case `super`
        /// Case indicates path `path`.
        case path(String)
    }
}

// MARK: -

extension Path.Kind: CustomStringConvertible {
    /// Returns the value of the `Path.Kind`.
    public var description: String {
        switch self {
        case .self: return "."
        case .super: return ".."
        case .path(let path): return path
        }
    }
}

// MARK: - Path

public struct Path {
    /// The underlying path value of `Path`.
    private(set) var _path: String = ""
}

extension Path {
    public static var curren: Path {
        return Path(_path: FileManager.default.currentDirectoryPath)
    }
    
    public var kind: Kind {
        switch _path {
        case ".":
            return .self
        case "..":
            return .super
        default:
            return .path(_path)
        }
    }
}

// MARK: -

extension Path: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(_path: value)
    }
}
