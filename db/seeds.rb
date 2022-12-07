# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'faker'
puts "Delete all tours"


tours = [{name:"Finland", description: "Hiking in Oulanka National park", images: 'https://worldofwanderlust.com/wp-content/uploads/2014/10/IMG_7432.jpg'},
        {name: "England", description: "Cornwall is one of the most beautiful counties in England, with a rugged coastline that hides away peaceful white sandy beaches and untouched fishing villages", images: 'https://www.katiesaway.com/wp-content/uploads/2022/03/england-0505.jpg'},
        {name: "Monreal, Germany", description: "The most “fairytale” village ", images: 'https://www.katiesaway.com/wp-content/uploads/2022/04/1_katiesaway-6312-scaled.jpg'},
        {name: "Australia", description: "Beautiful East Coast Australia", images: 'https://www.katiesaway.com/wp-content/uploads/2021/02/TheUltimateGuideToRoadTripAustraliasEastCoast-3-700x1050.jpeg'},
        {name: "Milos, Greece", description: "Tour with Julia", images: 'https://www.katiesaway.com/wp-content/uploads/2021/04/7.jpeg'},
        {name: "Tallin", description: "The Perfect Itinerary for Tallin‘s old town", images: 'https://www.katiesaway.com/wp-content/uploads/2022/11/Tallinn-97.jpg'},
        {name: "Vienna", description: "I have visited Vienna a few times now but nothing compares to Vienna at Christmas. Through the month of December, the entire city is abuzz with Christmas spirit and the heart of that spirit can be found at the many Christmas markets dotted around the city. You’ll be spoiled with mulled wine, ice rinks and all the sweets you can squeeze into your pants.", images: 'https://worldofwanderlust.com/wp-content/uploads/2018/12/Vienna-3-2.jpg'},
        {name: "Lagos, Portugal", description: " Kayak Through Caves in Lagos", images: 'https://images.squarespace-cdn.com/content/v1/6115d66cb356dc2356e173ca/1628834607371-H6DTE07JHPQTEUG56AYY/DSC04628-scaled.jpg?format=1500w'},
        {name: "Kyoto", description: "This ain’t my first rodeo but believe me when I say that despite visiting Kyoto once before, I’m still just as in love with this city. Perhaps even more so after discovering some hidden gems on my most recent trip.!", images: 'https://worldofwanderlust.com/wp-content/uploads/2019/02/IMG_5045.jpg'},
        {name: "Australia", description: "Drive and Discover Beautiful East Coast Australia", images: 'https://images.squarespace-cdn.com/content/v1/6115d66cb356dc2356e173ca/1633234061636-FX5C41XXYGDP29YF6YCT/20210728-DSC04243.jpg?format=1500w'},
        {name: "Wales", description: "Visiting Laura 2022", images: 'https://worldofwanderlust.com/wp-content/uploads/2015/10/Wales.jpg'},
        {name: "Copenhagen Sommer 2021", description: "Lovely City Trip with Lukas", images: 'https://images.adsttc.com/media/images/62ea/54a8/c30f/ce6c/0897/4f1e/newsletter/how-copenhagen-is-designed-for-delight_1.jpg?1659524303'},
        {name: " Tahiti Honeymoon ", description: "Sail Away on a Catamaran", images: 'https://worldofwanderlust.com/wp-content/uploads/2018/06/tahiti-abraham.jpg'},
        {name: " Ethiopia’s Simien Mountains", description: "Visiting the Gelada Monkeys", images: 'https://worldofwanderlust.com/wp-content/uploads/2019/11/Simien-Mountains-5.jpg'},
        {name: "Budapest", description: "Music Festival 2020", images: 'https://images.unsplash.com/photo-1619229667032-e8700319c3c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fG11c2ljJTIwZmVzdGl2YWx8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'},
        {name: "Barcelona, Spain ", description: "Music Tour with Hao", images: 'https://images.unsplash.com/photo-1582711012124-a56cf82307a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bXVzaWMlMjBmZXN0aXZhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'},
        {name: "München", description: "Visiting friends for birtday 2020", images: 'https://plus.unsplash.com/premium_photo-1663100671618-8158bc6381f3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fHRyYXZlbCUyMHdpdGglMjBmcmllbmRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'},
        {name: "Riga, Latvia", description: "Camping Tour around country with Lukas", images: 'https://plus.unsplash.com/premium_photo-1664358190434-e468c3878724?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTd8fHRyYXZlbCUyMHdpdGglMjBmcmllbmRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'},
        {name: "Scottland ", description: "Holiday with Laura and her family", images: 'https://images.unsplash.com/photo-1603655995261-22ac0ead4414?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjkxfHx0cmF2ZWwlMjB3aXRoJTIwZnJpZW5kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'},
        {name: " Sassnitz", description: "Long Weekend with Hao", images: 'https://images.unsplash.com/photo-1530541930197-ff16ac917b0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzA4fHx0cmF2ZWwlMjB3aXRoJTIwZnJpZW5kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'},
        {name: "Tallin, Estonia", description: "Holiday with family", images: 'https://images.unsplash.com/photo-1517554558809-9b4971b38f39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fHRyYXZlbCUyMHdpdGglMjBmYW1pbHl8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'},
        {name: "Ericeira, Portugal", description: "Climbing with Hao", images: 'https://images.unsplash.com/photo-1606148492231-bc37e771e08e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDAxfHx0cmF2ZWwlMjB3aXRoJTIwZnJpZW5kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'},
        {name: "Roma, Italy", description: "Long Weekend with Lukas", images: 'https://images.unsplash.com/photo-1622117127526-4fe6fa646bf9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTQ0fHx0cmF2ZWwlMjB3aXRoJTIwZnJpZW5kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'},
        {name: "Wales", description: "Visiting Margarita and Robert", images: 'https://images.unsplash.com/photo-1669568453689-6999adcca999?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fGlyaXNoJTIwd29sZmhvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'}
]


