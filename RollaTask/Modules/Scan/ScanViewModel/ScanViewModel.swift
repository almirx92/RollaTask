//
//  ScanViewModel.swift
//  RollaTask
//


import Foundation
import CoreBluetooth

final class ScanViewModel: ObservableObject {
    private let bleManager = BLEManager()
    
    @Published var discoveredDevices : [CBPeripheral] = []
    @Published var isScanning : Bool = false
    
    init() {
        self.bleManager.delegate = self
    }
    
    func startConnection(){
        bleManager.connect()
    }
    func startScanning(){
        bleManager.startScanning()
    }
    func stopScanning(){
        bleManager.stopScanning()
    }
    
}

extension ScanViewModel:BLEManagerDelegate{
    func didFindPeripheal(peripheal: CBPeripheral) {
        DispatchQueue.main.async{ [weak self] in
            self?.discoveredDevices.append(peripheal)
        }
    }
    
    
}
