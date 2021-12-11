//
//  TahminEkrani.swift
//  SayiTahmin
//
//  Created by Berat Yavuz on 9.12.2021.
//

import UIKit

class TahminEkrani: UIViewController {

    @IBOutlet weak var labelKalanHak: UILabel!
    @IBOutlet weak var labelYardim: UILabel!
    @IBOutlet weak var textfieldGirdi: UITextField!
    var rastgeleSayi:Int?
    var kalanHak = 5
    override func viewDidLoad() {
        super.viewDidLoad()
//rastgele sayımızı oluşturuyoruz
        
        rastgeleSayi = Int.random(in: 0...100)
        print(rastgeleSayi!)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // önce burdan gidecek veriyi bool yapıyoruz daha sonra gideceğimiz sayfadan bir nesne oluşturuyoruz ve oraya gönderiyoruz
        if let gelenVeri = sender as? Bool
        {
            let gidilecekVC = segue.destination as? SonucEkrani
            
            gidilecekVC?.sonuc = gelenVeri
        }
    }
    
    @IBAction func tahminet(_ sender: Any)
    {
        labelYardim.isHidden = false
        //hakkımızı bir azalttık
       
        kalanHak = kalanHak-1
        
        //oncelikle girilen veriyi if let ile çekiyoruz
        
        if let veri = textfieldGirdi.text
        {
            //gelen veriyi if let ile dönüştürüyoruz
            
            if let tahmin = Int(veri)
            {
                  // kalan hakkımız sııfr değilse
                if(kalanHak != 0)
                {
                   
                    if tahmin==rastgeleSayi! {
                        //bildi ve öbür ekrana geçti
                        let sonuc = true
                        
                        //eger dogruysa sonuc degiskenini yukarıdaki perform ile öbür sayfaya aktarıcaz
                        performSegue(withIdentifier: "tahmintoSonuc", sender: sonuc)
                        
                    }
                    if tahmin > rastgeleSayi! {
                        // azaltacak
                      
                        labelYardim.text = "Azalt"
                        labelKalanHak.text = "Kalan Hakkınız \(kalanHak)"
                    }
                    if tahmin < rastgeleSayi! {
                        //arttıracak
                        labelYardim.text = "Arttır"
                        labelKalanHak.text = "Kalan Hakkınız \(kalanHak)"
                    }
                }
                else
                {
                    let sonuc = false
                    performSegue(withIdentifier: "tahmintoSonuc", sender: sonuc)
                }
                textfieldGirdi.text = ""
            }
        }
        
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
