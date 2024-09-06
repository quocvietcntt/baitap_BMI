//
//  ViewController.swift
//  BMIapp
//
//  Created by apple on 2024/09/04.
//

import UIKit

class ViewController: UIViewController {

    var chieucao:Int!
    var tuoi:Int!
    var cannang:Float!
    var gioitinh:String!
    
    @IBOutlet weak var age_Lable: UILabel!
    @IBOutlet weak var wight_tru_Lable: UILabel!
    @IBOutlet weak var heightLable: UILabel!
    var mangGioiTinh:[String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        mangGioiTinh = []
    }

    @IBAction func xulynu(_ sender: UITapGestureRecognizer) {
        mangGioiTinh.append("Female")
    }
    
    @IBAction func xuly(_ sender: UITapGestureRecognizer) {
        mangGioiTinh.append("Male")
    }
    
    @IBAction func slider(_ sender: UISlider) {
        let value1 = String(format: "%.0f", sender.value)
        chieucao = Int(value1)!
        heightLable.text = String(chieucao)
    }
    
    @IBAction func wight_taget_tru(_ sender: Any) {
        wight_tru_Lable.text = String(Float(wight_tru_Lable.text!)! - 0.5)
        cannang = Float(wight_tru_Lable.text!)!
    }
    
    @IBAction func wight_taget_add(_ sender: UITapGestureRecognizer) {
        wight_tru_Lable.text = String(Float(wight_tru_Lable.text!)! + 0.5)
        cannang = Float(wight_tru_Lable.text!)!
    }
    
    @IBAction func age_tager_tru(_ sender: Any) {
        age_Lable.text = String(Int(age_Lable.text!)! - 1)
        tuoi = Int(age_Lable.text!)!
    }
    
    @IBAction func age_taget_add(_ sender: UITapGestureRecognizer) {
        age_Lable.text = String(Int(age_Lable.text!)! + 1)
        tuoi = Int(age_Lable.text!)!
    }
    
    @IBAction func TinhToanBMI(_ sender: Any) {
        if mangGioiTinh.isEmpty{
            let alert = UIAlertController(title: "Thông Báo", message: "Bạn Chưa Chọn Giới Tính Hoặc Chiều Cao", preferredStyle: UIAlertController.Style.alert)
            let nutok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(nutok)
            present(alert, animated: true, completion: nil)
        }
        else{
            let st = UIStoryboard(name: "Main", bundle: nil)
            let manhinh = st.instantiateViewController(withIdentifier: "cell") as! myViewController
            manhinh.BMIcannang = cannang
            manhinh.BMIchieucao = chieucao
            manhinh.BMItuoi = tuoi
            manhinh.BMIgioitinh = mangGioiTinh.last
            self.navigationController?.pushViewController(manhinh, animated: true)
        }
        
    }
}

