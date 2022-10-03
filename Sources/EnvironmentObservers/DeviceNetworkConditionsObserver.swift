import Combine
import Foundation

internal class DeviceNetworkStateObserver: ObservableObject {
	
	private var networkService: NetworkService
	
	@Published private(set) var deviceNetworkStatus: NetworkStatus
	
	init() {
		let networkService = NetworkService()
		self.networkService = networkService
		self.deviceNetworkStatus = networkService.status
		initNetworkServicePipeline()
	}
	
	
	private func initNetworkServicePipeline() {
		networkService
			.networkPub
			.removeDuplicates()
			.receive(on: DispatchQueue.main)
			.assign(to: &$deviceNetworkStatus)
	}
	
}
