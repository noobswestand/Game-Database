/*10*/
DELETE FROM dlc WHERE DLCName LIKE "%a%";

/*9*/
SELECT users.UserID,users.FirstName from users
ORDER BY users.FirstName;

/*8*/
ALTER TABLE gamepictures RENAME TO pictures;

/*7*/
UPDATE tag SET tag.Name="Pluto" WHERE tag.Name="Mars";

/*6*/
ALTER TABLE dlc
RENAME COLUMN Name TO DLCName;

/*5*/
/*People with the most friends*/
SELECT users.UserID,users.FirstName,COUNT(friends.UserID) FROM users
LEFT JOIN friends ON users.UserID = friends.UserID
GROUP BY users.UserID
ORDER BY COUNT(friends.UserID) DESC
LIMIT 10;


/*4*/
/*Displays all games owned by a given UserID AND gets the "thumbnail" as well*/
SELECT DISTINCT games.GameID, games.Name, gamepictures.Picture, gamesowned.HoursPlayed FROM games
INNER JOIN gamesowned ON gamesowned.GameID = games.GameID
INNER JOIN users ON gamesowned.UserID = users.UserID
INNER JOIN gamepictures ON gamepictures.GameID = games.GameID
WHERE users.UserID=1
GROUP BY games.GameID
ORDER BY gamesowned.HoursPlayed DESC;

/*3*/
/*Displays how many friendships there are*/
SELECT COUNT(friends.UserID) as friendships FROM friends;

/*2*/
SELECT COUNT(users.FirstName) FROM users
WHERE users.FirstName LIKE "%a%";


