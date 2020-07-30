# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import jester, json, streams, parsexml, httpClient, json, strutils

var basepath = "http://export.arxiv.org/rss/"

proc `=?=` (a, b: string): bool =
  # comparator that ignores case
  return cmpIgnoreCase(a, b) == 0

type Paper = object
  link: string
  title: string
  description: string

router myrouter:
  get "/@site":
    var url = basepath & @"site"
    var client = newHttpClient()
    var resp = client.getContent(url)
    var s = newStringStream(resp)
    if s == nil: quit("cannot open the file " & url)
    var x: XmlParser
    open(x, s, url, {allowUnquotedAttribs})
    var papers: seq[Paper]
    while true:
      case x.kind
      of xmlElementOpen:
        if x.elementName =?= "item":
          x.next()
          var paper = Paper()
          while true:
            case x.kind
            of xmlElementOpen:
              if x.elementName =?= "description":
                while x.kind != xmlCharData:
                  x.next()
                var description = ""
                while x.kind == xmlCharData:
                  description.add(x.charData)
                  x.next()
                paper.description = description
              else:
                x.next()
            of xmlElementStart:
              if x.elementName =?= "title":
                x.next()
                var title = ""
                while x.kind == xmlCharData:
                  title.add(x.charData)
                  x.next()
                paper.title = title
              if x.elementName =?= "link":
                x.next()
                var link = ""
                while x.kind == xmlCharData:
                  link.add(x.charData)
                  x.next()
                paper.link = link
              else:
                x.next()
            of xmlElementEnd:
              if x.elementName =?= "item":
                papers.add(paper)
                break
              else:
                x.next()
            else: x.next() # skip other events
        else: x.next()
      of xmlEof: break # end of file reached
      of xmlError:
        x.next()
      else: x.next() # skip other events
    x.close()
    resp %*papers

proc main() =
  let settings = newSettings(port=8080.Port)
  var jester = initJester(myrouter, settings=settings)
  jester.serve()

when isMainModule:
  main()
