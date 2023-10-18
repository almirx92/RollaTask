//
//  BluetoothManager.swift
//  RollaTask
//


import Foundation
import CoreBluetooth

protocol BLEManagerDelegate: AnyObject  {
    func didFindPeripheal(peripheal: CBPeripheral)
}

class BLEManager: NSObject,ObservableObject,CBCentralManagerDelegate,CBPeripheralDelegate{
    weak var delegate: BLEManagerDelegate?
    
    var centralManager: CBCentralManager!
    
    func connect(){
        centralManager = CBCentralManager(delegate: self, queue: .global());
    }
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Central State Update")
        if central.state != .poweredOn{
            print("Central is not powered On")
            
        } else {
            print("Central scanning")
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        delegate?.didFindPeripheal(peripheal: peripheral)
        
        // Connect!
            //self.centralManager.connect(self.peripheral, options: nil)
    }
    
    // The handler if we do connect succesfully
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {}
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {}
    
    // Handles discovery event
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {}
    
    func startScanning() {
        centralManager.scanForPeripherals(withServices: nil)
    }
    
    func stopScanning() {
        centralManager.stopScan()
    }
}

