const USERS = [
  {
    "id": 1,
    "user": "Olaf the Giantslayer",
    "adress": ["Pezzlgasse", "15"],
    "plz": 1170,
    "coordinates": [48.218882, 16.337248],
    "trustFactor": 10,
    "tasks": [1, 3, 5]
  }
];

const TASKS = [
  {
    "taskId": 1,
    "user": 1,
    "taskName": "Kartoffelgulasch",
    "image": "assets/images/gulasch2.jpg",
    "taskType": "Foodsharing",
    "coordinates": [48.218882, 16.337248],
    "category": [2],
    "taskDescription":
        "Ich habe ein Kartoffel Gulasch gemacht und es blieb etwas übrig. Bitte melden wenn Interesse."
  },
  {
    "taskId": 9,
    "user": 1,
    "taskName": "Gemüsesuppe mit Grießnockerl",
    "image": "assets/images/gulasch2.jpg",
    "taskType": "Foodsharing",
    "coordinates": [48.218882, 16.337248],
    "category": [2],
    "taskDescription": "Bitte Behälter mitbringen"
  },
  {
    "taskId": 8,
    "user": 1,
    "taskName": "Pizza 3/4",
    "image": "assets/images/gulasch2.jpg",
    "taskType": "Foodsharing",
    "coordinates": [48.218882, 16.337248],
    "category": [2],
    "taskDescription":
        "Von unserer Party heute sind noch ein paar Ecken Pizza übrig geblieben. Sind bis ca. 21 Uhr wach."
  },
  {
    "taskId": 2,
    "user": 1,
    "taskName": "Einkauf",
    "image": "assets/images/gulasch2.jpg",
    "taskType": "Unterstützung",
    "coordinates": [48.218882, 16.337248],
    "category": [4],
    "taskDescription":
        "Ich sitze derzeit mit einem gebrochenen Bei zuhause und kann nich einkaufen gehen."
  },
  {
    "taskId": 3,
    "user": 1,
    "taskName": "Handy gefunden",
    "image": "assets/images/gulasch2.jpg",
    "taskType": "Gefunden",
    "coordinates": [48.218882, 16.337248],
    "category": [3],
    "taskDescription": "Habe dieses Handy x an Stelle y gefunden"
  },
  {
    "taskId": 4,
    "user": 1,
    "image": "assets/images/gulasch2.jpg",
    "taskName": "Klopapier bei Amazon",
    "taskType": "Onlinebestellung",
    "coordinates": [48.218882, 16.337248],
    "category": [5],
    "taskDescription":
        "Da in den Supermärkten gerade aus, möchten wir eine Sammelbestellung Klopapier auf Amazon machen."
  },
  {
    "taskId": 7,
    "user": 1,
    "image": "assets/images/gulasch2.jpg",
    "taskName": "Red Bubble Bestellung",
    "taskType": "Onlinebestellung",
    "coordinates": [48.218882, 16.337248],
    "category": [5],
    "taskDescription":
        "Ich möchte mir T-Shirts bei Red Bubble bestellen und mir die Versandkosten sparen."
  },
  {
    "taskId": 5,
    "user": 1,
    "image": "assets/images/gulasch2.jpg",
    "taskName": "Karaoke Abend im X Beisl",
    "taskType": "Themenabend",
    "coordinates": [48.218882, 16.337248],
    "category": [6],
    "taskDescription": "Karakoe Abend im X Beisl um die Ecke"
  },
  {
    "taskId": 6,
    "user": 1,
    "image": "assets/images/gulasch2.jpg",
    "taskName": "Brettspiele Abend",
    "taskType": "Spiele",
    "coordinates": [48.218882, 16.337248],
    "category": [6],
    "taskDescription":
        "Wir haben einen Brettspiele Abend geplant und möchten euch einladen. Bei Interesse, meldet euch! :)"
  },
];
