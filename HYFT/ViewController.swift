//
//  ViewController.swift
//  HYFT
//
//  Created by Zac on 28/11/16.
//  Copyright © 2016 zeta. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var messageTextField: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .hyftBar
        touchBar.defaultItemIdentifiers = [.infoLabelItem, .joyEmojiItem, .sadEmojiItem, .angryEmojiItem, .flexibleSpace, .otherItemsProxy]
        return touchBar
    }


    func getMessageBaseOnReaction(_ reaction: String) -> String {
        switch reaction {
        case "😂":
            return "Being happy never goes out of style. - Lilly Pulitzer"
        case "😟":
            return "Sadness flies away on the wings of time. - Jean de La Fontaine"
        case "😡":
            return "To be angry is to revenge the faults of others on ourselves. - Alexander Pope"
        default:
            return "Look like our quote does not cater to this reaction"
        }
    }

    //Quotes are extracted from https://www.brainyquote.com
    func showMessageBaseOnReaction(_ reaction: String) {
        messageTextField.isHidden = false
        messageTextField.stringValue = getMessageBaseOnReaction(reaction)
    }

    //MARK: IBActions
    @IBAction func buttonPressed(_ sender: NSButton) {
        showMessageBaseOnReaction(sender.title)
    }

}

@available(OSX 10.12.2, *)
extension ViewController: NSTouchBarDelegate {

    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let custom = NSCustomTouchBarItem(identifier: identifier)

        switch identifier {
        case NSTouchBarItemIdentifier.infoLabelItem:
            let label = NSTextField.init(labelWithString: NSLocalizedString("How do you feel today?", comment:""))
            custom.view = label

        case NSTouchBarItemIdentifier.joyEmojiItem:
            custom.view = NSButton(title: NSLocalizedString("😂", comment:""), target: self, action: #selector(buttonPressed(_:)))

        case NSTouchBarItemIdentifier.sadEmojiItem:
            custom.view = NSButton(title: NSLocalizedString("😟", comment:""), target: self, action: #selector(buttonPressed(_:)))

        case NSTouchBarItemIdentifier.angryEmojiItem:
            custom.view = NSButton(title: NSLocalizedString("😡", comment:""), target: self, action: #selector(buttonPressed(_:)))

        default:
            return nil
        }
        return custom
    }
}

