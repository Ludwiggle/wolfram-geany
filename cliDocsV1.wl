(**********************************************************************
******************* Create Documentation *****************************
***********************************************************************)


names=Names["System`*"][[102;;-2]];

ans=Input@"do you want to create the documentation text files? (y/n)\n"


If[ans===y,

CreateDirectory@"cliDocs"//Quiet;

"\n\t "<>ToString@Length@names<>" documentation files to be saved.
\t Saved:"//Print;

(
$Urgent=OpenWrite[Directory[]<>"/cliDocs/"<>#1<>".txt", PageWidth->Infinity];
Information[#1, LongForm->False];
Close@$Urgent;
"printf '\r%s' "<>ToString@First@#2//Run;
)&~MapIndexed~names

,Print@"\n\t skip documentation\n\n\t . . . "]

(*********************************************************************
*************geany autocomplete configuration:************************
*************https://wiki.geany.org/howtos/custom_autocomplete *******
**********************************************************************)

"\n\n\t configure Geany autocompletion:
see <https://wiki.geany.org/howtos/custom_autocomplete> "//Print


(**** STEP 1 ****)

CreateDirectory@"~/.config/geany/tags"//Quiet

#<>"| | |"&/@names//
Riffle[#,"\n"]&//StringJoin//
Export["~/.config/geany/tags/wl.wl.tags", #<>"\n","Text"]&//
"\n\t step 1 \n\t tags files saved in "<>#&//Print


(**** STEP 2 ****)
extConFiles=StringSplit@ReadString@"!locate filetype_extensions.conf"~Select~Function@StringContainsQ[#,"geany"];
extConfUsr=extConFiles~Select~Function@Not@StringContainsQ[#,"home"]//First
extConfHome="~/.config/geany/filetype_extensions.conf"

Export[extConfHome,
ReadString@extConfUsr~StringReplace~{
	"[Extensions]"->"[Extensions]\nwl=*.wl;*.wls;*.m;",
	"Misc=JSON;"->"Misc=JSON;wl;"},
"Text"]//
"\n\t step 2 \n\t file extensions saved in "<>#&//Print


(**** STEP 3 ****)
StringSplit@ReadString@"!locate filetypes.css"~Select~Function@StringContainsQ[#,"geany"]~Select~Function@Not@StringContainsQ[#,"home"]//
ReadString@@#&//
StringReplace[#,{
"extension=css"->"extension=wl\ntag_parser=COBOL",
"mime_type=text/css"->"mime_type=text/plain",
"comment_open=/*"->"comment_open=(*",
"comment_close=*/"->"comment_close=*)"
}]&//
Export["~/.config/geany/filedefs/filetypes.wl.conf",#,"Text"]&//
"\n\t step 3 \n\t file types config saved in "<>#<>"\n"&//Print




(*__*)
