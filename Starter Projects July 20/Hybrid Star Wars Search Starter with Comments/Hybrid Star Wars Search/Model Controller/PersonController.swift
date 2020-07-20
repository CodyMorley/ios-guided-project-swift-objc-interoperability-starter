//
//  PersonController.swift
//  Hybrid Star Wars Search
//
//  Created by Spencer Curtis on 1/28/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import Foundation

@objc class PersonController: NSObject {
    
    // Star Wars API docs: https://lambdaswapi.herokuapp.com/people
    private let baseURL = URL(string: "https://lambdaswapi.herokuapp.com/api/people")!
    
    @objc(sharedController) static let shared = PersonController()
    
    @objc(searchForPeopleWithSearchTerm:completionBlock:)
    func searchForPeople(with searchTerm: String, completion: @escaping ([Person]?, Error?) -> Void) {
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchItem = URLQueryItem(name: "search", value: searchTerm)
        components.queryItems = [searchItem]
        let url = components.url!
        
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            print("url: \(url)")
            if let error = error {
                return completion(nil, error)
            }
            
            guard let data = data else {
                return completion(nil, NSError())
            }
            
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
                    let personDictionaries = dictionary["results"] as? [[String : Any]] else {
                        throw NSError()
                }
                
                let people = personDictionaries.compactMap { Person(dictionary: $0) }
                completion(people, nil)
            } catch {
                return completion(nil, error)
            }
            
        }.resume()
    }
}
