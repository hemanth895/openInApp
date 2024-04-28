//
//  Models.swift
//  openInApp
//
//  Created by hemanth on 4/28/24.
//

import Foundation



struct ApiResponse: Codable {
    let status: Bool
    let statusCode: Int
    let message: String
    let support_whatsapp_number: String?
    let extra_income: Double?
    let total_links: Int
    let total_clicks: Int
    let today_clicks: Int
    let top_source: String
    let top_location: String
    let startTime: String
    let links_created_today: Int
    let applied_campaign: Int
    let data: ApiData
    
   
}


struct ApiData: Codable {
    let recent_links: [LinkX]
    let top_links: [LinkX]
    let favourite_links: [LinkX]
    let overall_url_chart:[String:Int]
    
   
  
}


struct LinkX: Codable ,Hashable{
    let url_id: Int
    let web_link: String
    let smart_link: String
    let title: String
    let total_clicks: Int
    let original_image: String
    let thumbnail: String? // It's optional as per the JSON, could be null
    let times_ago: String
    let created_at: String
    let domain_id: String
    let url_prefix: String?
    let url_suffix: String
    let app: String
    let is_favourite: Bool
    
    
    // Provide a custom implementation of the hash(into:) function
        func hash(into hasher: inout Hasher) {
            hasher.combine(url_id)
          
        }
}





struct OverallURLChart: Codable {
    let hour00: Int
    let hour01: Int
    let hour02: Int
    let hour03: Int
    let hour04: Int
    let hour05: Int
    let hour06: Int
    let hour07: Int
    let hour08: Int
    let hour09: Int
    let hour10: Int
    let hour11: Int
    let hour12: Int
    let hour13: Int
    let hour14: Int
    let hour15: Int
    let hour16: Int
    let hour17: Int
    let hour18: Int
    let hour19: Int
    let hour20: Int
    let hour21: Int
    let hour22: Int
    let hour23: Int

    enum CodingKeys: String, CodingKey {
        case hour00 = "00:00"
        case hour01 = "01:00"
        case hour02 = "02:00"
        case hour03 = "03:00"
        case hour04 = "04:00"
        case hour05 = "05:00"
        case hour06 = "06:00"
        case hour07 = "07:00"
        case hour08 = "08:00"
        case hour09 = "09:00"
        case hour10 = "10:00"
        case hour11 = "11:00"
        case hour12 = "12:00"
        case hour13 = "13:00"
        case hour14 = "14:00"
        case hour15 = "15:00"
        case hour16 = "16:00"
        case hour17 = "17:00"
        case hour18 = "18:00"
        case hour19 = "19:00"
        case hour20 = "20:00"
        case hour21 = "21:00"
        case hour22 = "22:00"
        case hour23 = "23:00"
    }
}





class ApiResponseHolder: ObservableObject {
    @Published var response: ApiResponse?
}
