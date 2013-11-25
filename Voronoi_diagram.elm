import Random
import Signal
import Window

dist (x1,y1) (x2,y2) = abs (x1-x2) + abs (y1-y2)

region dimensions sites current =
  let compsites = filter (\r -> r /= current) sites
      space = foldr (\x base -> (map (\y -> (x,y)) [0..dimensions]) ++ base) [] [0..dimensions]
  in filter (\point -> foldl (||) False 
             <| map (\s -> dist point current <= dist point s) compsites) space
             
drawCircles color (x,y) =
  ngon 6 4.0 |> filled color
             |> move (2*x,2*y)

mkcircles (x,y) origins =
  let color = rgb (round (x + y * 7) `mod` 256) (round (x * 13 + y) `mod` 256) (round (x * y) `mod` 256)
  in group <| map (drawCircles color) origins
 
scene (w,h) = 
  let maxdim = 150
      pset = [(130,50),(100,100),(45,135),(20,20)]
  in container w h midRight
      <| collage 900 900 (map (\x -> mkcircles x (region maxdim pset x)) pset)

main = lift scene Window.dimensions