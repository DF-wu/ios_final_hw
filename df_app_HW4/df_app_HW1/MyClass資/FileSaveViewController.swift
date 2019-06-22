//
//  FileSaveViewController.swift
//  df_app_HW1
//
//  Created by Chu Fei on 2019/6/19.
//  Copyright © 2019 Chu Fei. All rights reserved.
//

import UIKit

class FileSaveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    struct Song: Codable {
        var artistName: String
        var trackName: String
        var collectionName: String?
        var previewUrl: URL
        var artworkUrl100: URL
        var trackPrice: Double?
        var releaseDate: Date
        var isStreamable: Bool?
    }
    
    struct SongResults: Codable {
        var resultCount: Int
        var results: [Song]
    }
    
    
    
    struct Towns : Codable {
        var id :Int
        var TownName :String
        var PostNumber :Int
        
    }
    
    struct City :Codable {
        var CityID :Int
        var CityName :String
        var TownsList :[Towns]
    }
    
    struct TaiwanData :Codable {
        var CityList : [City]
    }
    
    
    // https://works.ioa.tw/weather/api/all.json
    

    
    @IBAction func getJson(_ sender: UIButton) {
        
        var taiwan :TaiwanData
        
        //https://works.ioa.tw/weather/api/doc/index.html
        let urlStr = "https://works.ioa.tw/weather/api/all.json"
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url)
            {
                (data, response , error) in
                    let decoder = JSONDecoder()
                    do
                    {
                        let taiwan = try? JSONDecoder().decode( [City].self, from: data!)
                        for item in taiwan!
            
//                        if let data = data, let taiwan = try?
//                            decoder.decode( TaiwanData.self, from: data)
                        {
                            
                            print(taiwan)
                            
                            //                    for iterCity in taiwan.CityList {
                            //                        print(iterCity.CityID)
                            //                        print(iterCity.CityName)
                            //
                            //                        for iterTowns in iterCity.TownsList
                            //                        {
                            //                            print(iterTowns.id)
                            //                            print(iterTowns.TownName)
                            //                        }
                            //
                            //                    }
                            
                            
                      
                        }
                    }
                        
                    catch {
                        print(error)
                    }
                
            }
            task.resume()
        }
        
        
        
    
        
        
        
    }
    
    
}
