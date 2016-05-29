import XCTest
import APIKit
import XCTest

class JSONDataParserTests: XCTestCase {
    func testContentType() {
        let parser = JSONDataParser(readingOptions: [])
        XCTAssertEqual(parser.contentType, "application/json")
    }
    
    func testJSONSuccess() {
        let string = "{\"foo\": 1, \"bar\": 2, \"baz\": 3}"
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        let parser = JSONDataParser(readingOptions: [])

        do {
            let object = try parser.parseData(data)
            let dictionary = object as? [String: Int]
            XCTAssertEqual(dictionary?["foo"], 1)
            XCTAssertEqual(dictionary?["bar"], 2)
            XCTAssertEqual(dictionary?["baz"], 3)
        } catch {
            XCTFail()
        }
    }
}
