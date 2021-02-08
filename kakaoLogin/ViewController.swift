//
//  ViewController.swift
//  kakaoLogin
//
//  Created by 이하연 on 2021/02/07.

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire

//uicollectionview flowlayout -> cell size 정의


let requestUrl : String = "https://dapi.kakao.com/v2/local/search/keyword.json?"
let KAKAO_HEADER : String = "Authorization"
let KAKAO_REST_API_KEY : String = "KakaoAK 842dc7aed8ea2020eae74e87765ed595"


//1. TODO : API 받아와서 호출하기
// 그럼뭐해야함? 알라모파이어써보자
//알라모파이어 뭘로 어케 호출해서 받아오지? 구글 서칭 --> alamofire 사용법
//AF.request 사용하면 되는구나 !
//넣을거 문서보고 잘 넣어보면 되겠다 !
//받아온건 json decoder 로 파싱하면 돠겠네?
// 아 파싱ㄷ 데이터 형식은?? 아 문서보고 그냥 모델만들어서 받아오자

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let emartViewModel = EmartViewModel()
    var arr1 : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
        
    }
    @IBAction func loadData(_ sender: Any) {
//        print("data ------>\(testViewModel.places)")
//        print("arr1 ==> \(arr1)")
        
    }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emartViewModel.places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "haCell", for: indexPath) as? HaCell else {
            return UICollectionViewCell()
        }
        cell.label.text = emartViewModel.places[indexPath.row].place_name
        cell.x_label.text = emartViewModel.places[indexPath.row].x
        cell.y_label.text = emartViewModel.places[indexPath.row].y
//        print("cell places ------ \(emartViewModel.places[indexPath.row].place_name)")
//        print("cell x ------ \(emartViewModel.places[indexPath.row].x)")
//        print("cell y ------ \(emartViewModel.places[indexPath.row].y)")
        return cell
        
    }
}


class HaCell : UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var x_label: UILabel!
    @IBOutlet weak var y_label: UILabel!
    
}


extension ViewController : UICollectionViewDelegate {
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing : CGFloat = 8
        let margin : CGFloat = 8
        let width : CGFloat = (collectionView.bounds.width - spacing - margin*2)/2
        let height : CGFloat = 120
        
        return CGSize(width: width, height: height)
    }
    
}


extension ViewController {
    func request(){
        AF.request(requestUrl, method: .get, parameters: ["query":"이마트"] , headers: [KAKAO_HEADER:KAKAO_REST_API_KEY]).validate(statusCode: 200..<300).responseJSON { response in
            switch(response.result){
            case .success :
                //받아온 녀석을 우리가 사용하는 json형식으로 형변환
                //json data를 우리가 사용하는 string으로 바꿈
                do{
                    let jsonData = try JSONSerialization.data(withJSONObject: response.value, options: .prettyPrinted)
                    let json = try JSONDecoder().decode(Documents.self, from: jsonData)
                    
                    
                    for item in json.documents {
//                        self.arr1.append(item.place_name)
                     
                        self.emartViewModel.addPlace(place_name: item.place_name, x: item.x, y: item.y)
                    }

                }catch let error {
                    print("error --> \(error.localizedDescription)")
                }
            case .failure :
                print("failure")
            default :
                print("default")
            }
           //
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}





//extension ViewController {
//    func request(){
//        AF.request(requestUrl, method: .get, parameters: ["query":"이마트"], headers: [KAKAO_HEADER:KAKAO_REST_API_KEY]).validate(statusCode: 200..<300).responseJSON { response in
//            switch response.result {
//            case .success:
//                //TODO: 포장을 뜯자 ! json -> string
//                do{
//                    let jsonData = try JSONSerialization.data(withJSONObject: response.value, options: .prettyPrinted)
//                    let json = try JSONDecoder().decode(Documents.self, from: jsonData)
//
//                    for item in json.documents {
//                        print("item -->\(item)")
//                    }
//                }catch let error {
//                    print("\(error.localizedDescription)")
//                }
//
//            case .failure:
//                print("fail")
//            default:
//                print("default")
//            }
//        }
//    }
//}
