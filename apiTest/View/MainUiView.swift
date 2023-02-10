//
//  MainUiView.swift
//  apiTest
//
//  Created by HoHocompany on 2023/02/02.
//

import SwiftUI

struct UrlImage: View{
    let urlString: String
    @State var image: UIImage?
    
    var body: some View {
        if let data = image , let uiimage =  image {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
            
        }else{
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:130, height:70)
                .background(Color.gray)
                .onAppear{
                    fetchImage(from: urlString) { (image) in
                        self.image = image
                        // Use the image
                    }
                    
                }
        }
    }
}

struct MainUiView: View {
    @StateObject var viewModel = CourseViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self){
                    course in
                    HStack{
                        UrlImage(urlString: course.image)
                        Text(course.name)
                    }
                }
            }
            .navigationTitle("Courses")
            .onAppear{
                viewModel.getCourse()
            }
        }
    }
}

struct MainUiView_Previews: PreviewProvider {
    static var previews: some View {
        MainUiView()
    }
}
