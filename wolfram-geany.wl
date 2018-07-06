"__________________________________________________________________
_____________________Create Documentation__________________________
____________________________________________________________________"



names=Names["System`*"][[102;;-2]]

homedir="!echo $HOME"//ReadLine

docdir=homedir<>"/.config/geany/plugins/wolfram/docs/"


CreateDirectory@docdir//Quiet

"\n\t "<>ToString@Length@names<>" documentation files.\n\t Saved:"//Print


($Urgent=OpenWrite[docdir<>#1, PageWidth->Infinity];
Information[#1, LongForm->False];
Close@$Urgent;
"printf '\r%s' "<>ToString@First@#2//Run;
)&~MapIndexed~names




"____________________________________________________________________
_____________________geany autocomplete configuration_________________
_____________________https://wiki.geany.org/howtos/custom_autocomplete
_______________________________________________________________________"


"\n\n\t configure Geany autocompletion:
\t see <https://wiki.geany.org/howtos/custom_autocomplete> "//Print




"____________STEP 1____________"

homedir<>"/.config/geany/tags"//CreateDirectory//Quiet

#<>"| | |"&/@names//
Riffle[#,"\n"]&//StringJoin//
Export[homedir<>"/.config/geany/tags/wl.wl.tags", #<>"\n","Text"]&//
"\n\t step 1 \n\t tags files saved in "<>#&//Print




"____________STEP 2____________"

extConFiles=StringSplit@ReadString@"!locate filetype_extensions.conf"~Select~Function@StringContainsQ[#,"geany"];
extConfUsr=extConFiles~Select~Function@Not@StringContainsQ[#,homedir]//First
extConfHome=homedir<>"/.config/geany/filetype_extensions.conf"

Export[extConfHome,
ReadString@extConfUsr~StringReplace~{
	"[Extensions]"->"[Extensions]\nwl=*.wl;*.wls;*.m;",
	"Misc=JSON;"->"Misc=JSON;wl;"},
"Text"]//
"\n\t step 2 \n\t file extensions saved in "<>#&//Print




"____________STEP 3____________"

StringSplit@ReadString@"!locate filetypes.css"~Select~Function@StringContainsQ[#,"geany"]~Select~Function@Not@StringContainsQ[#,homedir]//
ReadString@@#&//
StringReplace[#,{
"extension=css"->"extension=wl\ntag_parser=COBOL",
"mime_type=text/css"->"mime_type=text/plain\nlexer_filetype=COBOL\n",
"comment_open=/*"->"comment_open=(*",
"comment_close=*/"->"comment_close=*)",
"[keywords]"~~__~~"[settings]"->"[keywords]\n\n[settings]",
"comment_use_indent=true"->"comment_use_indent=false",
"context_action_cmd="->"context_action_cmd=zenity --text-info --filename="<>docdir<>"%s --title=\"Wolfram Language\" --no-wrap --width=800 --height=400"
}]&//
#<>"
[build-menu]
EX_00_LB=_Execute
EX_00_CM=wolframscript -f %f
EX_00_WD=\n"&//
Export[homedir<>"/.config/geany/filedefs/filetypes.wl.conf",#,"Text"]&//
"\n\t step 3 \n\t file types config saved in "<>#<>"\n"&//Print

 


(*__*)
