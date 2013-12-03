elm-voronoi --- [Check it out!](http://michaelbjames.com/sandbox/Voronoi_diagram.html)
==========

Pretty Voronoi Manhattan-distance Diagram

Using [elm](elm-lang.org) as the display engine.
Elm is based on Haskell so it makes sense to test the base layer math in Haskell.
Elm is a functional reactive programming language which brings the purity of Haskell to the web.

The Voronoi diagram is defined as:
Let `X` be a space with distance function `d`. Let `K` be a set of indices and let (Pk) be a tuple in the space `X`.
The Voronoi region `Rk` associated with site `Pk` is the set of all points in `X`
whose distance to `Pk` is not greater than their distance to the other sites 
`Pj` for all `j`:
`Rk = {x in X | d(x,Pk) <= d(x,Pj) for all j != k}`

See a [demo](http://michaelbjames.com/sandbox/Voronoi_diagram.html) at my personal website


Setup
-----
Follow the [guide here](https://github.com/evancz/Elm/blob/master/README.md#install) to install elm.

Then feed the elm server the `.elm` file


TODO
----
- [x] resize to window
- [x] fix point globbing
- [x] react to user
- [ ] Faster algorithm
- [ ] Randomize seed points on each run