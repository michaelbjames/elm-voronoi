import Random
import Signal
import Window

dist (x1,y1) (x2,y2) = abs (x1-x2) + abs (y1-y2)

region dimensions sites current =
  let compsites = filter (\r -> r /= current) sites
      space = foldr (\x base -> (map (\y -> (x,y)) [0..dimensions]) ++ base) []
        [0..dimensions]
  in filter (\point -> foldl (&&) True 
             <| map (\s -> dist point current <= dist point s) compsites) space
             
drawCircles color (x,y) =
  circle 4.0 |> filled color
             |> move (2*x,2*y)

colorpick x = rgb x x x

mkcircles (x,y) cindex origins =
  let angle = degrees (20 * toFloat cindex)
      color = (hsv angle 0.7 1)
  in group <| map (drawCircles color) origins
 
scene (w,h) = 
  let maxdim = 150
      pset = [(90,100),(100,90),(0,0),(0,30),(100,60)]
  in container w h midTop
      <| collage 900 900
      (map (\(x,c) -> mkcircles x c (region maxdim pset x))
        <| (zip pset [1..20]))

main = lift scene Window.dimensions