/*1*/
INSERT INTO tag(TagID,Name) VALUES(null,"Flappy-Bird");
INSERT INTO tag(TagID,Name) VALUES(null,"Hack");
INSERT INTO tag(TagID,Name) VALUES(null,"Office");
INSERT INTO tag(TagID,Name) VALUES(null,"Drawing");
INSERT INTO tag(TagID,Name) VALUES(null,"Movie-spin off");
INSERT INTO users(UserID,FirstName,LastName,DateOfBirth,Gender,ProfilePicture,Salt,HashPass,RegDate) VALUES(null,"Friyivoa","Liodreestederkat",DATE '1961-1-10',"F","pictures/profile/3312.png","iFSFNIqijbjhNQnF0aQWmZ0GrCL90QKNGB2WExFgWjr0RkOIN5uK7wQAP5kOk3d8WZU2xFv4XntvlvM1jDznPPZjxz2safXBXIjeq2BndHxU1b0rC9KAaopJ9y0TruK2","4952602488da8b87e52655bc8ac4452f8e65001d", DATE '1999-10-3');
INSERT INTO users(UserID,FirstName,LastName,DateOfBirth,Gender,ProfilePicture,Salt,HashPass,RegDate) VALUES(null,"Achoosc","Jekreoboviral",DATE '1963-7-10',"M","pictures/profile/3313.png","qEuANK1OfQc67WM27vTSlrtaklYXQjHjz9h4lbbczcUpbdB4RhKa7aavPqGGY0RSStla7weOKajqfdQZLXWfg4pjF4wsUYrz5Cbxi5LCdbei1Cr75VRWTTWB5UPqJMfD","c65a9131bea5dcd61fb89b2d37f29318f022f846", DATE '1975-12-27');
INSERT INTO users(UserID,FirstName,LastName,DateOfBirth,Gender,ProfilePicture,Salt,HashPass,RegDate) VALUES(null,"Biurkabru","Bipirogaim",DATE '1960-12-10',"M","pictures/profile/3314.png","Dn6lplX2ZmYtD4TT61rABTMraCTKnotcEGS5B1P4eNGb0qvuOCiYVnaTXp1ceJ8HfGxaEJM9vlCwsVxSZKsvkaHTCOS3aigqNtnTTabo0F3L7ON0haBUVXQQbU6RPT5L","b316254b2e98026bf71c71204b0d48a1fab37437", DATE '1991-11-27');
INSERT INTO users(UserID,FirstName,LastName,DateOfBirth,Gender,ProfilePicture,Salt,HashPass,RegDate) VALUES(null,"Igadrulak","Didreato",DATE '1970-5-8',"F","pictures/profile/3315.png","2dvkEIGk5KSBhm6eED83F7DmgfcpwbZStvrf3jFYgueKTPreRJ1WdEDfLedhH1dXlw0z6icSNXyaA93bH7eCsbbdFZ0YRJbEiQD0TQmzvNLypVO0bBlz6BC1og58fYB9","c0da9f709bdf3223a90b12ad7f32d103eda87c6b", DATE '1988-12-22');
INSERT INTO users(UserID,FirstName,LastName,DateOfBirth,Gender,ProfilePicture,Salt,HashPass,RegDate) VALUES(null,"Plackebroastussifr","Llubaujube",DATE '2010-9-10',"M","pictures/profile/3316.png","aYrmZGsnCPMuJHi5lSqn83ZSOh8WQSgObF0cfEzFieDrwuPERza2Gw1EyEox8aeHX3n4UClnmrC8tkxT7u2MmzIHhgU0c4VgO8e5aqElB3VgpMsWUw6rv0aJJscqtibD","b6a46b1c5dff20b33801e0ed7523f46aed3c91aa", DATE '2011-10-11');
INSERT INTO friends(UserID,FriendID) VALUES(500,501);
INSERT INTO friends(UserID,FriendID) VALUES(500,502);
INSERT INTO friends(UserID,FriendID) VALUES(501,502);
INSERT INTO friends(UserID,FriendID) VALUES(501,504);
INSERT INTO friends(UserID,FriendID) VALUES(502,503);
INSERT INTO friends(UserID,FriendID) VALUES(502,504);
INSERT INTO friends(UserID,FriendID) VALUES(503,501);
INSERT INTO friends(UserID,FriendID) VALUES(503,504);
INSERT INTO games(GameID,Price,Name,Description,Rating,Publisher,Developer,ReleaseDate) VALUES(null,33.99,"Egau","Wafea Laphenk Oplit Awhidem Imeugr Iackeukr Konataoslounica Efe Omep Veothiocouram Ogabemisacro Gateflarankilafro Ohicux ","eC","Skububuweg","Dazagejae",DATE '1981-11-17');
INSERT INTO gametag(GameID,TagID) VALUES(500,244);
INSERT INTO gametag(GameID,TagID) VALUES(500,92);
INSERT INTO gametag(GameID,TagID) VALUES(500,241);
INSERT INTO games(GameID,Price,Name,Description,Rating,Publisher,Developer,ReleaseDate) VALUES(null,30.99,"Grobranycuwh","Apabocliowherkak Frahiyey Pufrabajiujuyiork Stroweo Jeograbruvach ","E10+","Laikostos","Laikostos",DATE '1986-5-6');
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,501,18.12,"Lawhofrotebiceonku","Lasougreyitotuj Mudao Iproikogrofri Soehujeco Hedaefoojokeciaci Acaamuskiusuph Atiwhoshe Brokifrachiaphebib Priscecrechaciulluy Afarech'coepr Phenia Sli Iirkoogu ");
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,501,16.85,"Uraozouv","Cobese Ecliacroowepoepiduh Oojucreskevo Oyod'geecloacoadao Astratri Uck ");
INSERT INTO gametag(GameID,TagID) VALUES(501,145);
INSERT INTO gametag(GameID,TagID) VALUES(501,137);
INSERT INTO gametag(GameID,TagID) VALUES(501,69);
INSERT INTO gametag(GameID,TagID) VALUES(501,291);
INSERT INTO games(GameID,Price,Name,Description,Rating,Publisher,Developer,ReleaseDate) VALUES(null,24.99,"Griibeocudrap","Siotifebrutosib Mabrytereokash Ageha Uroucogeautheuss Ugluklaupe Kr U Doekaedagojajosai Tha Illaivaejaflaaxeau Vesatraedr Iclioloil Gyt'scaipeuxel Flochaoto Xoiresamoiplow ","E10+","Soejopenkeorkepiabo","Soejopenkeorkepiabo",DATE '1989-9-6');
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,502,11.72,"Eatrodag","Oaprufaekroa Lii Oweglicroepraurkum Upoiquasloikroomoamo Slopu Bave Yikihano ");
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,502,14.66,"Ohoju","Laruh Ocroreauklisoof Udristragom Aslukomepliun Am Chopiw L Brorkar Paog Phu ");
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,502,3.22,"Iazefoaghyfro","Bakru Ojoaphacritiwha Udraedevipab Frahifritoo Shuwaerapraokrekru I Slethal La Cishi Odi Isriagaghodraughe Oeckebashuskewhaagr Renk ");
INSERT INTO gametag(GameID,TagID) VALUES(502,302);
INSERT INTO gametag(GameID,TagID) VALUES(502,208);
INSERT INTO gametag(GameID,TagID) VALUES(502,142);
INSERT INTO gametag(GameID,TagID) VALUES(502,230);
INSERT INTO gametag(GameID,TagID) VALUES(502,279);
INSERT INTO games(GameID,Price,Name,Description,Rating,Publisher,Developer,ReleaseDate) VALUES(null,18.99,"Coscicostetrubripu","Srist Froithiusketescalekl U Dico Enkuskoagrokriigroech Ike Tisropobrea Kriikrafoa Boerawoafo Ekakroze Ajoolleskuceu Ouj ","E","Iacliweskanisrukr","Kiagepleawa",DATE '2001-11-16');
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,503,3.29,"Eufekouti","Otrukreka Ple Phigroohoscivank Ereafeaunehogl Axucouscatu Wo Ymotidastupheupleol Roiji Apiali Driboa Idrosheafraubrequ Gukretresascac Woazeprulopoegi Ooroyeussounk'wh Iiwasseb ");
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,503,4.92,"Hepeskiph","Aceawia Biroskucroakr Eoy Edote Aiciyibro Illiskakikakl Draz Fopreasekloaf Uwhekafluphu ");
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,503,15.73,"Autukeapauleukoerag","Zekriugi Tr Idakr Eoceathotarerkusca Fia Omeokolabro Ikihepebroe Wughodiquezapl V Bemufossa Lliloa Jiarageebrarur Ghothiacke Isucludatufrebo ");
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,503,10.77,"Susitovayas","Sedofinkitraotaefle Uviu Bri Afemuklikooroerku Slotraloadiistroocl Aw Dri Epronun Lonascifoi Ithaedi Wheauscaaflioph Asryllogrosr Dikoe Aedoestresheohe Oniglogoigiobre ");
INSERT INTO gametag(GameID,TagID) VALUES(503,335);
INSERT INTO gametag(GameID,TagID) VALUES(503,249);
INSERT INTO gametag(GameID,TagID) VALUES(503,94);
INSERT INTO gametag(GameID,TagID) VALUES(503,165);
INSERT INTO games(GameID,Price,Name,Description,Rating,Publisher,Developer,ReleaseDate) VALUES(null,35.99,"Odotokrav","Ephu Az Pherk Wiwigawecruhoma Megewhareo Weauthuchusaokresaumi Aarolavasc Wiot'skusl Ae Arubenub Groximaickiimaxadoi Oowh Bretaekestreh Scipitihamaklewu Abrorodunkighuhek ","eC","Oxeusap","Oxeusap",DATE '1997-2-13');
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,504,28.39,"Oestroroas","Ecodafizialoo Gistrezokuga Ugriutifadoleller Aclufoxiflogapop Posceehiclostunaoni Ucapudraa Elefliseutoflugif Rebifruscaitauphoase O Cag Aitiij Omogrobirok Evouwikujesku Humessicr'fr ");
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,504,18.33,"Sralleowiwhob","Phob Ujeci Asoplu Saemoohivaekiopiabo Istricofr Axuscysrauwiajuva Pibrujujoepebic Loninkofakriashadr Abr'picupufeb Ocruc Krequoogisrekauh'v ");
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,504,2.08,"Gohichibresiito","Ehuhuyiifrohiachum Asuticehabot Sciijaligiulifrum Iwitrejuzalaw T Aaskephuclumi Chaitoeziashauxi Thikosallej Da Egrune Egregrawotopriacrefr Triidriibawugi Ibrack Slafaohor R'dola ");
INSERT INTO dlc(DLCID,GameID,Price,Name,Description) VALUES(null,504,12.76,"Crowoajiu","Iochoepotauc Amebrai Ludraaslufrerobr Ilewivobu Osh Auf'maplovapl ");
INSERT INTO gametag(GameID,TagID) VALUES(504,126);
INSERT INTO gametag(GameID,TagID) VALUES(504,116);
INSERT INTO gametag(GameID,TagID) VALUES(504,175);
INSERT INTO gametag(GameID,TagID) VALUES(504,101);
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,500,"pictures/game/3317.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,500,"pictures/game/3318.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,500,"pictures/game/3319.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,500,"pictures/game/3320.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,500,"pictures/game/3321.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,500,"pictures/game/3322.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,500,"pictures/game/3323.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,500,"pictures/game/3324.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,501,"pictures/game/3325.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,501,"pictures/game/3326.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,501,"pictures/game/3327.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,502,"pictures/game/3328.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,502,"pictures/game/3329.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,502,"pictures/game/3330.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,503,"pictures/game/3331.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,503,"pictures/game/3332.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,504,"pictures/game/3333.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,504,"pictures/game/3334.png");
INSERT INTO gamepictures(PictureID,GameID,Picture) VALUES(null,504,"pictures/game/3335.png");
INSERT INTO gamesowned(UserID,GameID,BoughtDate,Comments,HoursPlayed,Rating) VALUES(502,502,DATE '1984-7-18',null,768,null);
INSERT INTO gamesowned(UserID,GameID,BoughtDate,Comments,HoursPlayed,Rating) VALUES(501,501,DATE '1994-3-9',null,768,null);
INSERT INTO gamesowned(UserID,GameID,BoughtDate,Comments,HoursPlayed,Rating) VALUES(503,502,DATE '2005-7-13',null,768,null);
INSERT INTO gamesowned(UserID,GameID,BoughtDate,Comments,HoursPlayed,Rating) VALUES(503,504,DATE '2014-1-15',null,768,null);
INSERT INTO gamesowned(UserID,GameID,BoughtDate,Comments,HoursPlayed,Rating) VALUES(500,504,DATE '1990-9-29',null,768,null);
