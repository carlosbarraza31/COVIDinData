//
//  CountryInfo.swift
//  COVID19inData
//
//  Created by Carlos Barraza on 07/01/21.
//

import Foundation
import UIKit

class CountryInfo: UIViewController {
    
    @IBOutlet var CountryName: UILabel!
    @IBOutlet var Population: UILabel!
    @IBOutlet var MedianAge: UILabel!
    @IBOutlet var Continente: UILabel!
    
    @IBOutlet var TotalCases: UILabel!
    @IBOutlet var NewCases: UILabel!
    @IBOutlet var NewDeaths: UILabel!
    @IBOutlet var upDate: UILabel!
    
    var CountryCode: String = ""
    var Nombre: String = ""
    var Continent: String = ""
    var habitantes: Int = 0
    var EdadMedia: Double = 0.0
    var CasosTot: Int = 0
    var NuevosCasos: Int = 0
    var NuevasMuertes: Int = 0
    var fecha: String = ""
    
    var db = UserDefaults.standard

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CountryCode = UserDefaults.standard.object(forKey: "1") as! String
        Nombre = UserDefaults.standard.object(forKey: "2")! as! String
        Continent = UserDefaults.standard.object(forKey: "3")! as! String
        habitantes = UserDefaults.standard.object(forKey: "4")! as! Int
        EdadMedia = UserDefaults.standard.object(forKey: "5")! as! Double
        CasosTot = UserDefaults.standard.object(forKey: "6")! as! Int
        NuevosCasos = UserDefaults.standard.object(forKey: "7")! as! Int
        NuevasMuertes = UserDefaults.standard.object(forKey: "8")! as! Int
        fecha = UserDefaults.standard.object(forKey: "9")! as! String
    
        Continente.text = ""
        CountryName.text = ""
        Population.text = ""
        MedianAge.text = ""
        
        TotalCases.text = ""
        NewCases.text = ""
        NewDeaths.text = ""
        upDate.text = ""
        
        loadTexts()
        
    }
    
    func loadTexts() {
        DispatchQueue.main.async {
            self.Continente.text = self.Continent
            self.CountryName.text = self.Nombre
            self.Population.text = String(self.habitantes)
            self.TotalCases.text = String(self.CasosTot)
            self.NewCases.text = String(self.NuevosCasos)
            self.NewDeaths.text = String(self.NuevasMuertes)
            self.MedianAge.text = String(self.EdadMedia)
            self.upDate.text = self.fecha
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        UserDefaults.resetStandardUserDefaults()
    }
        
}

