//
//  ViewController.swift
//  Movie List
//
//  Created by Aleksandr Morozov on 16.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let movieDict = [
        
        ["name": "Avengers: Endgame",
         "release date": "2019",
         "image": "avengersPoster",
         "description":
"""
            Avengers: Endgame is a 2019 American superhero film based on the Marvel Comics superhero team the Avengers. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the direct sequel to Avengers: Infinity War (2018) and the 22nd film in the Marvel Cinematic Universe (MCU). Directed by Anthony and Joe Russo and written by Christopher Markus and Stephen McFeely, the film features an ensemble cast including Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Don Cheadle, Paul Rudd, Brie Larson, Karen Gillan, Danai Gurira, Benedict Wong, Jon Favreau, Bradley Cooper, Gwyneth Paltrow, and Josh Brolin. In the film, the surviving members of the Avengers and their allies attempt to reverse the destruction caused by Thanos in Infinity War.
"""
        ],
        
        ["name": "Spider-Man: No Way Home",
         "release date": "2021" ,
         "image": "spiderPoster",
         "description":
"""
            Spider-Man: No Way Home is a 2021 American superhero film based on the Marvel Comics character Spider-Man co-produced by Columbia Pictures and Marvel Studios and distributed by Sony Pictures Releasing. It is the sequel to Spider-Man: Homecoming (2017) and Spider-Man: Far From Home (2019), and is the 27th film in the Marvel Cinematic Universe. The film is directed by Jon Watts, written by Chris McKenna and Erik Sommers, and stars Tom Holland as Peter Parker / Spider-Man alongside Zendaya, Benedict Cumberbatch, Jacob Batalon, Jon Favreau, Jamie Foxx, Willem Dafoe, Alfred Molina, Benedict Wong, Tony Revolori, Marisa Tomei, Andrew Garfield, and Tobey Maguire.
"""
        ],
        
        ["name": "The Matrix Ressurection",
         "release date": "2021",
         "image": "matrixPoster",
         "description":
"""
            The Matrix Resurrections is a 2021 American science fiction action film produced, co-written, and directed by Lana Wachowski. It is the sequel to The Matrix Revolutions (2003) and the fourth installment in The Matrix film series. Keanu Reeves, Carrie-Anne Moss, Lambert Wilson, and Jada Pinkett Smith reprise their roles from previous films in the series, being joined by Yahya Abdul-Mateen II, Jessica Henwick, Jonathan Groff, Neil Patrick Harris, Priyanka Chopra Jonas, and Christina Ricci. The film was produced by Village Roadshow Pictures and Venus Castina Productions and distributed by Warner Bros. Pictures.
"""
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = movieDict[indexPath.row]["name"]
        cell.detailTextLabel?.text = movieDict[indexPath.row]["release date"]
        cell.imageView?.image = UIImage(named: movieDict[indexPath.row]["image"]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as? MovieDetailsVC else { return }
        vc.dic = movieDict[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
