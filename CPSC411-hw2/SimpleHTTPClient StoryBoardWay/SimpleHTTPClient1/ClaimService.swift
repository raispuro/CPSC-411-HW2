//
//

import Foundation

struct Claim : Codable {
    var id : UUID?
    var title : String
    var date : String
    var isSolved : Int?
    
    init(title_:String,date_:String){
        title=title_
        date=date_
    }
}

class ClaimService {
    
    var ClaimList : [Claim] = [Claim]()
    
    func addClaim(pObj : Claim, completion: @escaping(String) -> Void){
        let requestUrl = "http://localhost:8090/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(pObj)
        //
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        let task = URLSession.shared.uploadTask(with: request, from: jsonData){
            (data, response, error) in
            if let resp = data {
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The response data sent from the server is \(respStr!)")
                completion("Claim (\(pObj.title)) was added")
            } else if let respError = error {
                print("Server Error : \(respError)")
                completion("Claim (\(pObj.title)) failed to be created.")
            }
        }
        task.resume()
    }
    
    func getAll() {
        print("About to send HTTP request to server")
        let requestUrl = "http://localhost:8090/ClaimService/getAll"
        let request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let respData = data {
                
                self.ClaimList = try! JSONDecoder().decode([Claim].self, from: respData)
                print("The Claim List : \(self.ClaimList)")
            }
        }
        //
        task.resume()
    }
    
}
