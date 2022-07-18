import UIKit

public extension UIDevice {
    enum PowerModeState: String, Codable {
        case lowPower
        case normalPower

        init(isLowPowerModeEnabled: Bool) {
            switch isLowPowerModeEnabled {
            case true: self = .lowPower
            case false: self = .normalPower
            }
        }
    }
}
