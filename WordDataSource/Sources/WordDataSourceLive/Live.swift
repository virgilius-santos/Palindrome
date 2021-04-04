
import Foundation
import WordDataSource
import RealmSwift
import os.log

public extension WordDataSource {
  static let live: WordDataSource = {
    
    let dataSource = WordDS()
    
    return WordDataSource(
      saveWord: { string in
        guard !dataSource.contains(string) else { return }
        dataSource.save(string: string)
      },
      deleteWord: { dataSource.delete(row: $0) },
      numberOfWords: { dataSource.words.count },
      word: { dataSource.words[$0].string }
    )
  }()
}

private class WordDS {
  var realm: Realm = try! Realm()
  
  lazy var words = realm.objects(Word.self).sorted(byKeyPath: "string")
  
  func delete(row: Int) {
    let word: Word = words[row]
    
    do {
      try realm.write {
          realm.delete(word)
      }
    } catch {
      os_log("%s", error.localizedDescription)
    }
  }
  
  func save(string: String) {
    let word = Word()
    word.string = string
        
    do {
      try realm.write {
          realm.add(word)
      }
    } catch {
      os_log("%s", error.localizedDescription)
    }
  }
  
  func contains(_ string: String) -> Bool {
    words.contains(where: {$0.string.elementsEqual(string)})
  }
}

class Word: Object {
  @objc dynamic var string = ""
}
