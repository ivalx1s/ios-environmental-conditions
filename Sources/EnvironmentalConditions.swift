import UIKit
import Combine

@available(iOS 14, *)
public class EnvironmentalConditions: ObservableObject {
    private let deviceBatteryLevelObserver: DeviceBatteryLevelObserver
    private let devicePowerModeObserver: DevicePowerModeObserver
    
    @Published public private(set) var deviceBatteryState: UIDevice.BatteryState
    @Published public private(set) var deviceBatteryLevel: Float
    @Published public private(set) var devicePowerModeState: UIDevice.PowerModeState
    
    public init(
        
    ) {
        self.deviceBatteryLevelObserver = .init()
        self.devicePowerModeObserver = .init()
        
        deviceBatteryLevel = deviceBatteryLevelObserver.deviceBatteryLevel
        deviceBatteryState = deviceBatteryLevelObserver.deviceBatteryState
        devicePowerModeState = devicePowerModeObserver.devicePowerModeState
        
        initPipelines()
    }
    
    private func initPipelines() {
        initDeviceBatteryStateObserver()
        initDeviceBatteryLevelObserver()
        initDevicePowerModeObserver()
    }
    
    private func initDeviceBatteryStateObserver() {
        deviceBatteryLevelObserver.$deviceBatteryState
            .receive(on: DispatchQueue.main)
            .assign(to: &$deviceBatteryState)
    }
    
    private func initDeviceBatteryLevelObserver() {
        deviceBatteryLevelObserver.$deviceBatteryLevel
            .receive(on: DispatchQueue.main)
            .assign(to: &$deviceBatteryLevel)
    }
    
    private func initDevicePowerModeObserver() {
        devicePowerModeObserver.$devicePowerModeState
            .receive(on: DispatchQueue.main)
            .assign(to: &$devicePowerModeState)
    }
}
