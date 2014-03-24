# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# roles
r1 = Role.create!(name: "arzt")
r2 = Role.create!(name: "verwalter")
r3 = Role.create!(name: "pflegekraft")
r4 = Role.create!(name: "admin")
r5 = Role.create!(name: "techadmin")
r6 = Role.create!(name: "dienstnutzer")
r7 = Role.create!(name: "dienstanbieter")

# roles for test scenario
r9 = Role.create!(name: "stationsleiter")
r10 = Role.create!(name: "stationsarzt")
r11 = Role.create!(name: "oberarzt")
r12 = Role.create!(name: "auszubildener")
r13 = Role.create!(name: "assistenzarzt")
r14 = Role.create!(name: "externer arzt")

# users
u1 = User.create!(email: "arzt@cloud-tresor.de", username: "arzt", password: "1234")
u1.roles << r1
u1.roles << r6
u2 = User.create!(email: "verwaltung@cloud-tresor.de", username: "verwaltung", password: "1234")
u2.roles << r2
u3 = User.create!(email: "pflege@cloud-tresor.de", username: "pflege", password: "1234")
u3.roles << r3
u3.roles << r6
u4 = User.create!(email: "admin@cloud-tresor.de", username: "admin", password: "1234")
u4.roles << r4
u5 = User.create!(email: "techadmin@cloud-tresor.de", username: "techadmin", password: "1234")
u5.roles << r5
# u6 = User.create(email: "dienstnutzer@tcloud-tresor.de", username: "dienstnutzer", password: "1234")
# u6.roles << r6
u7 = User.create!(email: "dienstanbieter@cloud-tresor.de", username: "dienstanbieter", password: "1234")
u7.roles << r7

# users for test scenario
# arzt and pfegekraft for each hospital
u8 = User.create!(email: "pkh-arzt@cloud-tresor.de", username: "pkh-arzt", password: "1234")
u8.roles << r1
u9 = User.create!(email: "pkh-pflege@cloud-tresor.de", username: "pkh-pflege", password: "1234")
u9.roles << r3
u10 = User.create!(email: "dhzb-arzt@cloud-tresor.de", username: "dhzb-arzt", password: "1234")
u10.roles << r1
u11 = User. create!(email: "dhzb-pflege@cloud-tresor.de", username: "dhzb-pflege", password: "1234")
u11.roles << r3

u12 = User.create!(email: "pkh-oberarzt@cloud-tresor.de", username: "pkh-oberarzt", password: "1234")
u12.roles << r11
u13 = User.create!(email: "dhzb-oberarzt@cloud-tresor.de", username: "dhzb-oberarzt", password: "1234")
u13.roles << r11

u14 = User.create!(email: "pkh-stationsarzt@cloud-tresor.de", username: "pkh-stationsarzt", password: "1234")
u14.roles << r10
u15 = User.create!(email: "dhzb-stationsarzt@cloud-tresor.de", username: "dhzb-stationsarzt", password: "1234")
u15.roles << r10

u16 = User.create!(email: "pkh-stationsleiter@cloud-tresor.de", username: "pkh-stationsleiter", password: "1234")
u16.roles << r9
u16 = User.create!(email: "dhzb-stationsleiter@cloud-tresor.de", username: "dhzb-stationsleiter", password: "1234")
u16.roles << r9

u17 = User.create!(email: "pkh-auszubildener@cloud-tresor.de", username: "pkh-auszubildener", password: "1234")
u17.roles << r12
u18 = User.create!(email: "dhzb-auszubildener@cloud-tresor.de", username: "dhzb-auszubildener", password: "1234")
u18.roles << r12

u19 = User.create!(email: "pkh-assistenzarzt@cloud-tresor.de", username: "pkh-assistenztarzt", password: "1234")
u19.roles << r13
u20 = User.create!(email: "dhzb-assistenzarzt@cloud-tresor.de", username: "dhzb-assistenzarzt", password: "1234")
u20.roles << r13

