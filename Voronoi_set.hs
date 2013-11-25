dist (x1,y1) (x2,y2) = abs (x1-x2) + abs (y1-y2)

set dimensions sites curr = 
  [(x,y) | x <- [0..dimensions],
           y <- [0..dimensions], p <- sites,
      dist (x,y) curr <= dist (x,y) p, p /= curr]

-- Apparently this is a more accepted way of writing the above
region dimensions sites current =
  let compsites = filter (\r -> r /= current) sites
      space = foldr (\x base -> (map (\y -> (x,y)) [0..dimensions]) ++ base) [] [0..dimensions]
  in filter (\point -> foldl (||) False 
             $ map (\s -> dist point current <= dist point s) compsites) space

main =
  let pset = [(3,3),(5,5),(2,5)]
      maxdim = 600
  in do print $ map (region maxdim pset) pset