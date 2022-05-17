//
//  MyHomeViewController.swift
//  Project
//
//  Created by Asma hassan on 3/11/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import SideMenu

class MyHomeViewController: UIViewController {
    var menu :SideMenuNavigationController?

     @IBOutlet weak var userName: UILabel!
       @IBOutlet weak var watch: UIButton!
       
       @IBOutlet weak var examples: UIButton!
       
       
       @IBOutlet weak var note: UIButton!
       var name = ""
       
    override func viewDidLoad() {
        super.viewDidLoad()
 self.userName.text = self.name

  setUpElements()
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)

        // Do any additional setup after loading the view.
    }

    
    func setUpElements(){
        Utilities.styleCircleButton(watch)
        Utilities.styleCircleButton(examples)
        Utilities.styleCircleButton(note)

        
    }
    
    @IBAction func watchdidTap(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "YoutubeViewController") as? YoutubeViewController
            else{
        return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func exampledidTap(_ sender: Any) {
    }
    @IBAction func notedidTap(_ sender: Any) {
            guard let vc = storyboard?.instantiateViewController(identifier: "ListNotesViewController") as? ListNotesViewController
                else{
            return
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    
    @IBAction func didTapMenu(){
        present(menu!,animated: true)
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
class MenuListController: UITableViewController{
    @IBOutlet var modeSwitch : UISwitch!
    
    var items = ["First","Second","asss","aaa"]
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = darkColor
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func valueChanged (_ sender: Any){
        
    }

}