u21 = User.create!(email: "kardiologe@cloud-tresor.de", username: "kardiologe", password: "1234")
u21.roles << r14
u22 = User.create!(email: "nephrologe@cloud-tresor.de", username: "nephrologe", password: "1234")
u22.roles << r14
u23 = User.create!(email: "hausarzt@cloud-tresor.de", username: "hausarzt", password: "1234")
u23.roles << r14


#krankheiten
dm = Illness.create! name: "Diabetes mellitus", description: "Diabetes mellitus ist der Sammelbegriff für verschiedene (heterogene) Störungen des Stoffwechsels, deren Leitbefund eine Überzuckerung des Blutes (Hyperglykämie) ist. Mechanismen, welche zur Hyperglykämie führen, setzen überwiegend am Insulin, dem Hauptregelungshormon des Zuckerstoffwechsels im menschlichen Körper, an: absoluter Insulinmangel, relativer Insulinmangel durch eine abgeschwächte Wirksamkeit des Insulins (Insulinresistenz) oder beides zusammen."
bhd = Illness.create! name: "Arterielle Hypertonie", description: "Die Arterielle Hypertonie, oft verkürzt auch Hypertonie, Hypertonus, Hypertension oder im täglichen Sprachgebrauch Bluthochdruck genannt, ist ein Krankheitsbild, bei dem der Blutdruck des arteriellen Gefäßsystems chronisch erhöht ist. Nach Definition der WHO gilt ein systolischer Blutdruck von mindestens 140 mmHg oder ein diastolischer Blutdruck von mindestens 90 mmHg als Hypertonie."
nv = Illness.create! name: "Nierenversagen", description: "Ein Nierenversagen bedeutet die Verschlechterung oder den Verlust der Nierenfunktion. Es gibt zwei zeitliche Verlaufsformen des Nierenversagens, das chronische und das akute Nierenversagen. In beiden Fällen funktionieren die Nieren qualitativ nicht mehr oder nur in sehr geringem Umfang (die Urinproduktion kann quantitativ unverändert erhalten bleiben oder sogar gesteigert sein). Der Unterschied in den Verlaufsformen liegt in der Zeitspanne und der Prognose."

tu = Illness.create! name: "Tuberkulose", description: "Die Tuberkulose (kurz Tb, TB, Tbc oder TBC; lat. tuberculum „kleines Geschwulst“), früher auch als Schwindsucht oder Morbus Koch, umgangssprachlich als die Motten bezeichnet, ist eine weltweit verbreitete bakterielle Infektionskrankheit, die durch verschiedene Arten von Mykobakterien verursacht wird und beim Menschen am häufigsten die Lungen befällt."
hyp = Illness.create! name: "Hypakusis", description: "Unter Schwerhörigkeit (Hypakusis) versteht man eine Minderung des Hörvermögens. Die Ausprägung der Störung kann von leichter Schwerhörigkeit bis zur Gehörlosigkeit reichen und vielfältige Ursachen haben."
ane = Illness.create! name: "Aneurysma", description: "Das Aneurysma (von altgriechisch ἀνεύρυσμα aneúrysma /aneǔ̯rusma/, wörtlich: „Erweiterung“, Mehrzahl Aneurysmen oder Aneurysmata )[1][2][Anmerkung 1], auch Arterienerweiterung oder umgangssprachlich Arterielle Aussackung genannt, ist eine spindel- oder sackförmige, lokalisierte, permanente Erweiterung des Querschnitts von Blutgefäßen infolge angeborener oder erworbener Wandveränderungen."
mar = Illness.create! name: "Marasmus senilis", description: "Mit Altersschwäche oder Marasmus senilis wird der Abbau körperlicher Funktionen mit zunehmendem Alter bezeichnet. Dieser natürliche Prozess des Alterns, dem alle Organe und Gewebe unterliegen, wird in der Pathologie auch als physiologische Altersatrophie bezeichnet."
fat = Illness.create! name: "Herzinsuffizienz", description: "Die Herzinsuffizienz ist die krankhafte Unfähigkeit des Herzens, die vom Körper benötigte Blutmenge ohne Druckanstieg in den Herzvorhöfen zu fördern."
apl = Illness.create! name: "Aplastische Anämie", description: "Die Aplastische Anämie (Syn. Panmyelopathie[1]) ist eine Sonderform der Anämie (Blutarmut). Man versteht darunter Knochenmarkversagen mit Panzytopenie, das heißt eine Verringerung der Anzahl aller Zellen des Blutes (Anämie + Leukopenie + Thrombozytopenie) aufgrund von erworbener (häufig) oder angeborener (selten) Knochenmarkaplasie."
ova = Illness.create! name: "Ovarialkarzinom", description: "Das Ovarialkarzinom oder Eierstockkrebs ist eine bösartige Erkrankung der Eierstöcke. Es ist in der westlichen Welt nach dem Endometrium- und dem Zervixkarzinom das dritthäufigste Genitalmalignom der Frau und hat eine schlechtere Prognose als jene."
kar = Illness.create! name: "Karzinom", description: "Karzinome [kartsiˈnoːm] (singular: das Karzinom) sind Krebserkrankungen, die von Zellen im Deckgewebe von Haut oder Schleimhaut (Epithel) ausgehen. Genauer handelt es sich um ektodermale oder entodermale Neubildungen. Daraus ergibt sich eine weitere Differenzierung, je nach Art des entarteten Epithels."
pne = Illness.create! name: "Pneumonie", description: "Bei der Lungenentzündung oder Pneumonie handelt es sich um eine akute oder chronische Entzündung des Lungengewebes. Sie wird meist durch eine Infektion mit Bakterien, Viren oder Pilzen verursacht, selten auch toxisch durch Inhalation giftiger Stoffe oder immunologisch. Bei deutlicher Beteiligung der Pleura (Rippenfell) in Form einer Pleuritis wird im klinischen Sprachgebrauch von Pleuropneumonie gesprochen."

