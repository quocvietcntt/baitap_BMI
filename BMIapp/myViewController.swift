//
//  myViewController.swift
//  BMIapp
//
//  Created by apple on 2024/09/06.
//

import UIKit

class myViewController: UIViewController {
    
    @IBOutlet weak var loikhuyen_Lable: UILabel!
    @IBOutlet weak var hientrang_Lable: UIView!
    @IBOutlet weak var ketqua_Lable: UILabel!
    @IBOutlet weak var chisoBMI_Lable: UILabel!
    @IBOutlet weak var range_Lable: UILabel!
    @IBOutlet weak var chiso_Lable: UILabel!
    
    var mangkhuyenrang:[String]!
    var mangchiso:[String]!
    var mangso:[String]!
    var BMIgioitinh:String!
    var BMItuoi:Int!
    var BMIchieucao:Int!
    var BMIcannang:Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mangkhuyenrang = ["bạn nên ăn nhiều và đi tập gym thường xuyên","cơ thể bình thường ,chúc mừng bạn có sức khoẻ tốt","Bạn nên hạn chế ăn vì ăn nhiều không tốt cho sức khoẻ của bạn hiện tại","Bạn đang béo phì độ 1 , tốt nhất ăn ít,tập tạ","Bạn đang béo phì độ 2,nên đi bác sỹ để điều chỉnh lại cơ thể"]
        mangchiso = ["Thin BMI range","Normal BMI range","Gain BMI range","Grade I obesity","Grade I obesity"]
        mangso = ["< 18.5 kg/m2","18.5 - 22.9 kg/m2",">= 23 - 24.9 kg/m2","55 - 29.9 kg/m2",">= 30"]
        
        ketqua()
    }
    
    func ketqua() {
        let quydoi:Float = Float(BMIchieucao)/100
        let weight:Float = BMIcannang/(quydoi * quydoi)
        let formattedWeight = String(format: "%.1f", weight)
        chisoBMI_Lable.text = String(formattedWeight)
        
        if weight < 18.5{
            ketqua_Lable.text = "Gầy"
            loikhuyen_Lable.text = mangkhuyenrang.first
            chiso_Lable.text = mangchiso.first
            range_Lable.text = mangso.first
        }else if weight > 18.5 && weight < 22.9{
            ketqua_Lable.text = "NORMAL"
            loikhuyen_Lable.text = mangkhuyenrang[1]
            chiso_Lable.text = mangchiso[1]
            range_Lable.text = mangso[1]
        }else if weight >= 23 && weight < 24.9{
            ketqua_Lable.text = "Nguy Cơ Tăng Cân"
            loikhuyen_Lable.text = mangkhuyenrang[2]
            chiso_Lable.text = mangchiso[2]
            range_Lable.text = mangso[2]
        }else if weight > 25 && weight < 29.9{
            ketqua_Lable.text = "Béo Phì Độ I"
            loikhuyen_Lable.text = mangkhuyenrang[3]
            chiso_Lable.text = mangchiso[3]
            range_Lable.text = mangso[3]
        }else{
            ketqua_Lable.text = "Béo Phì Độ II"
            loikhuyen_Lable.text = mangkhuyenrang.last
            chiso_Lable.text = mangchiso.last
            range_Lable.text = mangso.last
        }
    }

    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
