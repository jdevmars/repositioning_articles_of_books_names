using System;

namespace CharacterManipulation {
	
	class Program {
		
		static void Main(string[] args){
			
			string[] pt = new string[8]{ ",o", ",os", ", o", ", os", ",a", ",as", ", a", ", as"};
			string[] es = new string[10]{ ",el", ", el", ",la", ", la", ",lo", ", lo", ",los", ", los", ",las", ", las"};
			string[] en = new string[4]{ ",the", ", the", ",an", ", an"};
			
			string[] rows = new string[44] {
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
				};

			// string[] articles = new string[22]{ ",o", ",os", ", o", ", os", ",a", ",as", ", a", ", as", ",el", ", el", ",la", ", la", ",lo", ", lo", ",los", ", los", ",las", ", las", ",the", ", the", ",an", ", an"};

			// string[] product_names = new string[rows.Length];
						
			for (int i = 0; i < rows.Length; i++) {
				
				// ,o || ,O
				if (!rows[i].Contains(",os") && !rows[i].Contains(",Os") && (rows[i].Contains(",o") || rows[i].Contains(",O"))) {
					string lastChars = rows[i].Substring(rows[i].Length -1);
					string remainingString = rows[i].Substring(0, rows[i].Length -2);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,a || ,A
				} else if (!rows[i].Contains(",as") && !rows[i].Contains(",As") && !rows[i].Contains(",an") && !rows[i].Contains(",An") && (rows[i].Contains(",a") || rows[i].Contains(",A"))) {
					string lastChars = rows[i].Substring(rows[i].Length -1);
					string remainingString = rows[i].Substring(0, rows[i].Length -2);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,os || ,Os
				} else if (rows[i].Contains(",os") || rows[i].Contains(",Os")) { 
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -3);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,as || ,As
				} else if (rows[i].Contains(",as") || rows[i].Contains(",As")) { 
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -3);
					Console.WriteLine(lastChars + " " + remainingString);
				// , o || , O
				} else if (!rows[i].Contains(", os") && !rows[i].Contains(", Os") && (rows[i].Contains(", o") || rows[i].Contains(", O"))) {
					string lastChars = rows[i].Substring(rows[i].Length -1);
					string remainingString = rows[i].Substring(0, rows[i].Length -3);
					Console.WriteLine(lastChars + " " + remainingString);
				// , a || , A
				} else if (!rows[i].Contains(", as") && !rows[i].Contains(", As") && !rows[i].Contains(", an") && !rows[i].Contains(", An") && (rows[i].Contains(", a") || rows[i].Contains(", A"))) {
					string lastChars = rows[i].Substring(rows[i].Length -1);
					string remainingString = rows[i].Substring(0, rows[i].Length -3);
					Console.WriteLine(lastChars + " " + remainingString);
				// , os || , Os
				} else if (rows[i].Contains(", os") || rows[i].Contains(", Os")) {
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -4);
					Console.WriteLine(lastChars + " " + remainingString);
				// , as || , As
				} else if (rows[i].Contains(", as") || rows[i].Contains(", As")) {
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -4);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,el || ,El
				} else if (rows[i].Contains(",el") || rows[i].Contains(",El")) {
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -3);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,la || ,La
				} else if (!rows[i].Contains(",las") && !rows[i].Contains(",Las") && (rows[i].Contains(",la") || rows[i].Contains(",La"))) {
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -3);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,los || ,Los
				} else if (rows[i].Contains(",los") || rows[i].Contains(",Los")) {
					string lastChars = rows[i].Substring(rows[i].Length -3);
					string remainingString = rows[i].Substring(0, rows[i].Length -4);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,las || ,Las
				} else if (rows[i].Contains(",las") || rows[i].Contains(",Las")) {
					string lastChars = rows[i].Substring(rows[i].Length -3);
					string remainingString = rows[i].Substring(0, rows[i].Length -4);
					Console.WriteLine(lastChars + " " + remainingString);
				// , el || , El
				} else if (rows[i].Contains(", el") || rows[i].Contains(", El")) {
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -4);
					Console.WriteLine(lastChars + " " + remainingString);
				// , la || , La
				} else if (!rows[i].Contains(", las") && !rows[i].Contains(", Las") && (rows[i].Contains(", la") || rows[i].Contains(", La"))) {
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -4);
					Console.WriteLine(lastChars + " " + remainingString);
				// , los || , Los
				} else if (rows[i].Contains(", los") || rows[i].Contains(", Los")) {
					string lastChars = rows[i].Substring(rows[i].Length -3);
					string remainingString = rows[i].Substring(0, rows[i].Length -5);
					Console.WriteLine(lastChars + " " + remainingString);
				// , las || , Las
				} else if (rows[i].Contains(", las") || rows[i].Contains(", Las")) {
					string lastChars = rows[i].Substring(rows[i].Length -3);
					string remainingString = rows[i].Substring(0, rows[i].Length -5);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,lo || ,Lo
				} else if (!rows[i].Contains(",los") && !rows[i].Contains(",Los") && (rows[i].Contains(",lo") || rows[i].Contains(",Lo"))) {
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -3);
					Console.WriteLine(lastChars + " " + remainingString);
				// --> ,los || ,Los
				} else if (rows[i].Contains(",los") || rows[i].Contains(",Los")) {
					string lastChars = rows[i].Substring(rows[i].Length -3);
					string remainingString = rows[i].Substring(0, rows[i].Length -4);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,the || ,The
				} else if (rows[i].Contains(",the") || rows[i].Contains(",The")) {
					string lastChars = rows[i].Substring(rows[i].Length -3);
					string remainingString = rows[i].Substring(0, rows[i].Length -4);
					Console.WriteLine(lastChars + " " + remainingString);
				// , the || , The
				} else if (rows[i].Contains(", the") || rows[i].Contains(", The")) {
					string lastChars = rows[i].Substring(rows[i].Length -3);
					string remainingString = rows[i].Substring(0, rows[i].Length -5);
					Console.WriteLine(lastChars + " " + remainingString);
				// ,an || ,An
				} else if (rows[i].Contains(",an") || rows[i].Contains(",An")) {
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -3);
					Console.WriteLine(lastChars + " " + remainingString);
				// , an || , An
				} else if (rows[i].Contains(", an") || rows[i].Contains(", An")) {
					string lastChars = rows[i].Substring(rows[i].Length -2);
					string remainingString = rows[i].Substring(0, rows[i].Length -4);
					Console.WriteLine(lastChars + " " + remainingString);
				}
			}
		}
	}
}