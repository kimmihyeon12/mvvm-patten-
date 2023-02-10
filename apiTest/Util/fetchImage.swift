//
//  fetchImage.swift
//  apiTest
//
//  Created by HoHocompany on 2023/02/02.
//

import Foundation
import SwiftUI

func fetchImage(from url: String, completion: @escaping (UIImage?) -> Void) {
    let imgUrl = URL(string: url)!`;
        URLSession.shared.dataTask(with: imgUrl) { (data, response, error) in
            if let error = error {
                print("Error fetching image: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Error creating image from data")
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
}

  