sites = [{name: "Hamburger Dom", address: "Heiligengeistfeld, 20359 Hamburg", siteImage: 'https://www.hamburg.de/image/4315670/16x9/990/557/cad1f4305c55ee00d8e0d8be6c7a34fc/XS/hamburger-dom.jpg', tour: 'Hamburg'},
  {name: "Hamburger Kunsthalle", address: "Glockengießerwall 5, 20095 Hamburg", siteImage: 'https://lh5.googleusercontent.com/p/AF1QipOUpOjY5MhlhIO7pYQDrhZkV96x2J3_7a8OYEsD=w243-h244-n-k-no-nu', tour: 'Hamburg'},
  {name: "Museum am Rothenbaum", address: "Rothenbaumchaussee 64, 20148 Hamburg", siteImage: 'https://www.hamburg.de/image/15421024/4x3/750/563/6d2f0a309a40e431b8a806dcd39e8c27/Mp/aussenansicht-gebaeude-markk.jpg', tour: 'Hamburg'},
  {name: "Kini Korean", address: "Susannenstraße 15, 20357 Hamburg", siteImage: 'https://lh3.googleusercontent.com/p/AF1QipPGjzL3WfXBzYRE9SQLAGKbkDVqlkPt_EzL2yo_=s1360-w1360-h1020', tour: 'Hamburg'},
  {name: "Croque Company Lange Reihe", address: "Lange Reihe 77, 20099 Hamburg", siteImage: 'https://speisekarte.menu/storage/media/company_images/16791/conversions/thumbnail.jpg', tour: 'Hamburg'},
  {name: "Luicella's", address: "Lange Reihe 113, 20099 Hamburg", siteImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSdNwNGFTsGN3SdAR3rmWUSYyGtaBylEbF0w&usqp=CAU', tour: 'Hamburg'},
  {name: "Takumi Ramen Station Ottensen", address: "Große Rainstraße 20, 22765 Hamburg", siteImage: 'https://lh3.googleusercontent.com/p/AF1QipP_Xb3YC-R2p-1_g9op5Mjcr4BaDMU7HgqHNRG1=s1360-w1360-h1020', tour: 'Hamburg'},
  {name: "bægeri", address: "Beim Grünen Jäger 14, 20359 Hamburg", siteImage: 'https://lh3.googleusercontent.com/p/AF1QipOT3EH1SaxiBiGjfE-5mKs-tMitNnonIsIqhcA7=s1360-w1360-h1020', tour: 'Hamburg'},
  {name: "Big Ben", address: "London SW1A 0AA, United Kingdom", siteImage: 'https://www.merkur.de/bilder/2021/12/21/91193344/27024679-blick-auf-den-big-ben-in-london-2o56ZQW5zgec.jpg', tour: "London"},
  {name: "Tate Gallery of Modern Art", address: "Bankside, London SE1 9TG, Vereinigtes Königreich", siteImage: 'https://i.guim.co.uk/img/media/e32facdada40b663a442ab5dab7684a2c84a10e2/0_114_2000_1200/master/2000.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=051b5b25487afa93616f6c54e469719c', tour: "London"},
  {name: "Borough Market", address: "8 Southwark St, London SE1 1TL, United Kingdom", siteImage: 'https://reisevergnuegen.com/wp-content/uploads/sites/5/2022/09/borough-market-london-charlott-tornow-680x383.png', tour: "London"},
  {name: "The Hill Garden and Pergola", address: "The Pergola, Inverforth Cl, London NW3 7EX", siteImage: 'https://www.londonxlondon.com/wp-content/uploads/2020/05/Hampstead-70.jpg', tour: "London"},
  {name: "Horniman Museum", address: "100 London Rd, London SE23 3PQ, Vereinigtes Königreich", siteImage: 'https://www.horniman.ac.uk/wp-content/uploads/2020/02/Natural-History-Gallery_001-walrus-2000x1500.jpg', tour: "London"},
  {name: "Lalbagh Fort", address: "Lalbagh Rd, Dhaka 1211, Bangladesh", siteImage: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Dhaka_Lalbagh_Fort_5.JPG/1200px-Dhaka_Lalbagh_Fort_5.JPG', tour: "Bangladesh"},
  {name: "Aqua Deck", address: "1 Minto Rd, Dhaka 1000, Bangladesh", siteImage: 'https://lh3.googleusercontent.com/p/AF1QipOvY27E-m3xt1Y6TQnotUaUG3Pw5YDyuBNy3-0C=s1360-w1360-h1020', tour: "Bangladesh"},
  {name: "Ahsan Manzil Museum", address: "Dhaka 1000, Bangladesch", siteImage: 'https://lh3.googleusercontent.com/p/AF1QipM9vZhwGi_70hQKsiQFugNzA-GF0JmZd1khMiw=s1360-w1360-h1020', tour: "Bangladesh"},
  {name: "Dhakeshwari Temple", address: "P9FR+82H, Dhakeshwari Rd, Dhaka, Bangladesh", siteImage: 'https://lh5.googleusercontent.com/p/AF1QipM1atXjOItyLAOkVmJqLRyGXau5Tzbhd7nsU_Mh=w243-h203-n-k-no-nu', tour: "Bangladesh"},
  {name: "Sundarbans", address: "XF9H+PHG, Bangladesch", siteImage: 'https://pathfriend-bd.com/wp-content/uploads/2019/08/Sundarban-Kotka-Sanctuary.jpg', tour: "Bangladesh"},
  {name: "Villa Rufolo", address: "Piazza Duomo, 1, 84010 Ravello SA, Italy", siteImage: 'https://upload.wikimedia.org/wikipedia/commons/2/21/Ravello_Villa_Rufolo.JPG', tour: "Amalfi Coast"},
  {name: "Villa Cimbrone Gardens", address: "Via Santa Chiara, 26, 84010 Ravello SA, Italien", siteImage: 'https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/39/a6/b5.jpg', tour: "Amalfi Coast"},
  {name: "Cioccolato Andrea Pansa", address: "Via Lorenzo D'Amalfi, 9, 84011 Amalfi SA, Italien", siteImage: 'https://media-cdn.tripadvisor.com/media/photo-s/08/78/55/03/cioccolato-e-gelato-andrea.jpg', tour: "Amalfi Coast"},
  {name: "Path of the Gods", address: "Piazza Paolo Capasso, 7, 80051 Agerola NA, Italien", siteImage: 'http://www.hotelvillacimbrone.com/wp-content/uploads/2020/01/sentiero-degli-dei-1024x683.jpg', tour: "Amalfi Coast"},
  {name: "Nino and Friends", address: "Via Pietro Capuano, 14, 84011 Amalfi SA, Italien", siteImage: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/20/c7/76/photo2jpg.jpg?w=1200&h=-1&s=1', tour: "Amalfi Coast"},
  {name: "Spiaggia di Positano", address: "Via del Brigantino, 84017 Positano SA, Italien", siteImage: 'https://sorrentoandamalficoast.com/wp-content/uploads/2013/06/012.jpg', tour: "Amalfi Coast"},
  {name: "Arienzo Beach Club Positano", address: "Via Arienzo, 16, 84017 Positano SA, Italien", siteImage: 'https://images.squarespace-cdn.com/content/v1/5a55e179f9a61eaaa3755e66/1623104498344-IJPJZPZW7DGA738CQAJT/Bagni+d%27Arienzo-Edit.jpg?format=1000w', tour: "Amalfi Coast"},
  {name: "Lost Lagoon", address: "Lost Lagoon Path, Vancouver, BC, Kanada", siteImage: 'https://www.encirclephotos.com/wp-content/uploads/Canada-Vancouver-Lost-Lagoon-Downtown-Skyline-1440x954.jpg', tour: "British Columbia"},
  {name: "VanDusen Botanical Garden", address: "5251 Oak St, Vancouver, BC V6M 4H1, Kanada", siteImage: 'https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_1400/MTczODYwNTI1NTE4NjI3OTA0/join-us-on-our-stroll-through-the-van-dusen-botanical-gardens-in-vancouver.webp', tour: "British Columbia"},
  {name: "Vancouver Aquarium", address: "845 Avison Way, Vancouver, BC V6G 3E2, Kanada", siteImage: 'https://smapse.com/storage/2019/09/converted/895_0_o-2.jpg', tour: "British Columbia"},
  {name: "Wild Whales Vancouver", address: "1806 Mast Tower Ln, Vancouver, BC V6H 4B6, Kanada", siteImage: 'https://traveltop6.com/assets/media/guides/_1024xAUTO_crop_center-center_none/2-Whale-watching.jpg', tour: "British Columbia"},
  {name: "McDonald's", address: "1527 Main St, Vancouver, BC V6A 2W5, Kanada", siteImage: 'https://media-cdn.tripadvisor.com/media/photo-s/10/5f/58/ff/mcdonald-s.jpg', tour: "British Columbia"},
  {name: "Cartems Donuts", address: "534 W Pender St, Vancouver, BC V6B 1V3, Kanada", siteImage: 'https://media-cdn.tripadvisor.com/media/photo-s/0e/d4/a8/29/display-level-2.jpg', tour: "British Columbia"},
  {name: "Karlskirche", address: "1040 Vienna, Austria", siteImage: 'https://www.wien.info/resource/image/416010/3x2/894/595/2fd1bd35faf7989b2756a638bbc3a20f/2142F96BD2D87ECBA3FBB7A0E0FA6C57/50919-karlskirche.jpg', tour: "Vienne"},
  {name: "Sanssouci", address: "Maulbeerallee, 14469 Potsdam", siteImage: 'https://www.spsg.de/fileadmin/_processed_/0/3/csm_SPSG_SchlossSanssouci_LeoSeidel_A4_Presse_ee424960a5.jpg', tour: "Brandenburg"},
  {name: "Fushimi Inari Taisha", address: "68 Fukakusa Yabunouchichō, Fushimi Ward, Kyoto, 612-0882, Japan", siteImage: 'https://www.omamori.com/img/cms/temples-shrines/fushimi-inari-taisha.jpg', tour: "Kyoto"},
  {name: "Guggenheim Museum", address: "Abandoibarra Etorb., 2, 48009 Bilbo, Bizkaia, Spain", siteImage: 'https://upload.wikimedia.org/wikipedia/commons/d/de/Guggenheim-bilbao-jan05.jpg', tour: "Basque Country"},
  {name: "Snowdonia National Park", address: "Penrhyndeudraeth LL48 6LF, UK", siteImage: 'https://image.geo.de/30103390/t/6j/v3/w1440/r1.7778/-/teaser-jpg--57347-.jpg', tour: "Wales"},
  {name: "Vasa Museum", address: "Galärvarvsvägen 14, 115 21 Stockholm, Sweden", siteImage: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/2e/17/99/smtm.jpg?w=1200&h=-1&s=1', tour: "Sverige"},
  {name: "Moderna Museet", address: "Exercisplan 4, 111 49 Stockholm, Schweden", siteImage: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/d8/78/2d/fb-img-1560009237907.jpg?w=1200&h=-1&s=1', tour: "Sverige"},
  {name: "Louisiana Museum", address: "Gl Strandvej 13, 3050 Humlebæk, Dänemark", siteImage: 'https://museumforall.eu/media/pictures/oZTYT7-2018_JeremyJachym_04-1-1920x1438.jpg', tour: "Copenhagen Sommer 2021"},
  {name: "Studio Arhoj", address: "Skindergade 7, st, 1159 København, Dänemark", siteImage: 'https://gdkfiles.visitdenmark.com/files/382/193726_Studio_Arhoj_Studio_Arhoj4.jpg?width=987', tour: "Copenhagen Sommer 2021"},
  {name: "Reseller", address: "Pilestræde 46, 1112 København, Dänemark", siteImage: 'https://lh3.googleusercontent.com/p/AF1QipMdv0kcYAwHypW6-qYut5Mny-WC15RE-mAAHJeh=s1360-w1360-h1020', tour: "Copenhagen Sommer 2021"},
  {name: "Ny Carlsberg Glyptotek", address: "Dantes Plads 7, 1556 København, Dänemark", siteImage: 'https://scanmagazine.co.uk/content/uploads/2022/03/1_Interi%C3%B8r-Efter%C3%A5r-2018-Vinterhaven-COL-54-web.jpg', tour: "Copenhagen Sommer 2021"},
  {name: "Hart Bageri", address: "Gl. Kongevej 109, 1850 Frederiksberg, Dänemark", siteImage: 'https://media-cdn.tripadvisor.com/media/photo-s/16/97/a8/22/hart-bageri.jpg', tour: "Copenhagen Sommer 2021"},
  {name: "Nordisk Film Biografen Palads", address: "Axeltorv 9, 1609 København, Dänemark", siteImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuX3P7zBxzXi-XBXTP0oLIV4Fg4k2p7Q8bc3wr2ULNnk5SReV6yajcs8ZxaIzE7OUih-U&usqp=CAU', tour: "Copenhagen Sommer 2021"},
  {name: "Mikkeller Bar", address: "Viktoriagade 8, B-C, 1655 København, Dänemark", siteImage: 'https://media-cdn.tripadvisor.com/media/photo-s/1a/59/7c/bc/mikkeller-baghaven.jpg', tour: "Copenhagen Sommer 2021"},
  {name: "Restaurant Madklubben Østerbro", address: "Østerbrogade 79, 1. sal, 2100 København, Dänemark", siteImage: 'https://cdn.bloggersdelight.dk/wp-content/blogs.dir/180145/files/2018/01/IMG_5939.jpg', tour: "Copenhagen Sommer 2021"},
  {name: "DØP - Den Økologiske Pølsemand", address: "Amagertorv 31, 1160 København, Dänemark", siteImage: 'https://fastly.4sqi.net/img/general/600x600/918917_6UAD3pu1fMTkQBOhiN0AqW2nnUkbcN8O5JH2ec3G7ok.jpg', tour: "Copenhagen Sommer 2021"},
  {name: "Open water swimming pool Fisketorvet", address: "Kalvebod Brygge 55, 1560 København V, Dänemark", siteImage: 'https://files.guidedanmark.org/files/382/285531_Havnebadet_Fisketorvet.jpg', tour: "Copenhagen Sommer 2021"},
  {name: "Parque Ecologico do Funchal", address: "Ribeira das Cales-Zona 22, 9050, Portugal", siteImage: 'https://lifecooler.com/files/registos/imagens/355753/219987.jpg', tour: "Honeymoon Madeira"},
  {name: "Monte Palace Madeira", address: "Caminho do Monte 174, 9050-288 Funchal, Portugal", siteImage: 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Funchal_Jardim_Monte_2016_3.jpg', tour: "Honeymoon Madeira"},
  {name: "Fábrica Santo Antonio", address: "Tv. do Forno 27-29 9000-079, 9000-077 Funchal, Portugal", siteImage: 'http://3.bp.blogspot.com/-a1GP4fPSFlM/VlRKf6eqgWI/AAAAAAAAIjA/wzTpnJR_rDE/s640/936902_532163560153354_1251069033_n.jpg', tour: "Honeymoon Madeira"},
  {name: "Museion", address: "Piero Siena Pl., 1, 39100 Bozen, Autonome Provinz Bozen - Südtirol, Italien", siteImage: 'https://www.suedtirolfueralle.it/contents/images/list_point/1893/museion-5.jpg', tour: "Südtirol"},
  {name: "Löwengrube", address: "Zollstange 3, 39100 Bozen, Autonome Provinz Bozen - Südtirol, Italien", siteImage: 'https://fastly.4sqi.net/img/general/200x200/6107770_DeltbjFgDnvVeAyfSiy-I2XGTx6Ob8sn1PW3O5caFPw.jpg', tour: "Südtirol"},
  {name: "Buchladen Mardi Gras", address: "Andreas-Hofer-Straße, 4, 39100 Bozen, Autonome Provinz Bozen - Südtirol, Italien", siteImage: 'https://lh5.googleusercontent.com/p/AF1QipPSgVaSnKSDmkhjQiF0ycpBjwXc-tRel_5Rl6q8=w408-h725-k-no', tour: "Südtirol"},
  {name: "Lido Meran", address: "Schwimmbadstraße, 38, 39012 Meran, Autonome Provinz Bozen - Südtirol, Italien", siteImage: 'https://lh5.googleusercontent.com/p/AF1QipORIiWMCsLG75Ep87_4JoxHxqYTRpN8kS3mVN29=w426-h240-k-no', tour: "Südtirol"},
  {name: "La Bruschetta", address: "Romstraße, 144, 39012 Meran, Autonome Provinz Bozen - Südtirol, Italien", siteImage: 'https://lh5.googleusercontent.com/p/AF1QipM6pE2Bm8y_cHHB1A_uHI5Wf8CXvEsGR_uVgIjX=w408-h306-k-no', tour: "Südtirol"},
  {name: "Bar De Val", address: "Zona Artigianale, 20, 38038 Tesero TN, Italien ", siteImage: 'https://www.visitfiemme.it/media/deskline/infrastructure/objects/bar-de-val_581465/image-thumb__2117909__demi-infrastructure-event-half-header-img/bar-de-val_581467.jpg', tour: "Südtirol"},
  {name: "Berghotel Miramonti", address: "Località Stava, 5, 38038 Tesero TN, Italien", siteImage: 'https://cf.bstatic.com/xdata/images/hotel/max1280x900/322020474.jpg?k=ab622ee453f0cfa77432608c717bd3b1b07da0147758a89b66d6b79ccce71c13&o=&hp=1', tour: "Südtirol"},
  {name: "Baby Snowpark", address: "Località Belvedere, 38030 Ziano di Fiemme TN, Italien", siteImage: 'https://www.latemar.it/wp-content/uploads/2019/07/dsc_0140-e1567668004769.jpg', tour: "Südtirol"},
  {name: "Pian delle Maddalene", address: "38030 Ziano di Fiemme, Autonomous Province of Trento, Italien", siteImage: 'https://lh5.googleusercontent.com/p/AF1QipN7IfFWtHDFBnKTmrel9SEz_eHfo7IhgW-jLF4K=w442-h240-k-no', tour: "Südtirol"},
  {name: "Il Bosco Che Suona", address: "38037 Predazzo, Autonomous Province of Trento, Italien", siteImage: 'https://lh5.googleusercontent.com/p/AF1QipOznSupjw93v-w2EaNuPOMlkD3Ozxn1nntouk6E=w408-h408-k-no', tour: "Südtirol"}
]



tours.each_with_index do |tour, index|
  tour = Tour.new(name: tour[:name], description: tour[:description])
  tour.user = User.create(email: Faker::Internet.email, username: Faker::Internet.username, password: '123456', img_url: Faker::Avatar.image)
  tour.photo.attach(io: URI.open(tours[index][:images]), filename: 'tourImage')
  tour.save
  puts "#{tour.name} created"
  sites.each_with_index do |site, index|
    if site[:tour] == tour.name
      new_site = Site.create!(name: sites[index][:name], address: sites[index][:address], tour: tour)
      new_site.photo.attach(io: URI.open(sites[index][:siteImage]), filename: 'siteImage')
    end
  end
  puts "site created"
end
