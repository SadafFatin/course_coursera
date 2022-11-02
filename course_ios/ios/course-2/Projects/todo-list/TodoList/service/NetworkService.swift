//
//  NetworkService.swift
//  TodoList
//
//  Created by Sadaf Fatin on 3/28/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import Foundation
class NetworkService {
    
    static let shared =  NetworkService()
    let URL_BASE = "http://localhost:3003"
    let URL_ENDPOINT_ADD = "/add"
    
    let url_session = URLSession(configuration: .default)
    
    
    func getTodos(_ onSuccess: @escaping (Todos)-> Void ,
                  
                  _ onError: @escaping (String)-> Void) {
        
        JWTEncryptionService.shared.createSignature();
        
        let url = URL(string: "\(URL_BASE)")!
        
        let task = url_session.dataTask(with: url, completionHandler: {
            
            (data, response ,error ) in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                
                guard let data = data , let response = response as? HTTPURLResponse
                    else{
                        onError("Invalid data or response")
                        return
                }
                
                do {
                    if response.statusCode == 200{
                        let items = try JSONDecoder().decode(Todos.self , from : data)
                        onSuccess(items)
                        
                    }
                    else{
                        //show api error to user
                        let error = try JSONDecoder().decode(APIError.self , from : data)
                        onError(error.message)
                    }
                }
                catch{
                    onError(error.localizedDescription)
                }
            }
            
        })
        
        task.resume()
        
    }
    
    
    
    func addTodos(todo: Todo, _ onSuccess: @escaping (Todos)-> Void ,
                  _ onError: @escaping (String)-> Void){
        
        let url = URL(string: "\(URL_BASE)\(URL_ENDPOINT_ADD)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do{
            let body =  try JSONEncoder().encode(todo)
            request.httpBody = body
            let task = url_session.dataTask(with: request , completionHandler: {(data, response, error) in
                
                DispatchQueue.main.async {
                    
                    if let error = error {
                        onError(error.localizedDescription)
                        return
                    }
                    
                    guard let data = data , let response = response as? HTTPURLResponse
                        else{
                            onError("Invalid data or response")
                            return
                    }
                    
                    do {
                        if response.statusCode == 200{
                            let items = try JSONDecoder().decode(Todos.self , from : data)
                            onSuccess(items)
                            
                        }
                        else{
                            //show api error to user
                            let error = try JSONDecoder().decode(APIError.self , from : data)
                            onError(error.message)
                        }
                    }
                    catch{
                        onError(error.localizedDescription)
                    }
                }
                // main thread block ends
            })
            //task completion handler ends
            
            task.resume()
        }
        catch{
            onError(error.localizedDescription)
        }
    }
    //method addtodo ends
    
    
}
