//
//  ScanDetailsView.swift
//  RollaTask
//
//  Created by AlmirGaric on 16. 9. 2023..
//

import SwiftUI
import CoreBluetooth

struct ScanDetailsView: View {
    var device : CBPeripheral
    
    var body: some View {
        Text("Device Name: \(device.name ?? "Unknown name")")
        Text("UUID : \(device.identifier)")
        if let services = device.services {
            List(services, id: \.self) { service in
                Text(service.description)
            }
        }
    }
}

