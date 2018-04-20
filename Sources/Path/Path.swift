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
        case this
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
        case .this: return "."
        case .super: return ".."
        case .path(let path): return path
        }
    }
}

extension Path.Kind: Equatable {
    public static func == (lhs: Path.Kind, rhs: Path.Kind) -> Bool {
        return lhs.description == rhs.description
    }
}

// MARK: - Path

public struct Path {
    /// The underlying path value of `Path`.
    private(set) var _path: String = ""
}

// MARK: -

extension Path {
    /// Returns the root path of the file system.
    public static var root: Path {
        return Path(_path: "/")
    }
    
    public static var current: Path {
        return Path(_path: FileManager.default.currentDirectoryPath)
    }
    
    public var kind: Kind {
        switch _path {
        case ".":
            return .this
        case "..":
            return .super
        default:
            return .path(_path)
        }
    }
}

// MARK: -

extension Path {
    public static func environments(`for` key: String) -> [String] {
        let env_paths = getenv(key)
        let char_env_paths = unsafeBitCast(env_paths, to: UnsafePointer<CChar>.self)
    #if swift(>=4.1)
        return
            String(validatingUTF8: char_env_paths)?
                .split(separator: ":")
                .compactMap { String($0) }
                ?? []
    #else
        return
            String(validatingUTF8: char_env_paths)?
                .split(separator: ":")
                .flatMap { String($0) }
                ?? []
    #endif
    }
}

// MARK: -

extension Path: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(_path: value)
    }
}
