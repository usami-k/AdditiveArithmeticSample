// Swift 5 : AdditiveArithmetic Protocol

// ==============================
// Conform to AdditiveArithmetic
// ==============================

struct Vector3D {
    typealias Scalar = Float
    var x: Scalar
    var y: Scalar
    var z: Scalar
}

extension Vector3D : CustomStringConvertible {
    var description: String { return "(\(x),\(y),\(z))" }
}

extension Vector3D : AdditiveArithmetic {
    static var zero = Vector3D(x: 0, y: 0, z: 0)

    static func + (lhs: Vector3D, rhs: Vector3D) -> Vector3D {
        return Vector3D(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }
    static func - (lhs: Vector3D, rhs: Vector3D) -> Vector3D {
        return Vector3D(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z)
    }
    static func += (lhs: inout Vector3D, rhs: Vector3D) {
        lhs = lhs + rhs
    }
    static func -= (lhs: inout Vector3D, rhs: Vector3D) {
        lhs = lhs - rhs
    }
}

// Prefix minus
extension Vector3D {
    prefix static func - (v: Vector3D) -> Vector3D {
        return .zero - v
    }
}

// Multiply by scalar
extension Vector3D {
    static func * (k: Scalar, v: Vector3D) -> Vector3D {
        return Vector3D(x: k * v.x, y: k * v.y, z: k * v.z)
    }
    static func * (v: Vector3D, k: Scalar) -> Vector3D {
        return k * v
    }
}

// ==============================
// Use AdditiveArithmetic
// ==============================

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element {
        return reduce(.zero, +)
    }
}

let sum = [Vector3D(x: 1, y: 2, z: 3),
           Vector3D(x: 4, y: 3, z: 2) - Vector3D(x: 2, y: 2, z: 2),
           3 * -Vector3D(x: 1, y: 1, z: 1)].sum()
if sum == .zero {
    print("😄")
}
