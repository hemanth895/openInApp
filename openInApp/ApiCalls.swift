//
//  ApiCalls.swift
//  openInApp
//
//  Created by hemanth on 4/28/24.
//

import Foundation



class ApiCalls{
    
    static let  shared  = ApiCalls()
    
    let url = "https://api.inopenapp.com/api/v1/dashboardNew"
    let access_token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    func makeAPICall(completion: @escaping (ApiResponse?, Error?) -> Void) {
           guard let url = URL(string: url) else {
               print("Invalid URL")
               return
           }
           
           var request = URLRequest(url: url)
           request.httpMethod = "GET"
           request.setValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
           
           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               guard let data = data, error == nil else {
                   print("Error: \(error?.localizedDescription ?? "Unknown error")")
                   return
               }
               
               if let httpResponse = response as? HTTPURLResponse {
                   if (200...299).contains(httpResponse.statusCode) {
                       // Successful response
                       if let jsonString = String(data: data, encoding: .utf8) {
                           print("JSON Response: \(jsonString)")
                       } else {
                           print("Unable to convert data to string")
                       }
                       
                       //get the data and decode to api response object
                       
                       do {
                           let decoder = JSONDecoder()
//                           decoder.keyDecodingStrategy = .convertFromSnakeCase // Adjust this based on your preference
                           
                           let apiResponse = try decoder.decode(ApiResponse.self, from: data)
                           completion(apiResponse, nil)

                       } catch {
                           print("Error decoding JSON: \(error)")
                           completion(nil, error)

                       }
                       
                       
                   } else {
                       print("HTTP Response Status Code: \(httpResponse.statusCode)")
                       if let jsonString = String(data: data, encoding: .utf8) {
                           print("Error Response: \(jsonString)")
                       }
                   }
               } else {
                   print("Invalid HTTP Response")
               }
           }
           
           task.resume()
       }
}
