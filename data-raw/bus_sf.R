bus_stops <- read.csv(file.path("data-raw", "files", "Bus_Stops.csv"))
bus_sf <- bus_stops |>
  mutate(geometry = purrr::map2(X,Y, function(.X,.Y) st_point(c(.X, .Y)))) |>
  st_as_sf(crs = 4326) |>
  st_transform(2248)
usethis::use_data(bus_sf, overwrite = TRUE)
