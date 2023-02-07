//
//  JSONDecoderdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-07.
//

import Foundation

public struct QuoteResponse: Decodable {
    public let data: [Quote]?
    public let error: ErrorResponse?
    
    // parent containers
    enum CodingKeys: CodingKey {
        case quoteResponse
        case finance
    }
    
    // data containers to be decoded
    enum ResponseKeys: CodingKey {
        case result
        case error
    }
    
    public init(from decoder: Decoder) throws {
        // decode parent container first: CodingKeys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // decode the keys containing data next: ResponseKeys
        if let quoteResponseContainer = try? container.nestedContainer(keyedBy: ResponseKeys.self, forKey: .quoteResponse) {
            // Lastly decode the data into model
            self.data = try? quoteResponseContainer.decodeIfPresent([Quote].self, forKey: .result)
            self.error = try? quoteResponseContainer.decodeIfPresent(ErrorResponse.self, forKey: .error)
        } else if let financeResponseContainer = try? container.nestedContainer(keyedBy: ResponseKeys.self, forKey: .finance) {
            self.error = try? financeResponseContainer.decodeIfPresent(ErrorResponse.self, forKey: .error)
            self.data = nil
        } else {
            self.data = nil
            self.error = nil
        }
        
    }
}


// DATA MODEL
// Codable makes you not worry about Coding String
public struct Quote: Codable, Identifiable, Hashable {
    
    // conform to identifiable
    public let id = UUID()
    
    public let currency: String?
    public let marketState: String?
    public let fullExchangeName: String?
    public let displayName: String?
    public let symbol: String?
    public let regularMarketPrice: Double?
    public let regularMarketChange: Double?
    public let regularMarketChangePercent: Double?
    public let regularMarketChangePreviousClose: Double?
    
    public let postMarketPrice: Double?
    public let postMarketPriceChange: Double?
    
    public let regularMarketOpen: Double?
    public let regularMarketDayHigh: Double?
    public let regularMarketDayLow: Double?
    
    public let regularMarketVolume: Double?
    public let trailingPE: Double?
    public let marketCap: Double?
    
    public let fiftyTwoWeekLow: Double?
    public let fiftyTwoWeekHigh: Double?
    public let averageDailyVolume3Month: Double?
    
    public let trailingAnnualDividendYield: Double?
    public let epsTrailingTwelveMonths: Double?
    
    public init(currency: String?, marketState: String?, fullExchangeName: String?, displayName: String?, symbol: String?, regularMarketPrice: Double?, regularMarketChange: Double?, regularMarketChangePercent: Double?, regularMarketChangePreviousClose: Double?, postMarketPrice: Double?, postMarketPriceChange: Double?, regularMarketOpen: Double?, regularMarketDayHigh: Double?, regularMarketDayLow: Double?, regularMarketVolume: Double?, trailingPE: Double?, marketCap: Double?, fiftyTwoWeekLow: Double?, fiftyTwoWeekHigh: Double?, averageDailyVolume3Month: Double?, trailingAnnualDividendYield: Double?, epsTrailingTwelveMonths: Double?) {
        self.currency = currency
        self.marketState = marketState
        self.fullExchangeName = fullExchangeName
        self.displayName = displayName
        self.symbol = symbol
        self.regularMarketPrice = regularMarketPrice
        self.regularMarketChange = regularMarketChange
        self.regularMarketChangePercent = regularMarketChangePercent
        self.regularMarketChangePreviousClose = regularMarketChangePreviousClose
        self.postMarketPrice = postMarketPrice
        self.postMarketPriceChange = postMarketPriceChange
        self.regularMarketOpen = regularMarketOpen
        self.regularMarketDayHigh = regularMarketDayHigh
        self.regularMarketDayLow = regularMarketDayLow
        self.regularMarketVolume = regularMarketVolume
        self.trailingPE = trailingPE
        self.marketCap = marketCap
        self.fiftyTwoWeekLow = fiftyTwoWeekLow
        self.fiftyTwoWeekHigh = fiftyTwoWeekHigh
        self.averageDailyVolume3Month = averageDailyVolume3Month
        self.trailingAnnualDividendYield = trailingAnnualDividendYield
        self.epsTrailingTwelveMonths = epsTrailingTwelveMonths
    }
}


