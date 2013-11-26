import Random
import Signal
import Window

--Manhattan Distance function
dist (x1,y1) (x2,y2) = abs (x1-x2) + abs (y1-y2)

region xdim ydim sites current =
  let compsites = filter (\r -> r /= current) sites
      space = foldr (\x base -> (map (\y -> (x,y)) [0..ydim]) ++ base) []
        [0..xdim]
  in filter (\point -> foldl (&&) True 
             <| map (\s -> dist point current <= dist point s) compsites) space
             
drawCircles color (x,y) =
  circle 1.0 |> filled color
             |> move (3*x - 200,3*y - 250)

colorpick x = rgb x x x

mkcircles (x,y) cindex origins =
  let angle = degrees (50 * toFloat cindex)
      color = (hsv angle 1 1)
  in group <| map (drawCircles color) origins
 
scene (w',h') = 
  let xdim = 200
      ydim = 200
      pset = [(90,100),(100,90),(0,0),(0,30),(100,60),(170,30),(100,170),(30,150)]
  in collage w' h'
      <| map (\(x,c) -> mkcircles x c (region xdim ydim pset x))
      <| (zip pset [1..20])

main = lift scene Window.dimensions