import Combine
import Foundation
import UIKit

@available(iOS 14, *)
class DevicePowerModeObserver: ObservableObject {
    
    @Published private(set) var devicePowerModeState: UIDevice.PowerModeState
    
    private var pipelines: Set<AnyCancellable> = []
 
    public init() {
        self.devicePowerModeState = UIDevice.PowerModeState(isLowPowerModeEnabled: ProcessInfo.processInfo.isLowPowerModeEnabled)
        initPipelines()
    }
    
    private static let powerStateDidChangeNotificationName = Notification.Name.NSProcessInfoPowerStateDidChange
    
    private func initPipelines() {
        NotificationCenter.default.publisher(for: Self.powerStateDidChangeNotificationName)
            .map { _ in
                UIDevice.PowerModeState(isLowPowerModeEnabled: ProcessInfo.processInfo.isLowPowerModeEnabled)
            }
            .receive(on: DispatchQueue.main)
            .assign(to: &$devicePowerModeState)
    }
}
