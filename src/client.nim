import os, streams, parsexml, strutils, httpClient, json

proc `=?=` (a, b: string): bool =
  # comparator that ignores case
  return cmpIgnoreCase(a, b) == 0

type Paper = object
  link: string
  title: string
  description: string

if paramCount() < 1:
  quit("Usage: rss feed")
var url = paramStr(1)
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
echo %*papers