#medikamente
ins = Medicament.create! name: "Insulin", description: "Insulin ist ein für alle Wirbeltiere lebenswichtiges Proteohormon, das in den β-Zellen der Bauchspeicheldrüse gebildet wird. Diese spezialisierten Zellen befinden sich nur in den Langerhans-Inseln. Die wichtigste Art von Insulinpräparaten sind die Injektionslösungen."
vera = Medicament.create! name: "Verapamil", description: "Verapamilhydrochlorid, ist ein Arzneistoff aus der Gruppe der Calciumantagonisten oder Calciumkanalblocker, der gefäßerweiternd und im AV-Knoten des Herzens leitungsverzögernd wirkt. Verapamil gehört zur Klasse IV der Vaughan/Williams-Klassifikation der Antiarrhythmika und zählt zu den Phenylalkylaminen. Es wird eingesetzt zur Behandlung von Bluthochdruck"
met = Medicament.create! name: "Metformin", description: "Metformin ist ein Arzneistoff aus der Gruppe der Biguanide, der bei nicht insulinabhängiger Zuckerkrankheit (Diabetes mellitus Typ 2) und insbesondere bei leichtem Übergewicht (Präadipositas) und krankhaftem Übergewicht (Adipositas) eingesetzt wird. Es ist eines der am längsten eingesetzten Antidiabetika."

rif = Medicament.create! name: "Rifampicin", description: "ifampicin ist ein bakterizides Antibiotikum aus der Gruppe der Ansamycine (Rifamycine), welches semisynthetisch aus Rifamycin B, isoliert aus Amycolatopsis mediterranei, hergestellt wird."
col = Medicament.create! name: "Colistin", description: "Colistin (auch Polymyxin E) ist ein Antibiotikum aus der Gruppe der Polymyxine. Es steht seit 1959 zur Therapie zur Verfügung."

