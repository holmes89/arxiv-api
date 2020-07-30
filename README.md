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

## Example

`curl localhost:8080/cs.DM`

```
[
  {
    "link": "http://arxiv.org/abs/2007.14502",
    "title": "A polynomial-time algorithm to determine (almost) Hamiltonicity of dense regular graphs. (arXiv:2007.14502v1 [math.CO])",
    "description": "<p>We give a polynomial-time algorithm for detecting very long cycles in dense\nregular graphs. Specifically, we show that, given $\\alpha \\in (0,1)$, there\nexists a $c=c(\\alpha)$ such that the following holds: there is a\npolynomial-time algorithm that, given a $D$-regular graph $G$ on $n$ vertices\nwith $D\\geq \\alpha n$, determines whether $G$ contains a cycle on at least $n -\nc$ vertices. The problem becomes NP-complete if we drop either the density or\nthe regularity condition. The algorithm combines tools from extremal graph\ntheory and spectral partitioning as well as some further algorithmic\ningredients.\n</p>"
  },
  {
    "link": "http://arxiv.org/abs/2007.14514",
    "title": "Computing Weighted Subset Transversals in $H$-Free Graphs. (arXiv:2007.14514v1 [cs.DS])",
    "description": "<p>For the Odd Cycle Transversal problem, the task is to find a small set $S$ of\nvertices in a graph that intersects every cycle of odd length. The\ngeneralization Subset Odd Cycle Transversal requires that $S$ only intersects\nthose odd cycles that include a vertex of a distinguished subset $T$ of the\nvertex set. If we are also given weights for the vertices of the graph, we can\nask instead that $S$ has small weight: this is the problem Weighted Subset Odd\nCycle Transversal. We prove an almost-complete complexity dichotomy for this\nproblem when the input is restricted to graphs that do not contain a graph~$H$\nas an induced subgraph. In particular, we show that for $(3P_1+P_2)$-free\ngraphs (where $P_r$ is the path on $r$ vertices) there is a polynomial-time\nalgorithm, but the problem is NP-complete for $5P_1$-free graphs, that is,\ngraphs of independence number~$4$. Thus we obtain a dichotomy with respect to\nthe independence number; this is an analogue of the dichotomy for Weighted\nSubset Feedback Vertex Set recently obtained by Papadopoulos and Tzimas. In\ncontrast, Subset Feedback Vertex Set and Subset Odd Cycle Transversal have a\npolynomial-time algorithm for any graph class with bounded independence number.\nWe also generalize the polynomial-time result of Papadopoulos and Tzimas for\nWeighted Subset Feedback Vertex Set on $4P_1$-free graphs to $(3P_1+P_2)$-free\ngraphs. As a consequence, we show that the complexity for both of the weighted\nsubset transversal problems restricted to $H$-free graphs remains open for just\nthree particular graphs~$H$.\n</p>"
  },
  {
    "link": "http://arxiv.org/abs/2007.14731",
    "title": "Squaring within the Colless index yields a better balance index. (arXiv:2007.14731v1 [q-bio.PE])",
    "description": "<p>The Colless index for bifurcating phylogenetic trees, introduced by Colless\n(1982), is defined as the sum, over all internal nodes $v$ of the tree, of the\nabsolute value of the difference of the sizes of the clades defined by the\nchildren of $v$. It is one of the most popular phylogenetic balance indices,\nbecause, in addition to measuring the balance of a tree in a very simple and\nintuitive way, it turns out to be one of the most powerful and discriminating\nphylogenetic shape indices. But it has some drawbacks. On the one hand,\nalthough its minimum value is reached at the so-called maximally balanced\ntrees, it is almost always reached also at trees that are not maximally\nbalanced. On the other hand, its definition as a sum of absolute values of\ndifferences makes it difficult to study analytically its distribution under\nprobabilistic models of bifurcating phylogenetic trees. In this paper we show\nthat if we replace in its definition the absolute values of the differences of\nclade sizes by the squares of these differences, all these drawbacks are\novercome and the resulting index is still more powerful and discriminating than\nthe original Colless index.\n</p>"
  },
  {
    "link": "http://arxiv.org/abs/2007.14758",
    "title": "Some Game Theoretic Remarks on Two-Player Generalized Cops and Robbers Games. (arXiv:2007.14758v1 [math.CO])",
    "description": "<p>In this paper we study the two-player generalized Cops and Robber (GCR) games\nintroduced by Bonato and MacGillivray. Our main goal is to present a full,\nself-contained game theoretic analysis of such games.\n</p>"
  },
  {
    "link": "http://arxiv.org/abs/2007.14930",
    "title": "Robbins and Ardila meet Berstel. (arXiv:2007.14930v1 [math.CO])",
    "description": "<p>In 1996, Neville Robbins proved the amazing fact that the coefficient of\n$X^n$ in the Fibonacci infinite product $$ \\prod_{n \\geq 2} (1-X^{F_n}) =\n(1-X)(1-X^2)(1-X^3)(1-X^5)(1-X^8) \\cdots = 1-X-X^2+X^4 + \\cdots$$ is always\neither $-1$, $0$, or $1$. The same result was proved later by Federico Ardila\nusing a different method.\n</p>"
  },
  {
    "link": "http://arxiv.org/abs/1907.05445",
    "title": "Eccentricity function in distance-hereditary graphs. (arXiv:1907.05445v2 [cs.DM] UPDATED)",
    "description": "<p>A graph $G=(V,E)$ is distance hereditary if every induced path of $G$ is a\nshortest path. In this paper, we show that the eccentricity function\n$e(v)=\\max\\{d(v,u): u\\in V\\}$ in any distance-hereditary graph $G$ is almost\nunimodal, that is, every vertex $v$ with $e(v)&gt; rad(G)+1$ has a neighbor with\nsmaller eccentricity. Here, $rad(G)=\\min\\{e(v): v\\in V\\}$ is the radius of\ngraph $G$. Moreover, we use this result to fully characterize the centers of\ndistance-hereditary graphs. Several bounds on the eccentricity of a vertex with\nrespect to its distance to the center of $G$ or to the ends of a diametral path\nare established. Finally, we propose a new linear time algorithm to compute all\neccentricities in a distance-hereditary graph.\n</p>"
  },
  {
    "link": "http://arxiv.org/abs/2001.06403",
    "title": "Consistency of Proof-of-Stake Blockchains with Concurrent Honest Slot Leaders. (arXiv:2001.06403v4 [cs.DC] UPDATED)",
    "description": "<p>We improve the fundamental security threshold of eventual consensus\nProof-of-Stake (PoS) blockchain protocols under the longest-chain rule by\nshowing, for the first time, the positive effect of rounds with concurrent\nhonest leaders.\n</p>"
  }
]
```
