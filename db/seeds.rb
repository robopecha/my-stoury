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

Tour.destroy_all
Site.destroy_all
Note.destroy_all
User.destroy_all

tours = [{name:"Hamburg", description: "Nice tour"},
        {name: "London", description: "Nice tour"},
        {name: "Bangladesh", description: "Nice tour"},
        {name: "Amalfi Coast", description: "Nice tour"},
        {name: "British Columbia", description: "Nice tour"},
        {name: "Sweden", description: "Nice tour"},
        {name: "Vienna", description: "Nice tour"},
        {name: "North Brandenburg", description: "Nice tour"},
        {name: "Kyoto", description: "Nice tour"},
        {name: "Basque Country", description: "Nice tour"},
        {name: "Wales", description: "Nice tour"},
]

sites = ["Hamburger Dom",
"Big Ben",
"Lalbagh Fort",
"Villa Rufolo",
"Stanley Park",
"Vasa Museum",
"Karlskirche",
"Sanssouci",
"Fushimi Inari Taisha",
"Guggenheim Museum",
"Snowdonia National Park"]

address = [
  "Heiligengeistfeld, 20359 Hamburg",
  "London SW1A 0AA, United Kingdom",
  "Lalbagh Rd, Dhaka 1211, Bangladesh",
  "Piazza Duomo, 1, 84010 Ravello SA, Italy",
  "Vancouver, BC V6G 1Z4, Canada",
  "Galärvarvsvägen 14, 115 21 Stockholm, Sweden",
  "1040 Vienna, Austria",
  "Maulbeerallee, 14469 Potsdam",
  "68 Fukakusa Yabunouchichō, Fushimi Ward, Kyoto, 612-0882, Japan",
  "Abandoibarra Etorb., 2, 48009 Bilbo, Bizkaia, Spain",
  "Penrhyndeudraeth LL48 6LF, UK"

]

images = ['https://t3.ftcdn.net/jpg/02/12/56/40/360_F_212564055_ToVrfEm69urXSAj3Xd4y6gq1XmHSXJ8r.jpg',
  'https://cdn.londonandpartners.com/-/media/images/london/visit/things-to-do/sightseeing/london-attractions/coca-cola-london-eye/the-london-eye-2-640x360.jpg?mw=640&hash=F7D574072DAD523443450DF57E3B91530064E4EE',
  'https://www.state.gov/wp-content/uploads/2019/07/Bangladesh-2109x1406.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Amalfi_panorama_I.jpg/2880px-Amalfi_panorama_I.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwaqEUW4ZwBsPOcGuRb9cM70UvfZ2abMQy8A&usqp=CAU',
  'https://population-europe.eu/files/styles/pe_content_xl/public/media-images/istock-1154990774_vladislav_zolotov.jpg?itok=F-XAvG1-',
  'https://a.cdn-hotels.com/gdcs/production68/d1190/c23fddfd-36a8-41c0-94f8-01e3a14e49e5.jpg',
  'https://ag-historische-stadtkerne.de/wp-content/uploads/2019/12/Brandenburg-Havel-01-LF-2012_Aviapictures.jpg',
  'https://rimage.gnst.jp/livejapan.com/public/article/detail/a/20/00/a2000676/img/basic/a2000676_main.jpg?20220629183100&q=80&rw=750&rh=536',
  'https://www.winetraveler.com/wp-content/uploads/2018/01/basque-region-of-spain-guide-winetraveler-1.jpg',
  'https://a.cdn-hotels.com/gdcs/production108/d1704/9aa8a8e0-58f0-11e8-a5ee-0242ac110030.jpg?impolicy=fcrop&w=800&h=533&q=medium'
  ]

  siteImages = ['https://www.hamburg.de/image/4315670/16x9/990/557/cad1f4305c55ee00d8e0d8be6c7a34fc/XS/hamburger-dom.jpg',
    'https://www.merkur.de/bilder/2021/12/21/91193344/27024679-blick-auf-den-big-ben-in-london-2o56ZQW5zgec.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Dhaka_Lalbagh_Fort_5.JPG/1200px-Dhaka_Lalbagh_Fort_5.JPG',
    'https://upload.wikimedia.org/wikipedia/commons/2/21/Ravello_Villa_Rufolo.JPG',
    'https://media.explorer.de/_Resources/Persistent/c/1/1/8/c118359ce33c8cca709c5af60153b64b4bbb8ff1/Stanley-Park-British-Columbia-2500x891-718x256.jpg',
    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/2e/17/99/smtm.jpg?w=1200&h=-1&s=1',
    'https://www.wien.info/resource/image/416010/3x2/894/595/2fd1bd35faf7989b2756a638bbc3a20f/2142F96BD2D87ECBA3FBB7A0E0FA6C57/50919-karlskirche.jpg',
    'https://www.spsg.de/fileadmin/_processed_/0/3/csm_SPSG_SchlossSanssouci_LeoSeidel_A4_Presse_ee424960a5.jpg',
    'https://www.omamori.com/img/cms/temples-shrines/fushimi-inari-taisha.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/d/de/Guggenheim-bilbao-jan05.jpg',
    'https://image.geo.de/30103390/t/6j/v3/w1440/r1.7778/-/teaser-jpg--57347-.jpg'

  ]


tours.each_with_index do |tour, index|
  tour = Tour.new(name: tour[:name], description: tour[:description])
  tour.user = User.create(email: Faker::Internet.email, username: Faker::Internet.user, password: Faker::Internet.password)
  tour.photo.attach(io: URI.open(images[index]), filename: 'london')
  tour.save
  puts "#{tour.name} created"
  site = Site.create!(name: sites[index], address: address[index], tour: tour)
  site.photo.attach(io: URI.open(siteImages[index]), filename: 'paris')
  puts "site created"
end
