library(leaflet)

restaurantIcon <- makeIcon(
  iconUrl = "https://www.reznictvi-sloupnice.cz/wp-content/uploads/2016/01/restaurant-icon-png-7.png",
  iconWidth = 31*215/230, 
  iconHeight = 31,
  iconAnchorX = 31*215/230/2,
  iconAnchorY = 16,
)

restaurantSite <- c(
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g147329-d4108532-Reviews-Le_Bistrot_D_en_Face-Trois_Ilets_Arrondissement_of_Le_Marin_Martinique.html'>Le Bistrot den face</a>",
  "<a href='https://www.tripadvisor.fr/Restaurant_Review-g147329-d5967640-Reviews-Cocco_Bello-Trois_Ilets_Arrondissement_of_Le_Marin_Martinique.html'>Coco Bello</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g147329-d2092216-Reviews-Le_Zandoli_La_Suite_Villa-Trois_Ilets_Arrondissement_of_Le_Marin_Martinique.html'>Le Zandoli</a>",
  "<a href='http://boulangerielaguerande.fr/?portfolio=patisserie'>La Guerande</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g147329-d3682170-Reviews-Il_Gallo_Rosso-Trois_Ilets_Arrondissement_of_Le_Marin_Martinique.html'>Il Gallo Rosso</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g776158-d9715523-Reviews-Cocoa_Beach_Cafe-Tartane_Arrondissement_of_La_Trinite_Martinique.html'>Cocoa Beach Cafe</a>",
  "<a href='https://www.tripadvisor.fr/Restaurant_Review-g662331-d4874663-Reviews-Ti_Payot-Les_Anses_d_Arlet_Arrondissement_of_Le_Marin_Martinique.html'>Ti' Payot</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g147329-d10859339-Reviews-Kreol_K_Fe-Trois_Ilets_Arrondissement_of_Le_Marin_Martinique.html'>Kreol Kfe</a>",
  "<a href='https://www.tripadvisor.ca/ShowUserReviews-g147331-d4742814-r547562384-Chez_Olivier-Sainte_Anne_Arrondissement_of_Le_Marin_Martinique.html'>Chez Olivier (juice)</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g657860-d2034935-Reviews-Case_Coco_Restaurant-Sainte_Luce_Arrondissement_of_Le_Marin_Martinique.html'>Case Coco</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g147329-d2703191-Reviews-La_Mandoline-Trois_Ilets_Arrondissement_of_Le_Marin_Martinique.html'>La Mandoline</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g1146702-d3629485-Reviews-Beach_Grill-Le_Carbet_Arrondissement_of_Saint_Pierre_Martinique.html'>Beach Grill</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g2223555-d2630861-Reviews-Le_Point_de_Vue-Sainte_Marie_Arrondissement_of_La_Trinite_Martinique.html'>Le Point de Vue</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g147331-d3870072-Reviews-Le_Cocotier-Sainte_Anne_Arrondissement_of_Le_Marin_Martinique.html'>Le Cocotier</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g776158-d1892568-Reviews-La_Table_De_Mamy_Nounou-Tartane_Arrondissement_of_La_Trinite_Martinique.html'>La Table de Mamy Nounou</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g657860-d4041871-Reviews-Le_Mabouya-Sainte_Luce_Arrondissement_of_Le_Marin_Martinique.html'>Le Mabouya Sainte Luce</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g662331-d2015215-Reviews-Ti_Sable-Les_Anses_d_Arlet_Arrondissement_of_Le_Marin_Martinique.html'>Ti Sable</a>",
  "<a href='https://fr.tripadvisor.ca/Restaurant_Review-g3398776-d5786019-Reviews-Le_Bambou-Le_Morne_Rouge_Arrondissement_of_Saint_Pierre_Martinique.html'>Le Bambou</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g776151-d2181215-Reviews-Ti_Toques-Le_Marin_Arrondissement_of_Le_Marin_Martinique.html'>Ti Toques</a>",
  "<a href='https://fr.tripadvisor.be/Restaurant_Review-g147329-d12687128-Reviews-New_Dragon_de_Chine-Trois_Ilets_Arrondissement_of_Le_Marin_Martinique.html'>New Dragon de Chine</a>",
  "<a href='https://www.tripadvisor.fr/Restaurant_Review-g147328-d4324464-Reviews-Tomawok-Fort_de_France_Arrondissement_of_Fort_de_France_Martinique.html'>Tomawok</a>",
  "<a href='https://www.tripadvisor.fr/Restaurant_Review-g147329-d10134230-Reviews-La_Case_Thai-Trois_Ilets_Arrondissement_of_Le_Marin_Martinique.html'>La Case Thai</a>",
  "<a href='https://www.tripadvisor.com/Restaurant_Review-g147329-d6214121-Reviews-Le_samcielo-Trois_Ilets_Arrondissement_of_Le_Marin_Martinique.html'>Le Samcielo</a>",
  "<a href='https://www.tripadvisor.ca/Restaurant_Review-g147328-d7685000-Reviews-LA_LUCIOLE-Fort_de_France_Arrondissement_of_Fort_de_France_Martinique.html'>La Luciole</a>"
)

library(htmltools)

df <- read.csv(textConnection(
  "Name,Lat,Long
  Le Bistrot d'en face,14.556402,-61.051926
  Coco Bello,14.556651,-61.052875
  Le Zandoli,14.546105,-61.051185
  La Guerande, 14.536037, -61.032659
  Il Gallo Rosso, 14.540725, -61.038322
  Cocoa Beach Cafe, 14.765629, -60.90811
  Ti Payot, 14.50373, -61.084513
  Kreol K Fe, 14.540493, -61.065203
  Chez Olivier Jus, 14.402759, -60.877306
  Case Coco, 14.467896, -60.921845
  La Mandoline, 14.536285, -61.012343
  Beach Grill, 14.706918, -61.183914
  Le Point de Vue, 14.806692, -61.016205
  Le Cocotier, 14.437219, -60.826322
  La Table de Mamy Nounou, 14.762982, -60.90593
  Le Mabouya, 14.466613, -60.956128
  Ti Sable, 14.506887, -61.086643
  Le Bambou, 14.766538, -61.122616
  Ti Toques, 14.471322, -60.866344
  New Dragon de Chine, 14.557236, -61.051695
  Tomawok, 14.605264, -61.070633
  La Case Thai, 14.534994, -61.011701
  Le Samcielo, 14.55063, -61.051208
  La Luciole, 14.672348, -61.090902"
))


leaflet(df) %>% addTiles() %>%
  addMarkers(~Long, ~Lat, popup = restaurantSite,icon=restaurantIcon, clusterOptions=markerClusterOptions())