he = Medicament.create! name: "Heparin", description: "Heparine (altgr. ἧπαρ Hepar ‚Leber‘) sind körpereigene Vielfachzucker (Polysaccharide), die hemmend auf die Gerinnungskaskade wirken und daher auch therapeutisch zur Blutgerinnungshemmung verwendet werden."
ka = Medicament.create! name: "Kaliumjodid", description: "Kaliumiodid ist das weiße, unter starker Abkühlung sehr leicht in Wasser lösliche Kalium-Salz der Iodwasserstoffsäure. Kaliumiodid wird im Labor zur Herstellung von Iod-Kaliumiodid-Lösung (Lugolsche Lösung) verwendet."
ol = Medicament.create! name: "Orlistat", description: "Orlistat ist ein Arzneistoff zur Behandlung von Adipositas (Übergewicht), der in Kombination mit einer ärztlich überwachten Reduktionsdiät eingesetzt werden soll."
uz = Medicament.create! name: "Uzara", description: "Uzara (Xysmalobium undulatum) ist eine Pflanzenart aus der Unterfamilie der Seidenpflanzengewächse (Asclepiadoideae). Sie ist in Südafrika beheimatet."

cor = Medicament.create! name: "Cortison", description: "Cortison (von lateinisch cortex, „Rinde“; Schreibweise auch Kortison) ist ein Steroidhormon, das um 1935 als erster Wirkstoff in der Nebennierenrinde des Menschen gefunden wurde. Cortison ist die durch Oxidation inaktivierte Form des Glucocorticoids Cortisol, das im Kohlenhydrathaushalt, dem Fettstoffwechsel und dem Proteinumsatz Bedeutung besitzt."
tax = Medicament.create! name: "Taxane", description: "Taxane sind natürlich vorkommende Zytostatika, also Stoffe, die das Zellwachstum bzw. die Zellteilung hemmen. Chemisch gesehen gehören Taxane zu den Diterpenoiden (Diterpene). Seit Anfang der 1990er Jahre werden Taxane in der Krebstherapie eingesetzt."

#konflikte_med

#konflikte_krankheit
ConflictIllness.create!(illness_id: nv.id, medicament_id: met.id, description: "Metformin darf nicht bei eingeschränkter Nierenfunktion verabreicht werden.")

#patienten
p1 = Patient.create!(first_name: "John", last_name: "Smith", age: 30, sex: "male", height: 185, body_surface_area: 1.9)
p2 = Patient.create!(first_name: "Nikola", last_name: "Tesla", age: 86, sex: "male", height: 182, body_surface_area: 1.7)
p3 = Patient.create!(first_name: "Thomas Alva", last_name: "Edison", age: 84, sex: "male", height: 182, body_surface_area: 1.8)
p4 = Patient.create!(first_name: "Albert", last_name: "Einstein", age: 76, sex: "male", height: 172, body_surface_area: 1.6)
p5 = Patient.create!(first_name: "Erwin", last_name: "Schroedinger", age: 74, sex: "male", height: 192, body_surface_area: 2.1)
p6 = Patient.create!(first_name: "Grace", last_name: "Hopper", age: 86, sex: "female", height: 168, body_surface_area: 1.5)
p7 = Patient.create!(first_name: "Konrad", last_name: "Zuse", age: 85, sex: "male", height: 186, body_surface_area: 2.2)

p8 = Patient.create!(first_name: "Marie", last_name: "Curie", age: 67, sex: "female", height: 168, body_surface_area: 1.5)
p9 = Patient.create!(first_name: "Rosalind", last_name: "Franklin", age: 38, sex: "female", height: 174, body_surface_area: 1.73)
p10 = Patient.create!(first_name: "Ada", last_name: "Lovelace", age: 36, sex: "female", height: 177, body_surface_area: 1.72)
p11 = Patient.create!(first_name: "Mary", last_name: "Somerville", age: 92, sex: "female", height: 165, body_surface_area: 1.52)
p12 = Patient.create!(first_name: "Sofja", last_name: "Wassiljewna Kowalewskaja", age: 41, sex: "female", height: 185, body_surface_area: 1.86)

# patient 1 illnesses
p1.illnesses << dm
p1.illnesses << nv

# patient 2 illnesses
p2.illnesses << dm

# patient 3 illnesses
p3.illnesses << hyp

# patient 4 illnesses
p4.illnesses << dm

# patient 5 illnesses
p5.illnesses << tu

# patient 6 illnesses
p6.illnesses << mar

