//
//  SonucEkrani.swift
//  SayiTahmin
//
//  Created by Berat Yavuz on 9.12.2021.
//

import UIKit

class SonucEkrani: UIViewController {

    @IBOutlet weak var imageViewSonuc: UIImageView!
    @IBOutlet weak var labelSonuc: UILabel!
    var sonuc:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
            self.navigationItem.title = "Sonuç Ekranı"
        
print(sonuc!)
        if sonuc! {
            imageViewSonuc.image = UIImage(named: "mutlu_resim")
            labelSonuc.text = "Tebrikler Kazandınız"
        }
        else{
            imageViewSonuc.image = UIImage(named: "uzgun_resim")
            labelSonuc.text = "Kaybettiniz"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tekrarBaslaButon(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
