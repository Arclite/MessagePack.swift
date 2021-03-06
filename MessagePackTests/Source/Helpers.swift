import Foundation

func stringify<T>(value: T) -> String {
    switch value {
    case let double as Double:
        return String(format: "%.4f", double)
    case let float as Float:
        return String(format: "%.4f", float)
    default:
        return toString(value)
    }
}

func stringify<T>(value: T?) -> String {
    return value.map(stringify) ?? "nil"
}

func stringify<S: SequenceType>(value: S) -> String {
    let strings = map(value, stringify)
    let str = ", ".join(strings)
    return "[\(str)]"
}

func makeData(array: [UInt8]) -> NSData {
    return array.withUnsafeBufferPointer { (ptr: UnsafeBufferPointer<UInt8>) -> NSData in
        NSData(bytes: ptr.baseAddress, length: ptr.count)
    }
}