# patient 7 illnesses
p7.illnesses << dm

# patient 8 illnesses
p8.illnesses << apl

# patient 9 illnesses
p9.illnesses << ova

# patient 10 illnesses
p10.illnesses << kar

# patient 11 illnesses
p11.illnesses << mar	

# patient 12 illnesses
p12.illnesses << pne

# patient 1 medicaments
p1.medicaments << ins
p1.medicaments << met

# patient 5
p5.medicaments << rif

# patient 8
p8.medicaments << cor

# patient 9
p9.medicaments << tax

# patient 12
p12.medicaments << rif

# patient 1 blood pressures
BloodPressure.create!(patient_id: p1.id, systolic: 158, diastolic: 80, date: DateTime.new(2012,10,1,6))
BloodPressure.create!(patient_id: p1.id, systolic: 150, diastolic: 79, date: DateTime.new(2012,10,1,18))
BloodPressure.create!(patient_id: p1.id, systolic: 139, diastolic: 76, date: DateTime.new(2012,10,2,6))
BloodPressure.create!(patient_id: p1.id, systolic: 152, diastolic: 78, date: DateTime.new(2012,10,2,18))
BloodPressure.create!(patient_id: p1.id, systolic: 125, diastolic: 61, date: DateTime.new(2012,10,3,6))
BloodPressure.create!(patient_id: p1.id, systolic: 141, diastolic: 72, date: DateTime.new(2012,10,3,18))
BloodPressure.create!(patient_id: p1.id, systolic: 116, diastolic: 57, date: DateTime.new(2012,10,4,6))
BloodPressure.create!(patient_id: p1.id, systolic: 161, diastolic: 84, date: DateTime.new(2012,10,4,18))
BloodPressure.create!(patient_id: p1.id, systolic: 143, diastolic: 75, date: DateTime.new(2012,10,5,6))
BloodPressure.create!(patient_id: p1.id, systolic: 130, diastolic: 68, date: DateTime.new(2012,10,5,18))
BloodPressure.create!(patient_id: p1.id, systolic: 149, diastolic: 73, date: DateTime.new(2012,10,6,6))
BloodPressure.create!(patient_id: p1.id, systolic: 138, diastolic: 71, date: DateTime.new(2012,10,6,18))
BloodPressure.create!(patient_id: p1.id, systolic: 146, diastolic: 75, date: DateTime.new(2012,10,7,6))
BloodPressure.create!(patient_id: p1.id, systolic: 141, diastolic: 72, date: DateTime.new(2012,10,7,18))

