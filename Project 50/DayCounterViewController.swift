//
//  ViewController.swift
//  Project 50
//
//  Created by Wade Sellers on 10/29/22.
//

import UIKit

// How to increment the saved counter number
extension UserDefaults {
    class func incrementIntegerForKey(key:String) {
        let defaults = standard
        let int = defaults.integer(forKey: "CurrentDayCount")
        defaults.set(int+1, forKey:"CurrentDayCount")
    }
    
    class func decrementIntegerForKey(key:String) {
        let defaults = standard
        let int = defaults.integer(forKey: "CurrentDayCount")
        defaults.set(int-1, forKey:"CurrentDayCount")
    }
}

class DayCounterViewController: UIViewController {
    
    //Quotes
    var quotes = ["Swipe to +/- the counter",
                  "Act as if what you do makes a difference. It does.",
                  "Work like there is someone working 24 hours a day to take it away from you.",
                  "It is when we are most lost that we sometimes find our truest friends.",
                  "Life isn’t finding shelter in the storm. It’s about learning to dance in the rain.",
                  "When you have a dream, you've got to grab it and never let go.",
                  "Everything that’s broken was beautiful at one time. And our mistakes make us better people.",
                  "I can't change the direction of the wind, but I can adjust my sails to always reach my destination.",
                  "Just because someone stumbles and loses their path, doesn’t mean they’re lost forever.",
                  "Believe you can and you're halfway there.",
                  "No matter what you're going through, there's a light at the end of the tunnel.",
                  "Nurture your mind with great thoughts. To believe in the heroic makes heroes.",
                  "I think I can. I think I can. I think I can. I know I can.",
                  "It is our attitude at the beginning of a difficult task which, more than anything else, will affect its successful outcome.",
                  "Life is like riding a bicycle. To keep your balance, you must keep moving.",
                  "To find something, anything, a great truth or a lost pair of glasses, you must first believe there will be some advantage in finding it.",
                  "Perfection is not attainable, but if we chase perfection we can catch excellence.",
                  "There should be no boundaries to human endeavor. We are all different. However bad life may seem, there is always something you can do, and succeed at. While there’s life, there is hope.",
                  "I am the master of my fate: I am the captain of my soul.",
                  "Just don't give up trying to do what you really want to do. Where there is love and inspiration, I don't think you can go wrong.",
                  "Nothing is impossible. The word itself says: 'I'm possible!",
                  "You are never too old to set another goal or to dream a new dream.",
                  "Out of difficulties grow miracles.",
                  "You must do the things you think you cannot do.",
                  "You're braver than you believe, stronger than you seem, and smarter than you think.",
                  "We can’t retract the decisions we’ve made. We can only affect the decisions we’re going to make from here.",
                  "When a defining moment comes along, you can do one of two things. Define the moment, or let the moment define you.",
                  "If opportunity doesn't knock, build a door.",
                  "I will love the light for it shows me the way, yet I will endure the darkness because it shows me the stars.",
                  "It does not matter how slowly you go as long as you do not stop.",
                  "If I cannot do great things, I can do small things in a great way.",
                  "With the right kind of coaching and determination you can accomplish anything.",
                  "It always seems impossible until it's done.",
                  "Ambition is the path to success. Persistence is the vehicle you arrive in.",
                  "By perseverance the snail reached the ark.",
                  "Success is not final, failure is not fatal: it is the courage to continue that counts.",
                  "Whether you think you can or think you can't you're right.",
                  "Successful men and women keep moving. They make mistakes, but they don’t quit.",
                  "Failure happens all the time. It happens every day in practice. What makes you better is how you react to it.",
                  "Giving up is for rookies.",
                  "Never bend your head. Always hold it high. Look the world straight in the eye.",
                  "Part of being a champ is acting like a champ. You have to learn how to win and not run away when you lose.",
                  "What you get by achieving your goals is not as important as what you become by achieving your goals.",
                  "Never give up, for that is just the place and time that the tide will turn.",
                  "In every job that must be done, there is an element of fun. You find the fun and—snap!—the job’s a game!",
                  "If you fall behind, run faster. Never give up, never surrender, and rise up against the odds.",
                  "Hope is a good thing, maybe the best of things, and no good thing ever dies.",
                  "Survival can be summed up in three words—never give up. That’s the heart of it really. Just keep trying.",
                  "It always seems impossible until it’s done.",
                  "I know from experience that you should never give up on yourself or others, no matter what.",
                  "Congrats! You've completed Project 50. You should be incredibly proud of yourself."
    ]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "Day \(UserDefaults.standard.integer(forKey: "CurrentDayCount").codingKey.stringValue)"
        messageLabel.text = quotes[UserDefaults.standard.integer(forKey: "CurrentDayCount")]
        adjustTitleMessage()

    }

    @IBAction func onSwipeRight(_ sender: UISwipeGestureRecognizer) {
        print("swipe right")
        let currentCount = UserDefaults.standard.integer(forKey: "CurrentDayCount")
        if currentCount >= 1 && currentCount <= 50 {
            UserDefaults.decrementIntegerForKey(key: "CurrentDayCount")
            countLabel.text = "Day \(UserDefaults.standard.integer(forKey: "CurrentDayCount").codingKey.stringValue)"
            
            messageLabel.text = quotes[UserDefaults.standard.integer(forKey: "CurrentDayCount")]
        } else {
            //Do nothing. We don't wanna go into negatives
        }
        
        adjustTitleMessage()
    }
    
    @IBAction func onSwipeLeft(_ sender: UISwipeGestureRecognizer) {
        print("swipe left")
        let currentCount = UserDefaults.standard.integer(forKey: "CurrentDayCount")
        if currentCount >= 0 && currentCount <= 49 {
            UserDefaults.incrementIntegerForKey(key: "CurrentDayCount")
            countLabel.text = "Day \(UserDefaults.standard.integer(forKey: "CurrentDayCount").codingKey.stringValue)"
            
            messageLabel.text = quotes[UserDefaults.standard.integer(forKey: "CurrentDayCount")]
        } else {
            //Do nothing. We're at 50. The challenge is done.
        }
        
        adjustTitleMessage()
        
    }
    
    func adjustTitleMessage() {
        if UserDefaults.standard.integer(forKey: "CurrentDayCount") == 25 {
            titleLabel.text = "Halfway Day! You got this!"
        } else if UserDefaults.standard.integer(forKey: "CurrentDayCount") == 0 {
            titleLabel.text = "Welcome to Project 50"
        } else if UserDefaults.standard.integer(forKey: "CurrentDayCount") == 50 {
            titleLabel.text = "CONGRATS! You did it!!!"
        } else {
            titleLabel.text = "Project 50"
        }
    }
    
    
    
}

