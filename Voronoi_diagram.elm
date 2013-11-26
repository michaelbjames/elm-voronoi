import Random
import Signal
import Window
import Mouse

--Manhattan Distance function
dist (x1,y1) (x2,y2) = abs (x1-x2) + abs (y1-y2)

region xdim ydim sites current =
  let compsites = filter (\r -> r /= current) sites
      space = foldr (\x base -> (map (\y -> (x,y)) [0..ydim]) ++ base) []
        [0..xdim]
  in filter (\point -> foldl (&&) True 
             <| map (\s -> dist point current <= dist point s) compsites) space
             
drawCircles color (x,y) =
  circle 5.0 |> filled color
             |> move (11*x - 200,-11*y + 250)

colorpick x = rgb x x x

mkcircles (x,y) cindex origins =
  let angle = degrees (50 * toFloat cindex)
      color = (hsv angle 1 1)
  in group <| map (drawCircles color) origins
 
scene (w',h') position = 
  let xdim = 50
      ydim = 50
      pset = position :: [(40,10),(10,40),(0,0),(0,30),(10,10),(20,30),(10,20),(30,50)]
  in collage w' h'
      <| map (\(x,c) -> mkcircles x c (region xdim ydim pset x))
      <| (zip pset [1..20])

main = lift2 scene Window.dimensions Mouse.position