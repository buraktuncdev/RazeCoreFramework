//
//  Networking.swift
//  RazeCoreFramework
//
//  Created by Burak Tunc on 28.02.21.
//

import Foundation

extension RazeCoreFramework{
    public class Networking {
        /// Responsible for handling all networking calls
        /// - Warning: Must create before using any public APIs
        public class Manager {
            public init() {}
            
            private let session = URLSession.shared
            
            public func loadData(from url:URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                let task = session.dataTask(with: url){ data, response, error in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                task.resume()
            }
        }
        
        public enum NetworkResult<Value>{
            case success(Value)
            case failure(Error?)
        }
    }
}
