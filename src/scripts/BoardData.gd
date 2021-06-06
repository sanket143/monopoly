extends Node

var CardEntity = preload("res://src/scripts/models/CardEntity.gd")

var cards = [
    CardEntity.new({
        "title": "START",
        "text_color": "color0",
        "color": "color10",
        "type": Global.CardType.START,
    }),
    CardEntity.new({
        "title": "Old Kent Road",
        "color": "color1",
        "text_color": "color0",
        "rents": [10,30,90,160],
        "site": 2,
        "hotel_rent": 250,
        "cost": 60,
        "house_cost": 50,
        "hotel_cost": 100,
        "filename": "old-kent-road.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({ # Community Chest
        "title": "Community Chest",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.COMMUNITY_CHEST
    }),
    CardEntity.new({ # Whitechapel Road
        "title": "Whitechapel Road",
        "color": "color1",
        "text_color": "color0",
        "rents": [20,60,180,320],
        "site": 4,
        "hotel_rent": 450,
        "cost": 60,
        "house_cost": 50,
        "hotel_cost": 100,
        "filename": "whitechapel-road.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Income Tax",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.INCOME_TAX
    }),
    CardEntity.new({
        "title": "King's Cross station",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.STATION
    }),
    CardEntity.new({
        "title": "The Angel Islington",
        "color": "color2",
        "text_color": "color0",
        "rents": [30,90,270,400],
        "site": 6,
        "hotel_rent": 550,
        "cost": 100,
        "house_cost": 50,
        "hotel_cost": 100,
        "filename": "the-angel-islington.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Chance",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.CHANCE
    }),
    CardEntity.new({
        "title": "Euston Road",
        "color": "color2",
        "text_color": "color0",
        "rents": [30,90,270,400],
        "site": 5,
        "hotel_rent": 550,
        "cost": 100,
        "house_cost": 50,
        "hotel_cost": 100,
        "filename": "euston-road.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Pentonville Road",
        "color": "color2",
        "text_color": "color0",
        "rents": [40,100,300,450],
        "site": 8,
        "hotel_rent": 600,
        "cost": 120,
        "house_cost": 50,
        "hotel_cost": 100,
        "filename": "pentonville-road.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Jail",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.JAIL
    }),
    CardEntity.new({
        "title": "Pall Mall",
        "color": "color3",
        "text_color": "color0",
        "rents": [50,150,450,625],
        "site": 10,
        "hotel_rent": 750,
        "cost": 140,
        "house_cost": 100,
        "hotel_cost": 200,
        "filename": "pall-mall.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Electric Company",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.ELECTRIC_COMPANY
    }),
    CardEntity.new({
        "title": "Whitehall",
        "color": "color3",
        "text_color": "color0",
        "rents": [50,150,450,625],
        "site": 5,
        "hotel_rent": 750,
        "cost": 140,
        "house_cost": 100,
        "hotel_cost": 200,
        "filename": "whitehall.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Northumberland Avenue",
        "color": "color3",
        "text_color": "color0",
        "rents": [60,180,500,700],
        "site": 12,
        "hotel_rent": 900,
        "cost": 160,
        "house_cost": 100,
        "hotel_cost": 200,
        "filename": "northumberland-avenue.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Marylebone station",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.STATION
    }),
    CardEntity.new({
        "title": "Bow Street",
        "color": "color4",
        "text_color": "color0",
        "rents": [70,200,550,750],
        "site": 14,
        "hotel_rent": 950,
        "cost": 180,
        "house_cost": 100,
        "hotel_cost": 200,
        "filename": "bow-street.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({ # Community Chest
        "title": "Community Chest",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.COMMUNITY_CHEST
    }),
    CardEntity.new({
        "title": "Marlborough Street",
        "color": "color4",
        "text_color": "color0",
        "rents": [70,200,550,750],
        "site": 14,
        "hotel_rent": 950,
        "cost": 180,
        "house_cost": 100,
        "hotel_cost": 200,
        "filename": "marlborough-street.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Vine Street",
        "color": "color4",
        "text_color": "color0",
        "rents": [80,220,600,800],
        "site": 16,
        "hotel_rent": 1000,
        "cost": 200,
        "house_cost": 100,
        "hotel_cost": 200,
        "filename": "vine-street.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Free Parking",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.PARKING
    }),
    CardEntity.new({
        "title": "The Strand",
        "color": "color5",
        "text_color": "color0",
        "rents": [90,250,700,875],
        "site": 18,
        "hotel_rent": 1050,
        "cost": 220,
        "house_cost": 150,
        "hotel_cost": 300,
        "filename": "the-strand.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Chance",
        "color": "color9",
        "text_color": "color10",
        "type": Global.CardType.CHANCE
    }),
    CardEntity.new({
        "title": "Fleet Street",
        "color": "color5",
        "text_color": "color0",
        "rents": [90,250,700,875],
        "site": 18,
        "hotel_rent": 1050,
        "cost": 220,
        "house_cost": 150,
        "hotel_cost": 300,
        "filename": "fleet-street.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Trafalgar Square",
        "color": "color5",
        "text_color": "color0",
        "rents": [100, 300, 750, 925],
        "site": 20,
        "hotel_rent": 1100,
        "cost": 240,
        "house_cost": 150,
        "hotel_cost": 300,
        "filename": "trafalgar-square.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Fenchurch Street station",
        "color": "color9",
        "text_color": "color10",
        "type": Global.CardType.STATION
    }),
    CardEntity.new({
        "title": "Leicester Square",
        "color": "color6",
        "text_color": "color0",
        "rents": [110, 330, 800, 975],
        "site": 22,
        "hotel_rent": 1150,
        "cost": 260,
        "house_cost": 150,
        "hotel_cost": 300,
        "filename": "leicester-square.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Coventry Street",
        "color": "color6",
        "text_color": "color0",
        "rents": [110, 330, 800, 975],
        "site": 22,
        "hotel_rent": 1150,
        "cost": 260,
        "house_cost": 150,
        "hotel_cost": 300,
        "filename": "coventry-street.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Water Works",
        "color": "color9",
        "text_color": "color10",
        "type": Global.CardType.WATER_WORKS
    }),
    CardEntity.new({
        "title": "Piccadilly",
        "color": "color6",
        "text_color": "color0",
        "rents": [120, 360, 850, 1025],
        "site": 22,
        "hotel_rent": 1200,
        "cost": 280,
        "house_cost": 150,
        "hotel_cost": 300,
        "filename": "piccadilly.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Go To Jail",
        "color": "color9",
        "text_color": "color10",
        "type": Global.CardType.GO_TO_JAIL
    }),
    CardEntity.new({
        "title": "Regent Street",
        "color": "color7",
        "text_color": "color0",
        "rents": [130, 390, 900, 1100],
        "site": 26,
        "hotel_rent": 1275,
        "cost": 300,
        "house_cost": 200,
        "hotel_cost": 400,
        "filename": "regent-street.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Oxford Street",
        "color": "color7",
        "text_color": "color0",
        "rents": [130, 390, 900, 1100],
        "site": 26,
        "hotel_rent": 1275,
        "cost": 300,
        "house_cost": 200,
        "hotel_cost": 400,
        "filename": "oxford-street.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({ # Community Chest
        "title": "Community Chest",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.COMMUNITY_CHEST
    }),
    CardEntity.new({
        "title": "Bond Street",
        "color": "color7",
        "text_color": "color0",
        "rents": [150, 450, 1000, 1200],
        "site": 28,
        "hotel_rent": 1400,
        "cost": 320,
        "house_cost": 200,
        "hotel_cost": 400,
        "filename": "bond-street.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Liverpool Street station",
        "color": "color9",
        "text_color": "color10",
        "type": Global.CardType.STATION
    }),
    CardEntity.new({
        "title": "Chance",
        "color": "color9",
        "text_color": "color10",
        "type": Global.CardType.CHANCE
    }),
    CardEntity.new({
        "title": "Park Lane",
        "color": "color8",
        "text_color": "color0",
        "rents": [175, 500, 1100, 1300],
        "site": 35,
        "hotel_rent": 1500,
        "cost": 350,
        "house_cost": 250,
        "hotel_cost": 500,
        "filename": "park-lane.jpg",
        "type": Global.CardType.PROPERTY
    }),
    CardEntity.new({
        "title": "Income Tax",
        "text_color": "color10",
        "color": "color9",
        "type": Global.CardType.INCOME_TAX
    }),
    CardEntity.new({
        "title": "Mayfair",
        "color": "color8",
        "text_color": "color0",
        "rents": [200, 600, 1400, 1700],
        "site": 50,
        "hotel_rent": 2000,
        "cost": 400,
        "house_cost": 250,
        "hotel_cost": 500,
        "filename": "mayfair.jpg",
        "type": Global.CardType.PROPERTY
    }),
]
