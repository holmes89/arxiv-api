import os, streams, parsexml, strutils, httpClient

proc `=?=` (a, b: string): bool =
  # comparator that ignores case
  return cmpIgnoreCase(a, b) == 0

if paramCount() < 1:
  quit("Usage: rss feed")
var url = paramStr(1)
var client = newHttpClient()
var resp = client.getContent(url)
var s = newStringStream(resp)
if s == nil: quit("cannot open the file " & url)
var x: XmlParser
open(x, s, url, {allowUnquotedAttribs})
while true:
  case x.kind
  of xmlElementStart:
    if x.elementName =?= "title":
      x.next()
      var title = ""
      while x.kind == xmlCharData:
        title.add(x.charData)
        x.next()
      echo title
    if x.elementName =?= "link":
      x.next()
      var link = ""
      while x.kind == xmlCharData:
        link.add(x.charData)
        x.next()
      echo link
    else:
      x.next()
  of xmlEof: break # end of file reached
  of xmlError:
    x.next()
  else: x.next() # skip other events
x.close()
