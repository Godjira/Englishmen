//
//  Sentence.swift
//  Englishman
//
//  Created by Godjira on 12/11/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Pack: Codable {
    let namePack: String
    let sentences: [Sentence]
}

// MARK: Welcome convenience initializers and mutators

extension Pack {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Pack.self, from: data)
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
        namePack: String? = nil,
        sentences: [Sentence]? = nil
    ) -> Pack {
        return Pack(
            namePack: namePack ?? self.namePack,
            sentences: sentences ?? self.sentences
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Sentence
struct Sentence: Codable {
    let en, ru: String
}

// MARK: Sentence convenience initializers and mutators

extension Sentence {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Sentence.self, from: data)
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
        en: String? = nil,
        ru: String? = nil
    ) -> Sentence {
        return Sentence(
            en: en ?? self.en,
            ru: ru ?? self.ru
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
