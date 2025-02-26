//
//  Question.swift
//  project personality quiz
//
//  Created by Sasha Cummings on 2/21/25.
//

import UIKit

var questionIndex = 0

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
enum ResponseType {
    case single, multiple, ranged
}
struct Answer {
    var text: String
    var type: AnimalType
    
    enum AnimalType: String {
        case dragon = "Dragon", murmaid = "Murmaid", pheonix = "Pheonix", unicorn = "Unicorn"
        
        var definition: String {
            
            switch self {
                
            case .dragon:
                return "You are courageous and are not afraid of challenges and willing to take the risk even if it means braking away from tradition. You are also intelligent and naturally lucky and gifted!   You enjoy setting ambitious goals but sometimes you give up or are unwilling to admit  when you are wrong. You are very popular among friends and family and you are passionate with relationships."
                
            case .murmaid:
                return "You are beautiful  inside and out! You are also very protective of others around you. You also love to sing. You are very headstrong and  sometimes  may refuse to conform to your values or status quo. You are also fiercely independent  and may refuse to also compromise with how others choose to live there lives. You like to be able to do as you please whenever you choose."
                
            case .pheonix:
                return "You have a habit of never giving up, even when your falling in life, you get back up. You are also full of life like the sun. You are confident  assertive and reliable and trustworthy . You are also a natural leader and you lead by example. You are also creative and bright."
                
            case .unicorn:
                return "You are a natural healer both physically and mentally. You are kind and empathetic, and enjoy helping others. You do everything to stay positive because your a positive person. You have childlike wonder, innocence and curiosity about the world. You are also very wise beyond your years. You are gentle yet resilient in nature."
            }
        }
    }
}



