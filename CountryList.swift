//
//  CountryList.swift
//  COVID19inData
//
//  Created by Carlos Barraza on 07/01/21.
//

import Foundation
import UIKit

class CountryList: UITableViewController {
    
    var countries: CountryData? = nil
    var countryList: [String] = []
    var countryCodes: [String] = []
    var continents: [String] = []
    var populations: [Int] = []
    var medianAges: [NSNumber] = []
    
    var TotCases: [Int] = []
    var NewCases: [Int] = []
    var NewDeaths: [Int] = []
    var dates: [String] = []

    var db = UserDefaults.standard
    var sectionsDict: [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryList = []
        self.countryCodes = []
        self.continents = []
        self.continents = []
        self.populations = []
        self.medianAges = []
        self.TotCases = []
        self.NewCases = []
        self.NewDeaths = []
        self.dates = []
    
        guard let url = URL(string: "https://covid.ourworldindata.org/data/owid-covid-data.json") else {
            return
            }
            
        URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
            guard let data = data else {
                return
            }
                
            do {
                let entries = try JSONDecoder().decode(CountryData.self, from: data)
                
                self.countries = entries
                
                if let parsedResult = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String:Any],
                   let resultDic = parsedResult as? [String:[String:Any]] {
        
                    for key in resultDic.keys {
                        countryCodes.append(key)
                     }

                    countryCodes.sort()
                    
                    for code in countryCodes {
                        countryList.append(resultDic[code]?["location"] as? String ?? "N/A")
                        
                        countryList.sort()

                        let datum = resultDic[code]?["data"] as! [[String: Any]]
                        let dummy = datum[datum.count - 1]
                        
                        TotCases.append(dummy["total_cases"] as? Int ?? 0)
                        NewCases.append(Int(dummy["new_cases"] as? Float ?? 0.0))
                        NewDeaths.append(dummy["new_deaths"] as? Int ?? 0)
                        dates.append(dummy["date"] as? String ?? "N/A")
                    
                    }
                    
                    for item in countryList {
                        for code in countryCodes {
                            if item == resultDic[String(code)]?["location"] as! String {
                                continents.append(resultDic[code]?["continent"] as? String ?? "World")
                                populations.append(resultDic[code]?["population"] as? Int ?? 0)
                                medianAges.append(resultDic[code]?["median_age"] as? NSNumber ?? 0.0)
                            }
                        }
                    }
          
                }
                
                for country in countryList {
                    
                    if sectionsDict[String(country.prefix(1))] == nil {
                        sectionsDict[String(country.prefix(1))] = []
                        sectionsDict[String(country.prefix(1))]?.append(String(country))
                        
                    } else {
                        sectionsDict[String(country.prefix(1))]?.append(String(country))
                    }
                }
                
                for key in sectionsDict.keys {
                    sectionsDict[key]?.sort()
                }
                
                print ("SectionsDict: ", sectionsDict)
                print ("CountryList: ", countryList)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch let error {
                print(error)
            }
        }.resume()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsDict.count
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return sectionsDict[sectionsDict.keys.sorted()[section]]!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        
        let cellName = sectionsDict[sectionsDict.keys.sorted()[indexPath.section]]![indexPath.row]
        
        cell.textLabel?.text = cellName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "CountryInfoSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return sectionsDict.keys.sorted()[section]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "CountryInfoSegue",
           let _ = tableView.indexPathForSelectedRow?.row {
            
            var suma = 0
            var newIndex = 0
            var sobrantes = 0
            
            guard let section = tableView.indexPathForSelectedRow?.section else { return }
            
            print("section: ", section)
        
            for item in 0 ..< section + 1  {
                suma += tableView.numberOfRows(inSection: item)
            }
            
            sobrantes = tableView.numberOfRows(inSection: tableView.indexPathForSelectedRow!.section) -  tableView.indexPathForSelectedRow!.row
            
            newIndex = suma - sobrantes
            
            print("Suma: \(suma), sobrantes: \(sobrantes), newIndex: \(newIndex)")
            

            db.set(countryCodes[newIndex], forKey: "1")
            db.set(countryList[newIndex], forKey: "2")
            db.set(continents[newIndex], forKey: "3")
            db.set(populations[newIndex], forKey: "4")
            db.set(medianAges[newIndex], forKey: "5")
            db.set(TotCases[newIndex], forKey: "6")
            db.set(NewCases[newIndex], forKey: "7")
            db.set(NewDeaths[newIndex], forKey: "8")
            db.set(dates[newIndex], forKey: "9")
   
        }
    }
    
}
