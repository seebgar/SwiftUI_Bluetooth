//
//  BluetoothManager.swift
//  Bluetooth
//
//  Created by Sebastian on 1/28/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import Foundation
import UIKit
import Combine
import CoreBluetooth


open class BluetoothManager: NSObject, ObservableObject, CBPeripheralDelegate, CBCentralManagerDelegate {
    
    /**
     VARIABLES
     */
    private var centralManager: CBCentralManager!
    private var centralPeripheral: CBPeripheral!
    let didChange = ObservableObjectPublisher()
    @Published var showAlert: Bool = false {
        willSet {
            didChange.send()
        }
    }
    @Published var devices: [Device] = [] {
        willSet {
            didChange.send()
        }
    }
    
    
    /**
     Init
     */
    public func startManager() {
        print("--> Init")
        
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
        // Actualizar cierto tiempo falta
    }
    
    /**
     Stop
     */
    public func stopManager() {
        self.centralManager.stopScan()
    }
    
    
    /**
     Updates when the Bluetooth Peripheral is switched on or off.
     It will fire when an app first starts so you know the state of Bluetooth.
     Scanning starts here.
     */
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("--> Updating")
        
        if central.state != .poweredOn {
            print("! Bluetooth is OFF")
            showAlert.toggle()
        } else {
            print("--> Scanning")
            showAlert = false
            self.centralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
        }
    }
    
    
    /**
     Event occurs when you receive scan results.
     */
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("--> Discovered peripherals")
        print("* Peripheral Name: \(String(describing: peripheral.name))\n* RSSI: \(String(RSSI.doubleValue))\n* Description: \(String(describing: peripheral.description))")
        
        self.centralManager.stopScan()
        let desc = peripheral.description.split(separator: ",")
        let identifier = desc[1].replacingOccurrences(of: "identifier = ", with: "")
        let status = desc[3].replacingOccurrences(of: "state = ", with: "").replacingOccurrences(of: ">", with: "")
        let apareil = Device(name: peripheral.name, description: peripheral.description, identifier: identifier, status: status)
        devices.append(apareil)
        
        /**
         Connection Management
         */
        //self.centralPeripheral = peripheral
        //self.centralPeripheral.delegate = self
        //self.centralManager.connect(self.centralPeripheral, options: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 , execute: {
            if self.devices.count < 10 {
                 self.centralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
            }
        })
        
        
    }
    
    
    /**
     Event fires once the device is connected.
     The device discover starts here.
     Device discovery is the way to determine what services and characteristics are available.
     This is a good way to confirm what type of device we're connected to.
     */
    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("--> Connected")
        print("* Peripheral Name: \(String(describing: peripheral.name))\n* Description: \(String(describing: peripheral.description))")
        
        if self.centralPeripheral == peripheral {
            self.centralPeripheral.discoverServices(nil)
        }
    }
    
    
    /**
     Event first once all the services have been discovered.
     Notice that we've switched from centralManager to peripheral now that we're connected.
     Start the characteristic discovery here.
     */
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("--> Services")
        
        if let servcices = peripheral.services {
            for ser in servcices {
                print("* Service ::")
                print(ser.description)
            }
        }
    }
    
    
    /**
     Event will provide all the characteristics using the provided service UUID.
     This is the last step in the chain of doing a full device discovery. I
     */
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("--> Characteristics")
        
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                print("* Characteristics ::")
                print(characteristic.description)
            }
        }
    }
    
}

