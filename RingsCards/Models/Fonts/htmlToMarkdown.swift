//
//  htmlToMarkdown.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.11.23.
//

import SwiftUI
import RegexBuilder

extension String {
    func htmlToMarkDown() -> String {

        var text = self

        var loop = true

        // Replace HTML comments, in the format <!-- ... comment ... -->
        // Stop looking for comments when none is found
        while loop {

            // Retrieve hyperlink
            let searchComment = Regex {
                Capture {

                    // A comment in HTML starts with:
                    "<!--"

                    ZeroOrMore(.any, .reluctant)

                    // A comment in HTML ends with:
                    "-->"
                }
            }
            if let match = text.firstMatch(of: searchComment) {
                let (_, comment) = match.output
                text = text.replacing(comment, with: "")
            } else {
                loop = false
            }
        }

        // Replace line feeds with nothing, which is how HTML notation is read in the browsers
        text = self.replacing("\r\n", with: "\n")

        // Line breaks
        text = text.replacing("<div>", with: "\n")
        text = text.replacing("</div>", with: "\n")
        text = text.replacing("<p>", with: "\n")
        text = text.replacing("<br>", with: "\n")

        // Text formatting
        text = text.replacing("<strong>", with: "**")
        text = text.replacing("</strong>", with: "**")
        text = text.replacing("<b>", with: "**")
        text = text.replacing("</b>", with: "**")
        text = text.replacing("<em>", with: "*")
        text = text.replacing("</em>", with: "*")
        text = text.replacing("<i>", with: "*")
        text = text.replacing("</i>", with: "*")
        text = text.replacing(/[ \n]?<cite>[ ]?/, with: "\n—*")
        text = text.replacing("</cite>", with: "*")

        // Replace hyperlinks block
        loop = true

        // Stop looking for hyperlinks when none is found
        while loop {

            // Retrieve hyperlink
            let searchHyperlink = Regex {

                // A hyperlink that is embedded in an HTML tag in this format: <a... href="<hyperlink>"....>
                "<a"

                // There could be other attributes between <a... and href=...
                // .reluctant parameter: to stop matching after the first occurrence
                ZeroOrMore(.any)

                // We could have href="..., href ="..., href= "..., href = "...
                "href"
                ZeroOrMore(.any)
                "="
                ZeroOrMore(.any)
                "\""

                // Here is where the hyperlink (href) is captured
                Capture {
                    ZeroOrMore(.any)
                }

                "\""

                // After href="<hyperlink>", there could be a ">" sign or other attributes
                ZeroOrMore(.any)
                ">"

                // Here is where the linked text is captured
                Capture {
                    ZeroOrMore(.any, .reluctant)
                }
                One("</a>")
            }
                .repetitionBehavior(.reluctant)

            if let match = text.firstMatch(of: searchHyperlink) {
                let (hyperlinkTag, href, content) = match.output
                let markDownLink = "[" + content + "](" + href + ")"
                text = text.replacing(hyperlinkTag, with: markDownLink)
            } else {
                loop = false
            }
        }

        return text
    }
}
