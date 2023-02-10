//
//  CourseViewModel.swift
//  apiTest
//
//  Created by HoHocompany on 2023/02/02.
//

import Foundation

class CourseViewModel : ObservableObject {
    @Published var courses : [Course] = []
    
    func getCourse(){
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, _,
            error in
            guard let data = data, error == nil else {
                return
            }
            
            //convert to json
            do{
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.courses = courses
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
 
    
}
