// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let SourceResponse = try SourceResponse(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSourceResponse { response in
//     if let SourceResponse = response.result.value {
//       ...
//     }
//   }
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation
import Alamofire

// MARK: - SourceResponse
struct SourceResponse: Codable, Equatable {
    let id: String?
    let name: String
}

// MARK: SourceResponse convenience initializers and mutators

extension SourceResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SourceResponse.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String?? = nil,
        name: String? = nil
    ) -> SourceResponse {
        return SourceResponse(
            id: id ?? self.id,
            name: name ?? self.name
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
    
    func toSource() -> Source {
        return Source(id: self.id, name: self.name)
    }
}
