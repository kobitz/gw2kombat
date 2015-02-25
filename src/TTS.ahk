SplitPath, A_ScriptFullPath, , , , , drive
G_LangTransTo := -1
G_Lang := "en"
G_Cache := true
G_CacheDir := drive . "\GTTSData\"

G_Cache(cache){
	if(cache != true || cache != false){
		cache := true
	}
	G_Cache := cache
}

G_Language(lang){
	global
	G_Lang := lang
}
G_TranslateTo(lang){
	global
	G_LangTransTo := lang
}

G_Translate(query){
	global
    if(!FileExist(G_CacheDir)){
        FileCreateDir, %G_CacheDir%
    }
    langTo := G_LangTransTo
    langFrom := G_Lang
	if(!G_Cache){
		FileDelete, %G_CacheDir%f.txt
		UrlDownloadToFile, https://translate.google.com/translate_a/single?client=t&sl=%langFrom%&tl=%langTo%&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&ie=UTF-8&oe=UTF-8&otf=1&rom=1&ssel=0&tsel=0&tk=518976|541115&q=%query%, %G_CacheDir%f.txt
		FileRead, trans, %G_CacheDir%f.txt
	} else {
		dir := G_CacheDir . query . "\"
		if(!FileExist(dir)){
			FileCreateDir, %dir%
			UrlDownloadToFile, https://translate.google.com/translate_a/single?client=t&sl=%langFrom%&tl=%langTo%&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&ie=UTF-8&oe=UTF-8&otf=1&rom=1&ssel=0&tsel=0&tk=518976|541115&q=%query%, %dir%f.txt
		}
		FileRead, trans, %dir%f.txt
	}
	StringTrimLeft, trans, trans, 4
	StringGetPos, transend, trans, [`,`,`"
	transend += 4
	StringTrimLeft, trans, trans, %transend%
	StringGetPos, transend, trans, `"]
	StringLeft, realTrans, trans, %transend%
	return realTrans
}

G_TTS(query){
	global
	if(!FileExist(dataDir)){
		FileCreateDir, %G_CacheDir%
	}
	if(G_LangTransTo != -1){
		realQuery := G_Translate(query)
		lang := G_LangTransTo
	} else {
		realQuery := query
		lang := G_Lang
	}
	if(!G_Cache){
		FileDelete, %G_CacheDir%tts.mp3 ; gets rid of existing speech file
		UrlDownloadToFile, http://translate.google.com/translate_tts?tl=%lang%&q=%realQuery%, %G_CacheDir%tts.mp3
		Soundplay, %G_CacheDir%tts.mp3, Wait ; plays the downloaded speech file and waits for it to finish
	} else {
		dir := G_CacheDir . query . "\"
		if(!FileExist(dir)){
			FileCreateDir, %dir%
			UrlDownloadToFile, http://translate.google.com/translate_tts?tl=%lang%&q=%realQuery%, %dir%tts.mp3
		}
		Soundplay, %dir%tts.mp3, Wait ; plays the downloaded speech file and waits for it to finish
	}
}














/* "af Afrikaans", 
 * "sq Albanian", 
 * "am Amharic", 
 * "ar Arabic", 
 * "hy Armenian", 
 * "az Azerbaijani", 
 * "eu Basque", 
 * "be Belarusian", 
 * "bn Bengali", 
 * "bh Bihari", 
 * "bs Bosnian", 
 * "br Breton", 
 * "bg Bulgarian", 
 * "km Cambodian", 
 * "ca Catalan", 
 * "zh-CN Chinese (Simplified)", 
 * "zh-TW Chinese (Traditional)", 
 * "co Corsican", 
 * "hr Croatian", 
 * "cs Czech", 
 * "da Danish", 
 * "nl Dutch", 
 * "en English", 
 * "eo Esperanto", 
 * "et Estonian", 
 * "fo Faroese", 
 * "tl Filipino", 
 * "fi Finnish", 
 * "fr French", 
 * "fy Frisian", 
 * "gl Galician", 
 * "ka Georgian", 
 * "de German", 
 * "el Greek", 
 * "gn Guarani", 
 * "gu Gujarati", 
 * "xx-hacker Hacker", 
 * "ha Hausa", 
 * "iw Hebrew", 
 * "hi Hindi", 
 * "hu Hungarian", 
 * "is Icelandic", 
 * "id Indonesian", 
 * "ia Interlingua", 
 * "ga Irish", 
 * "it Italian", 
 * "ja Japanese", 
 * "jw Javanese", 
 * "kn Kannada", 
 * "kk Kazakh", 
 * "rw Kinyarwanda", 
 * "rn Kirundi", 
 * "xx-klingon Klingon", 
 * "ko Korean", 
 * "ku Kurdish", 
 * "ky Kyrgyz", 
 * "lo Laothian", 
 * "la Latin", 
 * "lv Latvian", 
 * "ln Lingala", 
 * "lt Lithuanian", 
 * "mk Macedonian", 
 * "mg Malagasy", 
 * "ms Malay", 
 * "ml Malayalam", 
 * "mt Maltese", 
 * "mi Maori", 
 * "mr Marathi", 
 * "mo Moldavian", 
 * "mn Mongolian", 
 * "sr-ME Montenegrin", 
 * "ne Nepali", 
 * "no Norwegian", 
 * "nn Norwegian (Nynorsk)", 
 * "oc Occitan", 
 * "or Oriya", 
 * "om Oromo", 
 * "ps Pashto", 
 * "fa Persian", 
 * "xx-pirate Pirate", 
 * "pl Polish", 
 * "pt-BR Portuguese (Brazil)", 
 * "pt-PT Portuguese (Portugal)", 
 * "pa Punjabi", 
 * "qu Quechua", 
 * "ro Romanian", 
 * "rm Romansh", 
 * "ru Russian", 
 * "gd Scots Gaelic", 
 * "sr Serbian", 
 * "sh Serbo-Croatian", 
 * "st Sesotho", 
 * "sn Shona", 
 * "sd Sindhi", 
 * "si Sinhalese", 
 * "sk Slovak", 
 * "sl Slovenian", 
 * "so Somali", 
 * "es Spanish", 
 * "su Sundanese", 
 * "sw Swahili", 
 * "sv Swedish", 
 * "tg Tajik", 
 * "ta Tamil", 
 * "tt Tatar", 
 * "te Telugu", 
 * "th Thai", 
 * "ti Tigrinya", 
 * "to Tonga", 
 * "tr Turkish", 
 * "tk Turkmen", 
 * "tw Twi", 
 * "ug Uighur", 
 * "uk Ukrainian", 
 * "ur Urdu", 
 * "uz Uzbek", 
 * "vi Vietnamese", 
 * "cy Welsh", 
 * "xh Xhosa", 
 * "yi Yiddish", 
 * "yo Yoruba", 
 * "zu Zulu"
 */
