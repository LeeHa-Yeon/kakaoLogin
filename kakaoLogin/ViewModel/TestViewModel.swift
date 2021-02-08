//
//  TestViewModel.swift
//  kakaoLogin
//
//  Created by 이하연 on 2021/02/08.
//

import UIKit

//만든이유??
//어떤 데이터 작업을 하는거였찌???
//내가하고싶은 작업이 뭐였지??
// 아까 그 response한 데이터중에서 플레이스네임만 받아서 저장하는거지 어떤 배열에??
// 어떤 배열의 구조를만든게 testModel
// append  작업조차도 다 viewModel이 해야해
// 그냥 어팬드 하고싶어서 만든거임
//

//class Person {
//    static let job : String
//    let name : String
//    let age : Int
//}
//
//let v = Person(name: "asd",age:11)
//let b = Person(name: "qwe",age:22)
//v.name
//Person(name: "asd",age:11).name
//Person.job


class EmartManager{
    static let shared = EmartManager()
    
    var places : [TestModel] = []
    
    func addPlace(_ place_name : String, _ x : String, _ y : String){
        let model = TestModel(place_name: place_name, x:x, y:y)
        places.append(model)
    }
    
    func removeAll(){
        places.removeAll()
    }

    
}

class EmartViewModel {
    private let manager = EmartManager.shared
    
    var places : [TestModel]{
        return manager.places
    }
    
    func addPlace(place_name : String, x : String, y : String){
        return manager.addPlace(place_name,x,y)
    }
    
    func removeAll(){
        return manager.removeAll()
    }
    
}





















//// 데이터(변수) 관리
//class TestManager {
//    // 정적 -> 공용변수 같은 아이
//    static let shared = TestManager()
//
//    var places : [TestModel]=[]
////    var places = [TestModel]()
//
//    func addPlace(_ place_name : String){
//        let model = TestModel(place_name: place_name)
//        places.append(model)
//    }
//}
//
//// 읽기용, 수정불가, 가져오기만 가능
//class TestViewModel {
//    private let manager = TestManager.shared
//
//    var places : [TestModel] {
//        return manager.places
//    }
//
//    func addPlace(place_name : String){
//        return manager.addPlace(place_name)
//    }
//}
























