elm-voronoi
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

TODO
----
[ ] resize to window
[ ] fix point globbing
[ ] react to user