# Patient 1 pulses
Pulse.create!(patient_id: p1.id, frequency: 76, date: DateTime.new(2012,10,25,15,10,0))
Pulse.create!(patient_id: p1.id, frequency: 81, date: DateTime.new(2012,10,25,15,10,5))
Pulse.create!(patient_id: p1.id, frequency: 87, date: DateTime.new(2012,10,25,15,10,10))
Pulse.create!(patient_id: p1.id, frequency: 96, date: DateTime.new(2012,10,25,15,10,15))
Pulse.create!(patient_id: p1.id, frequency: 101, date: DateTime.new(2012,10,25,15,10,20))
Pulse.create!(patient_id: p1.id, frequency: 106, date: DateTime.new(2012,10,25,15,10,25))
Pulse.create!(patient_id: p1.id, frequency: 113, date: DateTime.new(2012,10,25,15,10,30))
Pulse.create!(patient_id: p1.id, frequency: 118, date: DateTime.new(2012,10,25,15,10,35))
Pulse.create!(patient_id: p1.id, frequency: 124, date: DateTime.new(2012,10,25,15,10,40))
Pulse.create!(patient_id: p1.id, frequency: 129, date: DateTime.new(2012,10,25,15,10,45))
Pulse.create!(patient_id: p1.id, frequency: 135, date: DateTime.new(2012,10,25,15,10,50))
Pulse.create!(patient_id: p1.id, frequency: 139, date: DateTime.new(2012,10,25,15,10,55))
Pulse.create!(patient_id: p1.id, frequency: 141, date: DateTime.new(2012,10,25,15,11,0))
Pulse.create!(patient_id: p1.id, frequency: 143, date: DateTime.new(2012,10,25,15,11,5))
Pulse.create!(patient_id: p1.id, frequency: 143, date: DateTime.new(2012,10,25,15,11,10))
Pulse.create!(patient_id: p1.id, frequency: 145, date: DateTime.new(2012,10,25,15,11,15))
Pulse.create!(patient_id: p1.id, frequency: 147, date: DateTime.new(2012,10,25,15,11,20))
Pulse.create!(patient_id: p1.id, frequency: 149, date: DateTime.new(2012,10,25,15,11,25))
Pulse.create!(patient_id: p1.id, frequency: 152, date: DateTime.new(2012,10,25,15,11,30))
Pulse.create!(patient_id: p1.id, frequency: 152, date: DateTime.new(2012,10,25,15,11,35))
Pulse.create!(patient_id: p1.id, frequency: 154, date: DateTime.new(2012,10,25,15,11,40))
Pulse.create!(patient_id: p1.id, frequency: 157, date: DateTime.new(2012,10,25,15,11,45))
Pulse.create!(patient_id: p1.id, frequency: 160, date: DateTime.new(2012,10,25,15,11,50))
Pulse.create!(patient_id: p1.id, frequency: 161, date: DateTime.new(2012,10,25,15,11,55))
Pulse.create!(patient_id: p1.id, frequency: 161, date: DateTime.new(2012,10,25,15,12,0))
Pulse.create!(patient_id: p1.id, frequency: 158, date: DateTime.new(2012,10,25,15,12,5))
Pulse.create!(patient_id: p1.id, frequency: 156, date: DateTime.new(2012,10,25,15,12,10))
Pulse.create!(patient_id: p1.id, frequency: 155, date: DateTime.new(2012,10,25,15,12,15))
Pulse.create!(patient_id: p1.id, frequency: 157, date: DateTime.new(2012,10,25,15,12,20))
Pulse.create!(patient_id: p1.id, frequency: 158, date: DateTime.new(2012,10,25,15,12,25))
Pulse.create!(patient_id: p1.id, frequency: 157, date: DateTime.new(2012,10,25,15,12,30))

# Patient 1 weight
Weight.create!(patient_id: p1.id, value: 76.8, date: DateTime.new(2012,10,28,8))
Weight.create!(patient_id: p1.id, value: 77.0, date: DateTime.new(2012,10,29,8))
Weight.create!(patient_id: p1.id, value: 76.7, date: DateTime.new(2012,10,30,8))
Weight.create!(patient_id: p1.id, value: 76.5, date: DateTime.new(2012,10,31,8))
Weight.create!(patient_id: p1.id, value: 76.4, date: DateTime.new(2012,11,1,8))
Weight.create!(patient_id: p1.id, value: 76.7, date: DateTime.new(2012,11,2,8))
Weight.create!(patient_id: p1.id, value: 76.7, date: DateTime.new(2012,11,3,8))

# Site Configuration
SiteConfiguration.create!(name: "Default site config", geolocation_login: false)

# Proxy Configuration
ProxyConfiguration.create!(name: "Default proxy config", ad_linkup: true, ldap_linkup: true, location_services: true, logging:true)

# Broker Configuration
BrokerConfiguration.create!(name: "Default broker config")

# Services
Service.create!(name: "PAI", description_general: "Die Patienten-Arzneimittel-Interaktion (PAI) ermöglicht es, die Medikamente eines Patienten auf Konflikte mit Krankheiten oder anderen Medikamenten hin prüfen zu lassen.", description_technical: "", costs: 1500.0, owner_id: u7.id, server_location: "Europa")
Service.create!(name: "Verlaufsdokumentation", description_general: "Durch diesen Dienst werden Patientenakten um die Funktion erweitert, Verlaufswerte wie etwa Puls, Blutdruck oder Gewicht zu verwalten und grafisch anzuzeigen.", description_technical: "", costs: 450.0, owner_id: u7.id, server_location: "Deutschland")



