import Cocoa
import Foundation

func direBonjour(a prenom : String){
    "Bonjour \(prenom)"
}
let direBonjourFunction = direBonjour
direBonjourFunction("awa")
// forme de closture
let direBonjourClosture = { (prenom : String) -> String in
    return "Bonjour \(prenom)"
    
}
direBonjourClosture("cecile")
//closture sans parametre et valeur de retour
let afficherBananeClosture = {() -> Void in
    print("banae")
    
}
