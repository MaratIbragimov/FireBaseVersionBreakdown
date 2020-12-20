import Foundation
import ArgumentParser
import CSV


enum Row {
    static let osVersions = ["OS with version", "Users"]
    static let audience = ["Platform","Users"]
    static let empty = [""]
}

struct FirebaseOSBreakdown: ParsableCommand {
    
    static var configuration = CommandConfiguration(
        abstract: "Swift command line tool that outputs mobile OS versions break down from exported Firebase CSV file")
    
    @Argument
    var inputFile: String
    
    @Argument
    var os: String
    
    func run() throws {
        
        let stream = InputStream(fileAtPath: inputFile)!
        let reader = try CSVReader(stream: stream)
        
        reader.move(towRow:  Row.osVersions)
        let versionRows = reader.loadRows(untilRow: Row.empty)
        
        let osItems = versionRows
            .filter(filterByOS(row:))
            .compactMap(mapToVersionData(fromRow:))
            .flatMap{$0}
        
        let totalUsers = osItems.reduce(into: 0) { $0 += $1.value }
        let versionItems = osItems.reduce(into: [String: Int]()) { res, item in
            res[item.key, default: 0] += item.value
        }
        
        
        let pairs =  versionItems
            .compactMap { pair -> [String: Double]? in
                let precent = (Double(pair.value) / Double(totalUsers)) * 100
                guard precent > 0.05 else { return nil }
                return [pair.key: precent]
            }.flatMap{ $0 }
            .sorted { $0.value > $1.value }
        
        pairs.forEach { pair in
            let output = String(format: "%@ %.3f%%", pair.key, pair.value)
            print(output)
        }
        
    }
    
    func mapToVersionData(fromRow row: [String]) -> [String: Int]? {
        guard row.count == 2 else { return nil }
        let osComponents = row[0].split(separator: " ")
    
        guard osComponents.count == 2,
              let shortVersion = osComponents[1].split(separator: ".").first
              else { return nil }
        
        let usersCount = Int(row[1]) ?? 0
        return ["\(String(osComponents[0])) \(String(shortVersion))":  usersCount]
    }
    
    func filterByOS(row: [String]) -> Bool {
        guard let osColumn = row.first?.lowercased() else { return false }
        return osColumn.hasPrefix(os.lowercased())
    }
}



FirebaseOSBreakdown.main()
