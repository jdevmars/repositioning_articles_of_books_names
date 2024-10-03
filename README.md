 Change of position of books names's articles from the end to the beginning of the string.

 The Vtex data tables of the client Unesp present nomes of books like this:

"objetivo é estudar,o",
"mal hábito dos brasileiros,O",
"abstração da realidade,a",
"casa de papel,A",
"poderes de Marcos,os",
"maus sempre perdem,Os",
"casas de madeira,as",
"vias aéreas,As",
"objetivo é aprender, o",
"mal hábito dos americanos, O",
"jaca da árvore, a",
"certeza do sucesso, A",
"tratores da fazenda, os",
"caso de dengue no Brasil, Os",
"lindas perobas flamejantes, as",
"maravilhas do universo, As",

"grandioso poder oculto,el",
"terror de la playa,El",
"entrega del mensaje,la",
"gran cantidad de propina,La",
"tiburones del mar,los",
"guardias del terreno,Los",
"antiguas casas del barrio,las",
"bellezas de la vida,Las",
"mágico de la tragédia, el",
"árbol de la carcel, El",
"iglesia fantástica, la",
"odiosa vecina, La",
"locos de la vecindad, los",
"bendecidos de la Tierra, Los",
"canciones inolvidables, las",
"últimas estrategias de marketing, Las",
"malo de ganar todo,lo",
"poderoso que puedes ser,Lo",
"bueno de salirse con la suya, lo",
"intenso que puede ser el amor, Lo",

"end!,the",
"next!,The",
"proper scenario for the film, the",
"hidden character, The",
"astrological trip,an",
"ecological week,An",
"idiot with roots, an",
"octopus lost in the sand, An"

The articles, in Portuguese, Spanish and English, are placed at the end of the book's name. I needed to change the position of these articles, placing at the beginning of the name instead.

Firstly, I created a C# console application to simulate how to work with it, with fictitious data. Once I had this algorithm implemented in C#, then I moved on to ExpertSender to work with the client's real data. 

SQL scripts fetch the data to HTML creatives, C# code organizes the books' names, then Dynamic Content present the information correctly, eventually.

It took me a while to prepare all this and consider all possible options to be amended, considering those 3 languages only.

The tests succeeded, the client started using my C#/SQL/DC code with their HTML, and success was achieved, with the C# code being possible to use anytime for new messages in the future.
