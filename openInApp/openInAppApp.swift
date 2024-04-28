//
//  openInAppApp.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI





@main
struct openInAppApp: App {

    @State var apiResponseHolder = ApiResponseHolder()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    ApiCalls.shared.makeAPICall { apiResponse, error in
                        
                        
                        DispatchQueue.main.async {
                                                   if let error = error {
                                                       print("Error: \(error.localizedDescription)")
                                                   } else if let apiResponse = apiResponse {
                                                       print("API Response: \(apiResponse)")
                                                       apiResponseHolder.response = apiResponse
                                                   }
                                               }
                    }
                    
                }
                .environmentObject(apiResponseHolder) // Pass ApiResponseHolder as environment object

        }
    }
}
