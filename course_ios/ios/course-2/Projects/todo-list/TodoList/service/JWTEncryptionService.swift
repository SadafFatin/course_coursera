//
//  JWTEncryptionService.swift
//  TodoList
//
//  Created by Sadaf Fatin on 4/4/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import Foundation
import CryptoKit


class JWTEncryptionService{
    
    static let secret:String = "95B550348A7A11E886DD286ED488C8C4"
    let privateKey:SymmetricKey = SymmetricKey(data: (secret.data(using: .utf8)!))
    
    let headerJSONData = try! JSONEncoder().encode(Header())
    
    let payloadJSONData = try! JSONEncoder().encode(Payload())
    static let shared =  JWTEncryptionService()

    
    
    
    func  createSignature() -> Void {
        let headerBase64String = headerJSONData.urlSafeBase64EncodedString()
        let payloadBase64String = payloadJSONData.urlSafeBase64EncodedString()
        let toSign = (headerBase64String + "." + payloadBase64String).data(using: .utf8)!
        
        let signature = HMAC<SHA256>.authenticationCode(for: toSign, using: privateKey)
        let signatureBase64String = Data(signature).urlSafeBase64EncodedString()

        let token = [headerBase64String, payloadBase64String, signatureBase64String].joined(separator: ".")
        print(token)
    }
    
    func createCypher(){
        
        
       // let key = SymmetricKey(size: .bits256)
        //let sealedBox = try AES.GCM.seal(input, using: key)
       // return sealedBox.combined!
        
    }
    
    
    
    
}

extension Data {
    func urlSafeBase64EncodedString() -> String {
        return base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}

    


struct Header: Encodable {
    let alg = "HS256"
    let typ = "JWT"
}

struct Payload: Encodable {
    let sub = "1234567890"
    let name = "John Doe"
    let iat = 1516239022
}
