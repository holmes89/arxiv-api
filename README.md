# arXiv Feed Parser API
Translate RSS feeds from arXiv site for new papers

## What problem will this solve?
There are a ton of papers that are aggregated by this site each day in various fields. I built the [paper-organizer](https://github.com/holmes89/papers-organizer) application to help read papers. I wanted to add this API as a source to the site to allow me to discover and quickly add new papers. Integration will happen on the organizer application soon.

## Language selection
This was also an experiment to learn [nim](https://nim-lang.org/). This is a first project and lacks specific qualities I would normally like it was a great learning experience and fun to learn. I'm hoping to revisit and improve this initial build.

# Build
`docker build -t arxiv-api .`

# Run

`docker run -p 8080:8080 arxiv-api:latest`
