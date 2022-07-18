import UIKit

extension UIDevice {
    var isSimulator: Bool {
        TARGET_OS_SIMULATOR != 0
    }
}
