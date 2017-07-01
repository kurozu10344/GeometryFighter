import Foundation

public enum ShapeType:Int {
    
    case box = 0
    case sphere
    case pyramid
    case torus
    case capsule
    case cylinder
    case cone
    case tube
    
    static func random() -> ShapeType {
        let maxValue = tube.rawValue
        let rand = arc4random_uniform(UInt32(maxValue+1))
        return ShapeType(rawValue: Int(rand))!
    }
    
    var description: String {
        switch self {
            case .box: return "box"
            case .sphere: return "sphere"
            case .pyramid: return "pyramid"
            case .torus: return "torus"
            case .capsule: return "capsule"
            case .cylinder: return "cylinder"
            case .cone: return "cone"
            case .tube: return "tube"
        }
    }
}
