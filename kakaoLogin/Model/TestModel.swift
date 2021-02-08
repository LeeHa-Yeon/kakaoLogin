//
//  TestModel.swift
//  kakaoLogin
//
//  Created by 이하연 on 2021/02/08.
//

import UIKit

// 뭘할건지 일단 생각해보자!
// 아까 response받아온 그 데이터들을 담을 녀석을 만들거야 그게 testModel이야 !
// 플레이스네임만일단받아와서 컬렉션뷰에 뿌리자!
//

struct TestModel {
    let place_name : String
    let x : String
    let y : String
    
    init(place_name : String, x : String, y : String){
        self.place_name = place_name
        self.x = x
        self.y = y
    }
}

