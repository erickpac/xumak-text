//
//  Storage.swift
//  Telecable
//
//  Created by Erick Pac on 23/11/20.
//

import Foundation

class Storage {
    
    lazy var userDefault = UserDefaults.standard
    
    func put(value: Any, forKey key: String) {
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    func get(key: String) -> Any? {
        return userDefault.object(forKey: key)
    }
    
    func remove(key: String) {
        userDefault.removeObject(forKey: key)
        userDefault.synchronize()
    }
    
    func clear() -> Bool {
        userDefault.dictionaryRepresentation().forEach {
            remove(key: $0.0)
        }
        
        return true
    }
    
}

extension Storage {
    
    func encode<E: Encodable>(model: E, key: String) {
        let encoder = JSONEncoder()
        guard let value = try? encoder.encode(model) else { return }
        put(value: value, forKey: key)
    }
    
    func decode<D: Decodable>(model: D.Type, key: String) -> D? {
        let value = get(key: key)
        if let dataValue = value as? Data {
            return decodeModel(model, data: dataValue)
        }
        
        if let dictValue = value as? [String: Any] {
            guard let dataValue = try? JSONSerialization.data(withJSONObject: dictValue, options: .init(rawValue: 0)) else { return nil }
            return decodeModel(model, data: dataValue)
        }
        
        return nil
    }
    
    internal func decodeModel<D: Decodable>(_ model: D.Type, data: Data) -> D? {
        return try? JSONDecoder().decode(model, from: data)
    }
    
}
