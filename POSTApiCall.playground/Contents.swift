import UIKit

let token = "a9decbd9b1fee0ff942964bbd8c21126511d43c13fb9e38384179da6e9b0d47e"

func makePOSTRequest() {
    guard let url = URL(string: "https://gorest.co.in/public/v2/users?page=3") else {
        return
    }
    
    var request = URLRequest(url: url)
    // Method, body, headers
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
    
    let body: [String: AnyHashable] = [
        "id" : 1,
        "name": "Ivan",
        "email": "aaa@aaa.com",
        "gender": "male",
        "status": "active"
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    // Make the request
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCCESS: \(response)")
        }
        catch {
            print(error)
        }
    }
    task.resume()
}

struct Response: Codable {
  let id: Int
  let name: String
  let email: String
  let gender: String
  let status: String
}

makePOSTRequest()
