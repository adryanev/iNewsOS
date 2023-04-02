// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ArticleResponse = try ArticleResponse(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseArticleResponse { response in
//     if let ArticleResponse = response.result.value {
//       ...
//     }
//   }
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - ArticleResponse
struct ArticleResponse: Codable, Equatable {
    let source: SourceResponse?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
}

// MARK: ArticleResponse convenience initializers and mutators

extension ArticleResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ArticleResponse.self, from: data)
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
        source: SourceResponse?? = nil,
        author: String?? = nil,
        title: String?? = nil,
        description: String?? = nil,
        url: String?? = nil,
        urlToImage: String?? = nil,
        publishedAt: Date?? = nil,
        content: String?? = nil
    ) -> ArticleResponse {
        return ArticleResponse(
            source: source ?? self.source,
            author: author ?? self.author,
            title: title ?? self.title,
            description: description ?? self.description,
            url: url ?? self.url,
            urlToImage: urlToImage ?? self.urlToImage,
            publishedAt: publishedAt ?? self.publishedAt,
            content: content ?? self.content
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
    
    func toArticle() -> Article {
        return Article(
            id: UUID(),
            source: self.source?.toSource(),
            author: self.author,
            title: self.title,
            description: self.description,
            url: self.url,
            urlToImage: self.urlToImage,
            publishedAt: self.publishedAt,
            content: self.content
        )
    }
}