// ERROR
public struct ErrorResponse: Codable {
    public let code: String
    public let description: String
    
    public init(code: String, description: String) {
        self.code = code
        self.description = description
    }
}




// ---------------DATA---------------
/*
 {
     "finance": {
         "result": null,
         "error": {
             "code": "Bad Request",
             "description": "Missing required query parameter=symbols"
         }
     }
 }
 */

/*
 {
     "quoteResponse": {
         "result": [
             {
                 "language": "en-US",
                 "region": "US",
                 "quoteType": "EQUITY",
                 "typeDisp": "Equity",
                 "quoteSourceName": "Nasdaq Real Time Price",
                 "triggerable": true,
                 "customPriceAlertConfidence": "HIGH",
                 "regularMarketChangePercent": 1.9244698,
                 "regularMarketPrice": 154.65,
                 "marketState": "POST",
                 "currency": "USD",
                 "exchange": "NMS",
                 "shortName": "Apple Inc.",
                 "longName": "Apple Inc.",
                 "messageBoardId": "finmb_24937",
                 "exchangeTimezoneName": "America/New_York",
                 "exchangeTimezoneShortName": "EST",
                 "gmtOffSetMilliseconds": -18000000,
                 "market": "us_market",
                 "esgPopulated": false,
                 "firstTradeDateMilliseconds": 345479400000,
                 "priceHint": 2,
                 "postMarketChangePercent": -0.43646157,
                 "postMarketTime": 1675806041,
                 "postMarketPrice": 153.975,
                 "postMarketChange": -0.6749878,
                 "regularMarketChange": 2.9199982,
                 "fiftyDayAverageChangePercent": 0.11321936,
                 "twoHundredDayAverage": 147.72424,
                 "twoHundredDayAverageChange": 6.9257507,
                 "twoHundredDayAverageChangePercent": 0.046882965,
                 "marketCap": 2446856814592,
                 "forwardPE": 23.396368,
                 "priceToBook": 43.186256,
                 "sourceInterval": 15,
                 "exchangeDataDelayedBy": 0,
                 "averageAnalystRating": "2.0 - Buy",
                 "tradeable": false,
                 "cryptoTradeable": false,
                 "regularMarketTime": 1675803604,
                 "regularMarketDayHigh": 155.23,
                 "regularMarketDayRange": "150.66 - 155.23",
                 "regularMarketDayLow": 150.66,
                 "regularMarketVolume": 82970883,
                 "regularMarketPreviousClose": 151.73,
                 "bid": 154.68,
                 "ask": 154.69,
                 "bidSize": 18,
                 "askSize": 30,
                 "fullExchangeName": "NasdaqGS",
                 "financialCurrency": "USD",
                 "regularMarketOpen": 150.64,
                 "averageDailyVolume3Month": 78158757,
                 "averageDailyVolume10Day": 80677450,
                 "fiftyTwoWeekLowChange": 30.479996,
                 "fiftyTwoWeekLowChangePercent": 0.24546988,
                 "fiftyTwoWeekRange": "124.17 - 179.61",
                 "fiftyTwoWeekHighChange": -24.960007,
                 "fiftyTwoWeekHighChangePercent": -0.1389678,
                 "fiftyTwoWeekLow": 124.17,
                 "fiftyTwoWeekHigh": 179.61,
                 "dividendDate": 1676505600,
                 "earningsTimestamp": 1675375200,
                 "earningsTimestampStart": 1682506740,
                 "earningsTimestampEnd": 1682942400,
                 "trailingAnnualDividendRate": 0.91,
                 "trailingPE": 26.256367,
                 "trailingAnnualDividendYield": 0.0059974957,
                 "epsTrailingTwelveMonths": 5.89,
                 "epsForward": 6.61,
                 "epsCurrentYear": 6.04,
                 "priceEpsCurrentYear": 25.604303,
                 "sharesOutstanding": 15821899776,
                 "bookValue": 3.581,
                 "fiftyDayAverage": 138.9214,
                 "fiftyDayAverageChange": 15.728592,
                 "displayName": "Apple",
                 "symbol": "AAPL"
             }
         ],
         "error": null
     }
 }
 */
