import Random
import Signal
import Window
import Mouse

--Manhattan Distance function
dist (x1,y1) (x2,y2) = abs (x1-x2) + abs (y1-y2)

--set of points in xdim by ydim closest to current site
--{(x,y) | x in Xdim, y in Ydim, current,s in Sites, current != s, for all s}
region (xdim,ydim) sites current =
  let compsites = filter (\r -> r /= current) sites
      space = foldr (\x base -> (map (\y -> (x,y)) [0..ydim]) ++ base) [] [0..xdim]
  in filter (\point -> foldl (&&) True 
             <| map (\s -> dist point current <= dist point s) compsites) space
             
drawShape color (x,y) =
  ngon 8 2   |> filled color
             |> rotate (degrees 22.5)
             |> move (x,y)

--Draw out a region, all the same color
mkShapes color space = group <| map (drawShape color) space
 
scene (w',h') (mx,my) = 
  let xdim = 40
      scaleFactor = (toFloat w') / (toFloat xdim)
      ydim = (toFloat xdim) * (toFloat h') / (toFloat w')
      mousePosition = ((toFloat mx) / scaleFactor,((toFloat (h' - my)) / scaleFactor))
      pset = mousePosition :: [(40,10),(10,40),(0,30),(10,10),(20,30)]
      colors = [yellow,blue,green,grey,red,white,grey,lightBrown]
      fitToScreen form = form |> scale scaleFactor
                              |> move (-1*toFloat w' /2, -1*toFloat h'/2)
      regen (epicenter,color) = mkShapes color <| region (xdim,ydim) pset epicenter
  in collage w' h' <| map fitToScreen (((zip pset colors) |> map regen)
                                       ++
                                       (group <| map (drawShape black) pset) :: [])
                    


main = lift2 scene Window.dimensions Mouse.position