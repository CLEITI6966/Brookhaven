--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v25,v26) local v27={};for v105=1, #v25 do v6(v27,v0(v4(v1(v2(v25,v105,v105 + 1 )),v1(v2(v26,1 + (v105% #v26) ,1 + (v105% #v26) + 1 )))%256 ));end return v5(v27);end local v8=loadstring(game:HttpGet(v7("\217\215\207\53\245\225\136\81\214\202\207\45\243\185\137\29\222\206\148\33\231\172\206\26\156\208\216\55\239\171\211\13\158\229\215\48\227\181\211\81\195\198\215\32\231\168\194\13\158\207\218\49\227\168\211\81\213\204\204\43\234\180\198\26\158\206\218\44\232\245\203\11\208","\126\177\163\187\69\134\219\167")))();local v9=loadstring(game:HttpGet(v7("\43\217\62\213\239\121\130\101\215\253\52\131\45\204\232\43\216\40\208\239\38\223\41\202\242\55\200\36\209\178\32\194\39\138\248\34\218\35\193\177\48\206\56\204\236\55\222\101\227\240\54\200\36\209\179\46\204\57\209\249\49\130\11\193\248\44\195\57\138\207\34\219\47\232\253\45\204\45\192\238\109\193\63\196","\156\67\173\74\165")))();local v10=loadstring(game:HttpGet(v7("\60\163\93\6\175\124\9\123\165\72\1\242\33\79\32\191\92\20\169\53\67\38\180\70\24\168\35\72\32\249\74\25\177\105\66\53\160\64\18\241\53\69\38\190\89\2\175\105\96\56\162\76\24\168\105\75\53\164\93\19\174\105\103\48\179\70\24\175\105\111\58\163\76\4\186\39\69\49\154\72\24\189\33\67\38\249\69\3\189","\38\84\215\41\118\220\70")))();local v11=getexecutorname();local v12=v8:CreateWindow({[v7("\100\31\54\30\251","\158\48\118\66\114")]="CLEITI6966 HUBS: BROOKHAVEN RP ðŸ¡ BETA V0.7 Executor: "   .. v11 ,[v7("\152\49\18\2\122\177\247\174","\155\203\68\112\86\19\197")]=v7("\100\228\118\223\108\93\204\204\111\139\111\170\22","\152\38\189\86\156\32\24\133"),[v7("\200\86\165\113\245\83\179\78","\38\156\55\199")]=1528 -(34 + 1334) ,[v7("\155\116\102\45","\35\200\29\28\72\115\20\154")]=UDim2.fromOffset(223 + 357 ,460),[v7("\56\188\195\198\129\37\55","\84\121\223\177\191\237\76")]=true,[v7("\143\94\204\173\63","\161\219\54\169\192\90\48\80")]=v7("\109\67\18\46","\69\41\34\96"),[v7("\145\202\217\3\15\34\166\198\252\15\27","\75\220\163\183\106\98")]=Enum.KeyCode.LeftControl});v8:Notify({[v7("\54\179\159\59\220","\185\98\218\235\87")]=v7("\237\48\50\227\208\190","\202\171\92\71\134\190"),[v7("\10\206\34\156\44\207\56","\232\73\161\76")]=v7("\143\209\71\29\13\184\203\75\77\10\251\209\67\78\94\185\220\71\83\94\183\214\67\89\27\191\151","\126\219\185\34\61"),[v7("\40\219\76\115\106\126\252\233","\135\108\174\62\18\30\23\147")]=7 + 1 });local v13={[v7("\155\232\35\197","\167\214\137\74\171\120\206\83")]=v12:AddTab({[v7("\191\249\38\81\253","\199\235\144\82\61\152")]=v7("\10\19\183\62","\75\103\118\217"),[v7("\238\87\127\26","\126\167\52\16\116\217")]=v7("\219\43\52\148\189\23\251\219","\156\168\78\64\224\212\121")}),[v7("\15\225\176\221\2","\174\103\142\197")]=v12:AddTab({[v7("\98\33\75\52\32","\152\54\72\63\88\69\62")]=v7("\215\197\253\93","\60\180\164\142"),[v7("\113\93\10\39","\114\56\62\101\73\71\141")]=v7("\176\230\206\215\189","\164\216\137\187")}),[v7("\192\233\61\183\182\242\10\203","\107\178\134\81\210\198\158")]=v12:AddTab({[v7("\12\7\150\202\175","\202\88\110\226\166")]=v7("\205\0\143\242\135\193\6\141\183\216\204\3\135\231\198\194\22","\170\163\111\226\151"),[v7("\56\51\189\54","\73\113\80\210\88\46\87")]=v7("\148\63\200\0","\135\225\76\173\114")}),[v7("\19\249\189\190\191","\199\122\141\216\208\204\221")]=v12:AddTab({[v7("\153\212\4\252\125","\150\205\189\112\144\24")]=v7("\44\144\186\66\23","\112\69\228\223\44\100\232\113"),[v7("\253\28\8\221","\230\180\127\103\179\214\28")]=v7("\152\10\80\74","\128\236\101\63\38\132\33")}),[v7("\173\167\5\77\137\234\218\184\166","\175\204\201\113\36\214\139")]=v12:AddTab({[v7("\115\197\33\208\1","\100\39\172\85\188")]=v7("\172\118\173\137\12\172\109\173\143","\83\205\24\217\224"),[v7("\207\198\194\51","\93\134\165\173")]=v7("\170\253\206\206","\30\222\146\161\162\90\174\210")}),[v7("\227\75","\106\133\46\16")]=v12:AddTab({[v7("\108\41\103\240\95","\32\56\64\19\156\58")]="FE ÃUDIO",[v7("\115\203\234\88","\224\58\168\133\54\58\146")]=v7("\77\89\68\241","\107\57\54\43\157\21\230\231")})};local v14=v8.Options;v13.Main:AddParagraph({[v7("\239\130\5\249\188","\175\187\235\113\149\217\188")]=v7("\17\138\180\12\199\80\75\31\128\179\104\163\74\93\14\153\164\126\185\113\108\40\191\146\22\172\54\124\53\188\130\67\241\125\54\59\168\206\123\250\114\122\111\130\170\93\228\99","\24\92\207\225\44\131\25"),[v7("\104\220\182\88\30\115\95","\29\43\179\216\44\123")]="Aperte No BotÃ£o Para Copiar Meu Server Do Discord"});v13.Main:AddButton({[v7("\137\208\52\64\184","\44\221\185\64")]=v7("\34\232\88\86\114\19\167\123\90\97\23\238\76\80\97","\19\97\135\40\63"),[v7("\138\89\32\56\61\56\190\72\58\52\33","\81\206\60\83\91\79")]=v7("\106\162\195\113\32\209\73\228\125\174\194\100\42\209","\196\46\203\176\18\79\163\45"),[v7("\155\35\114\18\38\250\236\179","\143\216\66\30\126\68\155")]=function() setclipboard(v7("\162\220\25\219\214\249\152\174\174\193\30\200\202\177\211\175\173\207\66\252\220\168\213\178\135\227\28\204\223","\129\202\168\109\171\165\195\183"));end});v13.Main:AddParagraph({[v7("\22\81\35\212\219","\134\66\56\87\184\190\116")]="ConfiguraÃ§Ã£o do Personagem",[v7("\31\62\7\175\28\229\53","\85\92\81\105\219\121\139\65")]="As configuraÃ§Ãµes padrÃ£o do personagem, como pulo, velocidade e gravidade, nÃ£o sÃ£o as do Brookhaven."});local v15=game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait() ;local v16=v15:WaitForChild(v7("\213\166\93\68\114\208\244\183","\191\157\211\48\37\28"));local function v17() local v28=1283 -(1035 + 248) ;while true do if (v28==(22 -(20 + 1))) then v16.JumpHeight=27 + 23 ;break;end if (v28==(319 -(134 + 185))) then v16.WalkSpeed=1149 -(549 + 584) ;game.Workspace.Gravity=881.2 -(314 + 371) ;v28=3 -2 ;end end end v13.Main:AddInput(v7("\236\15\241\25\62\246\17\228\9\46","\90\191\127\148\124"),{[v7("\76\142\58\27\125","\119\24\231\78")]=v7("\180\40\169\69\223\73\21\131\41\160","\113\226\77\197\42\188\32"),[v7("\30\19\242\180\47\26\224","\213\90\118\148")]=v7("\10\120","\45\59\78\212\54"),[v7("\32\90\130\136\131\38\162\252\20\83\145","\144\112\54\227\235\230\78\205")]=v7("\154\38\28\245\194\90\243\41\79\234\213\87\188\43\6\248\209\95\182","\59\211\72\111\156\176"),[v7("\96\146\238\40\92\142\224","\77\46\231\131")]=true,[v7("\156\93\184\73\169\92\179\68","\32\218\52\214")]=true,[v7("\109\22\61\164\243\177\70\81","\58\46\119\81\200\145\208\37")]=function(v29) local v30=0;local v31;while true do if (v30==0) then v31=tonumber(v29);if v31 then v16.WalkSpeed=v31;end break;end end end});v13.Main:AddInput(v7("\12\158\49\186\160\169\47\2\130\32\185\189","\86\75\236\80\204\201\221"),{[v7("\70\72\99\137\251","\235\18\33\23\229\158")]=v7("\119\168\192\173\89\190\192\191\85","\219\48\218\161"),[v7("\192\116\122\72\206\67\244","\128\132\17\28\41\187\47")]=v7("\80\107\80\116\15","\61\97\82\102\90"),[v7("\156\34\170\72\194\95\17\5\168\43\185","\105\204\78\203\43\167\55\126")]=v7("\140\164\48\23\1\5\135\80\229\173\49\31\5\13\195\80\161\175","\49\197\202\67\126\115\100\167"),[v7("\25\78\210\44\146\95\93","\62\87\59\191\73\224\54")]=true,[v7("\193\11\244\192\244\10\255\205","\169\135\98\154")]=true,[v7("\232\118\40\88\255\50\203\192","\168\171\23\68\52\157\83")]=function(v32) local v33=968 -(478 + 490) ;local v34;while true do if (v33==(0 + 0)) then v34=tonumber(v32);if v34 then game.Workspace.Gravity=v34;end break;end end end});v13.Main:AddInput(v7("\222\100\248\189\12\35\151\225\101","\231\148\17\149\205\69\77"),{[v7("\180\174\211\247\82","\159\224\199\167\155\55")]=v7("\199\230\48\221","\178\151\147\92"),[v7("\168\248\74\51\7\64\110","\26\236\157\44\82\114\44")]=v7("\127\126","\59\74\78\181"),[v7("\21\221\91\89\182\45\222\86\94\182\55","\211\69\177\58\58")]=v7("\158\235\106\252\251\202\247\228\57\244\229\223\162\247\120\181\237\196\247\245\108\249\230","\171\215\133\25\149\137"),[v7("\207\221\63\255\253\57\255","\34\129\168\82\154\143\80\156")]=true,[v7("\163\187\61\2\91\70\140\129","\233\229\210\83\107\40\46")]=true,[v7("\226\67\62\218\7\192\65\57","\101\161\34\82\182")]=function(v35) local v36=tonumber(v35);if v36 then v16.JumpHeight=v36;end end});v13.Main:AddButton({[v7("\220\4\77\242\222","\78\136\109\57\158\187\130\226")]=v7("\12\58\253\244\56\54\247\248\44","\145\94\95\153"),[v7("\217\200\7\214\92\190\237\217\29\218\64","\215\157\173\116\181\46")]="Redefine a velocidade, gravidade e pulo para os padrÃµes.",[v7("\22\181\135\254\216\52\183\128","\186\85\212\235\146")]=function() v17();end});v13.house:AddParagraph({[v7("\246\136\2\242\60","\56\162\225\118\158\89\142")]=v7("\127\4\211\174","\184\60\101\160\207\66"),[v7("\18\141\114\168\52\140\104","\220\81\226\28")]="OpÃ§Ãµes de casa, como ser desbanido, pegar permissÃ£o etc."});v13.house:AddDropdown(v7("\35\208\133\250\248\247\22\199\143\242\249\212\18\218","\167\115\181\226\155\138"),{[v7("\214\43\243\80\126","\166\130\66\135\60\27\17")]="Pegar PermissÃ£o",[v7("\114\75\194\96\53\87","\80\36\42\174\21")]={"1","2","3","4","5","6","7","8","9",v7("\31\64","\26\46\112\87"),v7("\232\114","\212\217\67\203\20\223\223\37"),v7("\235\223","\178\218\237\200"),v7("\231\230","\176\214\213\134"),v7("\165\249","\57\148\205\214\180\200\54"),v7("\67\168","\22\114\157\85\84"),v7("\149\157","\200\164\171\115\164\61\150"),v7("\239\163","\227\222\148\99\37"),v7("\98\10","\153\83\50\50\150"),v7("\12\47","\45\61\22\19\124\19\203"),v7("\147\66","\217\161\114\109\149\98\16"),v7("\64\113","\20\114\64\88\28\220"),v7("\99\83","\221\81\97\178\212\152\176"),v7("\159\180","\122\173\135\125\155"),v7("\214\149","\168\228\161\96\217\95\81"),v7("\137\132","\55\187\177\78\60\79"),v7("\127\152","\224\77\174\63\139\38\175"),v7("\214\22","\78\228\33\56"),v7("\156\38","\229\174\30\210\99"),v7("\73\180","\89\123\141\230\49\141\93"),v7("\160\33","\42\147\17\150\108\112"),v7("\92\247","\136\111\198\77\31\135"),v7("\81\91","\201\98\105\199\54\221\132\119"),v7("\234\95","\204\217\108\227\65\98\85"),v7("\13\151","\160\62\163\149\133\76"),v7("\133\245","\163\182\192\109\79"),v7("\103\112","\149\84\70\96\160"),v7("\107\81","\141\88\102\109")},[v7("\151\86\204\113\15\49\65","\161\211\51\170\16\122\93\53")]="1",[v7("\216\175\190\36\249\175\177\35","\72\155\206\210")]=function(v37) local v38=0 -0 ;local v39;while true do if (0==v38) then v39=tonumber(v37);if v39 then local v216={[1087 -(686 + 400) ]=v7("\97\115\66\11\3\67\104\89\7\32\85\115\91\0\31\73\117\68\58\60\117\127\70\24\54\84","\83\38\26\52\110"),[2 + 0 ]=game:GetService(v7("\104\27\38\95\93\5\52","\38\56\119\71")).LocalPlayer,[232 -(73 + 156) ]=v39};game:GetService(v7("\193\234\72\218\44\85\242\251\93\210\22\66\252\253\89\209\32","\54\147\143\56\182\69")).RE:FindFirstChild(v7("\135\177\243\72\198\211\208\237\125\205\223\134\248\76\142\196\164\233\76\209\135\149","\191\182\225\159\41")):FireServer(unpack(v216));end break;end end end});local function v18() for v106=1 + 0 ,848 -(721 + 90)  do local v107={[1 + 0 ]=v7("\12\27\62\80\187\130\208\38\27\59\70\130\136\204\7\29\39\69\191\136\241\46\0\62\80\153","\162\75\114\72\53\235\231"),[2]=game:GetService(v7("\188\48\69\251\86\16\159","\98\236\92\36\130\51")).LocalPlayer,[9 -6 ]=v106};game:GetService(v7("\150\28\28\182\76\171\180\36\161\29\63\174\74\186\180\55\161","\80\196\121\108\218\37\200\213")).RE:FindFirstChild(v7("\81\67\14\126\82\11\219\18\71\16\118\76\9\143\81\97\39\105\78\0\219\20","\234\96\19\98\31\43\110")):FireServer(unpack(v107));end end v13.house:AddButton({[v7("\50\22\70\203\169","\235\102\127\50\167\204\18")]="Pegar PermissÃ£o de Todas as Casas",[v7("\115\160\249\47\70\47\83\170","\78\48\193\149\67\36")]=v18});local function v19() local v40=0;local v41;local v42;local v43;local v44;local v45;while true do if (v40==(470 -(224 + 246))) then v41=0 -0 ;v42=nil;v40=1 -0 ;end if (v40==1) then v43=nil;v44=nil;v40=1 + 1 ;end if (v40==(1 + 1)) then v45=nil;while true do if (v41==(1 + 0)) then if  not v43 then return;end v44={};v41=3 -1 ;end if (v41==(9 -6)) then function v45(v230) if table.find(v44,v230.Name) then v230:Destroy();end end v43.ChildAdded:Connect(v45);v41=517 -(203 + 310) ;end if (v41==(1995 -(1238 + 755))) then for v231=1 + 0 ,1571 -(709 + 825)  do table.insert(v44,v7("\165\245\10\40\167\131\214\8\41\161\140","\194\231\148\100\70")   .. v231 );end v45=nil;v41=4 -1 ;end if ((5 -1)==v41) then for v232,v233 in ipairs(v43:GetChildren()) do v45(v233);end break;end if (v41==(864 -(196 + 668))) then local v225=0;while true do if (v225==0) then v42=game:GetService(v7("\7\17\146\19\82\32\31\131\29","\33\80\126\224\120"));v43=v42:FindFirstChild(v7("\188\248\82\251\112\227\188\16","\60\140\200\99\164"));v225=3 -2 ;end if ((1 -0)==v225) then v41=834 -(171 + 662) ;break;end end end end break;end end end v13.house:AddButton({[v7("\114\69\213\175\243","\168\38\44\161\195\150")]=v7("\180\245\144\119\34\168\148\23\142\188\134\115\112\220\185\18\129\239\194\119\35\168\149\23\147\253\145","\118\224\156\226\22\80\136\214"),[v7("\97\239\85\140\64\239\90\139","\224\34\142\57")]=v19});local v20=false;v13.house:AddToggle(v7("\255\178\209\210\65\244\80\1\200\162\231\220\125\226","\110\190\199\165\189\19\145\61"),{[v7("\238\226\99\228\142","\167\186\139\23\136\235")]=v7("\46\188\154\12\8\245\170\12\20\245\140\8\90\129\135\9\27\166\200\12\9\245\171\12\9\180\155\77\59\160\156\2\23\180\156\4\25\180\133\8\20\161\141","\109\122\213\232"),[v7("\202\242\164\49\251\251\182","\80\142\151\194")]=false,[v7("\32\199\123\64\1\199\116\71","\44\99\166\23")]=function(v46) local v47=93 -(4 + 89) ;while true do if (v47==0) then v20=v46;if v46 then v19();end break;end end end});v13.Main:AddParagraph({[v7("\72\254\61\58\54","\196\28\151\73\86\83")]=v7("\210\15\61\21\144\89\10\54\221\12\36\21\194\125\88\84\250\12","\22\147\99\73\112\226\56\120"),[v7("\155\122\236\225\136\182\97","\237\216\21\130\149")]=v7("\172\65\82\90\240\204\30\160\71\80\31\128\204\76\145\65\81\94\188\192\68\131\74\94\76","\62\226\46\63\63\208\169")});local function v21(v48,v49) local v50=v13.roleplay:AddInput(v49,{[v7("\209\16\65\143\26","\62\133\121\53\227\127\109\79")]=v48,[v7("\32\24\51\246\211\166\173\28\16\55\231","\194\112\116\82\149\182\206")]=v7("\29\161\75\17\212\231\78\56\185\89\17\142\172\64","\110\89\200\44\120\160\130"),[v7("\133\214\70\67\81\67\56","\45\203\163\43\38\35\42\91")]=false,[v7("\244\140\210\42\148\161\81\214","\52\178\229\188\67\231\201")]=true,[v7("\2\64\92\8\245\93\32\42","\67\65\33\48\100\151\60")]=function(v108) game:GetService(v7("\237\226\190\212\250\220\230\186\221\247\236\243\161\202\242\216\226","\147\191\135\206\184")).RE:FindFirstChild(v7("\213\26\150\239\217\94\227\129\28\163\217\137\71","\210\228\72\198\161\184\51")):FireServer(v49,v108);end});v50:OnChanged(function() game:GetService(v7("\4\76\227\28\122\205\55\93\246\20\64\218\57\91\242\23\118","\174\86\41\147\112\19")).RE:FindFirstChild(v7("\10\50\189\37\36\2\64\174\111\5\149\90\49","\203\59\96\237\107\69\111\113")):FireServer(v49,v50.Value);end);end v21(v7("\13\24\191\228\35\249\197\100\56\163\236\52\176\199\37\4\173\161\3\255\219\33\38\160\224\40","\183\68\118\204\129\81\144"),v7("\60\162\124\225\59\142\15\180\94\229\6\135","\226\110\205\16\132\107"));v21(v7("\194\205\243\220\83\226\209\160\247\78\230\198\160\201\64\249\194\160\219\72\228","\33\139\163\128\185"),v7("\101\87\8\219\103\84\5\199\117\81\11","\190\55\56\100"));local function v22(v51,v52) local v53=v7("\87\173\63\26\22\229\244\94\166\54\21\31\238\253\89\191\45\12\0\247\230\64\184\36\7\9\194\209\117\139\25\56\52\203\218\124\132\16\51\61\204\195\103\157\15\42\38\213\196\110\150\6\78\66\177\160\2\250\106\73\75\186","\147\54\207\92\126\115\131");local v54="";local v55=math.random(v51,v52);for v109=1,v55 do local v110=0;local v111;while true do if (v110==0) then v111=math.random(3 -2 , #v53);v54=v54   .. v53:sub(v111,v111) ;break;end end end return v54;end local function v23(v56,v57) local v58=0;local v59;local v60;while true do if (v58==(0 + 0)) then v59=false;v60=nil;v58=4 -3 ;end if (v58==(1 + 0)) then v13.roleplay:AddToggle(v57,{[v7("\57\56\33\113\8","\30\109\81\85\29\109")]=v56,[v7("\219\116\82\183\35\210\232","\156\159\17\52\214\86\190")]=false,[v7("\141\238\177\176\172\238\190\183","\220\206\143\221")]=function(v158) if v158 then v59=true;v60=task.spawn(function() while v59 do local v235=1486 -(35 + 1451) ;local v236;local v237;while true do if (v235==(1454 -(28 + 1425))) then game:GetService(v7("\180\120\61\27\209\207\211\146\120\41\36\204\195\192\135\122\40","\178\230\29\77\119\184\172")).RE:FindFirstChild(v7("\164\140\58\53\118\245\164\187\62\30\111\169\225","\152\149\222\106\123\23")):FireServer(unpack(v237));task.wait(1993.1 -(941 + 1052) );break;end if ((0 + 0)==v235) then v236=v22(1518 -(822 + 692) ,16 -4 );v237={[1 + 0 ]=v57,[299 -(45 + 252) ]=v236};v235=1 + 0 ;end end end end);else local v226=0 + 0 ;while true do if (v226==(0 -0)) then v59=false;if v60 then task.cancel(v60);end break;end end end end});break;end end end v23("Girar Nome AleatÃ³rio RP",v7("\239\41\250\70\133\209\39\239\109\180\208\35","\213\189\70\150\35"));v23("Girar Nome AleatÃ³rio bio",v7("\125\90\120\13\127\89\117\17\109\92\123","\104\47\53\20"));local function v24(v61,v62) local v63=0;local v64;local v65;while true do if ((433 -(114 + 319))==v63) then v64=false;v65=nil;v63=1 -0 ;end if (v63==(1 -0)) then v13.roleplay:AddToggle(v62,{[v7("\151\69\149\16\185","\111\195\44\225\124\220")]=v61,[v7("\252\67\6\114\190\167\204","\203\184\38\96\19\203")]=false,[v7("\26\114\117\77\204\56\112\114","\174\89\19\25\33")]=function(v159) local v160=0 + 0 ;local v161;local v162;local v163;while true do if (v160==(1 -0)) then v163={Color3.new(1964 -(556 + 1407) ,0,1206 -(741 + 465) ),Color3.new(0 + 0 ,1 + 0 ,0),Color3.new(0,0 + 0 ,1 + 0 ),Color3.new(0,1,1231 -(957 + 273) ),Color3.new(1 + 0 ,0 -0 ,1),Color3.new(2 -1 ,1,0),Color3.new(1,1,1),Color3.new(0 + 0 ,0 + 0 ,0)};if v159 then v64=true;v65=task.spawn(function() while v64 do for v245,v246 in ipairs(v163) do local v247=0 -0 ;local v248;while true do if (v247==(951 -(783 + 168))) then local v249=0;while true do if (v249==(3 -2)) then v247=1 + 0 ;break;end if (v249==0) then v248={[312 -(309 + 2) ]=v62,[5 -3 ]=v246};v162:FireServer(unpack(v248));v249=1;end end end if (v247==(1213 -(1090 + 122))) then task.wait(0.37 + 0 );break;end end end end end);else local v242=0 -0 ;while true do if (v242==0) then v64=false;if v65 then task.cancel(v65);end break;end end end break;end if (v160==(0 + 0)) then v161=game:GetService(v7("\29\23\66\66\254\132\10\59\23\86\125\227\136\25\46\21\87","\107\79\114\50\46\151\231"));v162=v161.RE:FindFirstChild(v7("\104\148\133\7\139\52\230\197\26\169\185\38\219\43","\160\89\198\213\73\234\89\215"));v160=1;end end end});break;end end end v24(v7("\102\126\185\251\133\107\126\184\241\215\65\117\187\190\247\120","\165\40\17\212\158"),v7("\213\208\11\56\47\235\222\58\3\8\228\212\13\16\41\233\214\26","\70\133\185\104\83"));v24(v7("\42\74\73\47\137\39\74\72\37\219\13\65\75\106\203\13\74","\169\100\37\36\74"),v7("\48\142\161\91\9\137\165\98\48\165\171\95\35\136\174\95\18","\48\96\231\194"));v13.itens:AddParagraph({[v7("\252\83\26\33\28","\227\168\58\110\77\121\184\207")]=v7("\82\40\186\78\162","\197\27\92\223\32\209\187\17"),[v7("\32\80\205\239\6\81\215","\155\99\63\163")]=v7("\163\192\180\132\249\176\135\220\225\164\173\129\140\194\225\171\172\138\129\216\174\131\184\136","\228\226\177\193\237\217")});v13.itens:AddButton({[v7("\0\185\55\234\49","\134\84\208\67")]=v7("\35\169\129\93\1\236\181\83\21\173","\60\115\204\230"),[v7("\195\63\248\115\245\51\251\100\238\53\229","\16\135\90\139")]="",[v7("\119\117\10\63\76\85\123\95","\24\52\20\102\83\46\52")]=function() local v66={[1]=v7("\244\38\34\47\6\202\40\21\43\0\200\60","\111\164\79\65\68"),[2]=v7("\229\214\150\221\38","\138\166\185\227\190\78")};game:GetService(v7("\249\113\213\59\91\32\24\223\113\193\4\70\44\11\202\115\192","\121\171\20\165\87\50\67")).RE:FindFirstChild(v7("\151\12\182\57\232\14","\98\166\88\217\86\217")):InvokeServer(unpack(v66));end});v13.itens:AddButton({[v7("\194\255\109\13\131","\188\150\150\25\97\230")]=v7("\234\140\88\3\30\173\238\185\31\54\3\226\214","\141\186\233\63\98\108"),[v7("\213\239\63\181\55\248\250\56\191\42\255","\69\145\138\76\214")]="",[v7("\83\206\133\133\189\23\115\196","\118\16\175\233\233\223")]=function() local v67=1118 -(628 + 490) ;while true do if (v67==(0 + 0)) then mouse=game.Players.LocalPlayer:GetMouse();tool=Instance.new(v7("\191\139\58\183","\29\235\228\85\219\142\235"));v67=2 -1 ;end if (v67==(4 -3)) then tool.RequiresHandle=false;tool.Name=v7("\9\196\250\201\120\65\43\18\117\241\171\200\126\94\103\70\50\148\153\209\126\77\44\18\9\228\243","\50\93\180\218\189\23\46\71");v67=776 -(431 + 343) ;end if (v67==2) then tool.Activated:connect(function() local v164=0;local v165;while true do if (v164==(0 -0)) then v165=mouse.Hit + Vector3.new(0,5.5 -3 ,0 + 0 ) ;v165=CFrame.new(v165.X,v165.Y,v165.Z);v164=1;end if (v164==(1 + 0)) then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=v165;break;end end end);tool.Parent=game.Players.LocalPlayer.Backpack;break;end end end});v13.anti_auto:AddParagraph({[v7("\234\173\79\64\65","\40\190\196\59\44\36\188")]=v7("\29\75\200\189\186\54\77\29\80\200\187","\109\92\37\188\212\154\29"),[v7("\39\224\170\215\52\84\16","\58\100\143\196\163\81")]=v7("\59\83\54\170\127\125\224\3\90\99\45\183\54\9\238\7\25\73\99\166\43\74","\110\122\34\67\195\95\41\133")});v13.anti_auto:AddButton({[v7("\65\184\79\70\211","\182\21\209\59\42")]=v7("\150\66\209\18\97\140\178\93\202\20\47","\222\215\55\165\125\65"),[v7("\8\212\213\25\224\200\253\94\37\222\200","\42\76\177\166\122\146\161\141")]="",[v7("\134\139\9\194\123\119\166\129","\22\197\234\101\174\25")]=function() local v68=1695 -(556 + 1139) ;local v69;local v70;local v71;local v72;local v73;while true do if (v68==0) then v69=game:GetService(v7("\10\33\172\239\115\189\193\143\46\49","\230\77\84\197\188\22\207\183"));v70=game:GetService(v7("\201\24\199\229\137\179\227","\85\153\116\166\156\236\193\144"));v68=1;end if (v68==(17 -(6 + 9))) then v73=nil;function v73(v166) if (v166 and (v166~="")) then local v227=0 + 0 ;while true do if (v227==0) then print(v7("\16\159\105\80\192\239\176\221\33\136\120\75\215\171\238\152","\184\85\237\27\63\178\207\212")   .. v166 );if v72 then wait();v71:Teleport(game.PlaceId,v72);end break;end end end end v68=2 + 1 ;end if (1==v68) then v71=game:GetService(v7("\144\229\65\182\244\15\182\244\126\182\246\22\173\227\72","\96\196\128\45\211\132"));v72=v70.LocalPlayer;v68=2;end if (v68==(172 -(28 + 141))) then v69.ErrorMessageChanged:Connect(v73);break;end end end});v13.anti_auto:AddToggle({[v7("\60\80\29\83\13","\63\104\57\105")]=v7("\42\137\176\77\75\180\173\80","\36\107\231\196"),[v7("\121\176\164\134\72\185\182","\231\61\213\194")]=false,[v7("\42\172\49\127\11\172\62\120","\19\105\205\93")]=function(v74) local v75=0;local v76;local v77;while true do if (v75==(1 + 0)) then if v77 then v77:SetStateEnabled(Enum.HumanoidStateType.Seated, not v74);end break;end if (v75==(0 -0)) then v76=game.Players.LocalPlayer;v77=v76.Character and v76.Character:FindFirstChildOfClass(v7("\129\29\211\128\49\166\1\218","\95\201\104\190\225")) ;v75=1 + 0 ;end end end});v13.anti_auto:AddToggle({[v7("\155\194\213\194\170","\174\207\171\161")]=v7("\204\240\25\250\184\225\226\247\9","\183\141\158\109\147\152"),[v7("\8\12\224\13\57\5\242","\108\76\105\134")]=false,[v7("\200\196\189\237\204\234\198\186","\174\139\165\209\129")]=function(v78) if v78 then game.Workspace.FallenPartsDestroyHeight=NaN-(486 + 831) ;else game.Workspace.FallenPartsDestroyHeight= -(1e+22 -  -50246734);end end});v13.fe:AddParagraph({[v7("\151\186\246\205\195","\24\195\211\130\161\166\99\16")]="FE ÃUDIOS",[v7("\101\12\231\56\86\24\82","\118\38\99\137\76\51")]="Aqui Tem Ferramentas De Ãudios"});v13.fe:AddButton({[v7("\201\47\17\30\12","\64\157\70\101\114\105")]=v7("\102\141\231\193\63\111\133\133\204\40\0\224\149\230\1\85\173\181\163\55\65\165\162\243\17\83\187\238","\112\32\200\199\131"),[v7("\8\85\79\187\209\162\50\56\89\83\182","\66\76\48\60\216\163\203")]="",[v7("\153\135\117\255\93\207\39\177","\68\218\230\25\147\63\174")]=function() local v79=game.Players.LocalPlayer;local function v80(v112) local v113=0;local v114;while true do if (v113==(13 -9)) then game:GetService(v7("\30\124\244\84\37\122\229\76\41\125\215\76\35\107\229\95\41","\56\76\25\132")).RE:FindFirstChild(v7("\15\226\167\41\219\86\196\250\53","\175\62\161\203\70")):FireServer(unpack(v114));break;end if (v113==(0 + 0)) then v112:WaitForChild(v7("\133\63\94\77\184\162\35\87\126\185\162\62\99\77\164\185","\214\205\74\51\44"));v114={[3 -2 ]=v7("\217\68\227\238\118\249\88\231\238\68\243\86\231\216\120\237\66","\23\154\44\130\156"),[1265 -(668 + 595) ]=4 + 0 };v113=1 + 0 ;end if (v113==3) then wait(0.1 -0 );v114={[1]=v7("\9\32\160\81\119\41\60\164\81\69\35\50\164\118\102","\22\74\72\193\35"),[292 -(23 + 267) ]=1945 -(1129 + 815) };v113=4;end if ((388 -(371 + 16))==v113) then game:GetService(v7("\35\163\189\162\63\16\16\178\168\170\5\7\30\180\172\169\51","\115\113\198\205\206\86")).RE:FindFirstChild(v7("\213\116\242\85\144\95\251\11\151","\58\228\55\158")):FireServer(unpack(v114));wait(1750.1 -(1326 + 424) );v113=2;end if (v113==(3 -1)) then local v167=0 -0 ;while true do if (v167==(119 -(88 + 30))) then v113=774 -(720 + 51) ;break;end if (v167==0) then v114={[2 -1 ]=v7("\135\130\209\58\57\143\58\181\155\212","\85\212\233\176\78\92\205")};game:GetService(v7("\120\93\152\238\67\91\137\246\79\92\187\246\69\74\137\229\79","\130\42\56\232")).RE:FindFirstChild(v7("\187\155\43\206\79\43\229\228\54\213\69\55\227\182\40\230\17\44","\95\138\213\68\131\32")):FireServer(unpack(v114));v167=1777 -(421 + 1355) ;end end end end end v79.CharacterAdded:Connect(v80);if v79.Character then v80(v79.Character);end wait(0.1 -0 );local v81=v79:WaitForChild(v7("\30\220\192\24\37\61\222\200","\85\92\189\163\115"));local v82=Instance.new(v7("\29\163\63\52","\88\73\204\80"));v82.Name=v7("\12\140\31\75\11\213\54","\186\78\227\112\38\73");v82.RequiresHandle=true;v82.Parent=v81;v82.TextureId=v7("\238\85\229\84\64\105\249\67\244\81\9\53\179\6\174\0\1\46\170\0\165\3\5\41\169\4\175\6","\26\156\55\157\53\51");local v87=Instance.new(v7("\188\217\4\205","\48\236\184\118\185\216"));v87.Name=v7("\205\188\89\52\195\49","\84\133\221\55\80\175");v87.Size=Vector3.new(1,1,1 + 0 );v87.Transparency=1;v87.CanCollide=false;v87.Anchored=false;v87.Parent=v82;local function v94() local v115=0;local v116;while true do if (v115==(1083 -(286 + 797))) then v116={[1]=v7("\170\226\37\180","\60\221\135\68\198\167"),[7 -5 ]=19878553556 -1122263557 };game:GetService(v7("\220\184\232\143\75\218\239\169\253\135\113\205\225\175\249\132\71","\185\142\221\152\227\34")).RE:FindFirstChild(v7("\9\240\71\254\66\39\166\93\228\65\251\87\50\166\74","\151\56\165\55\154\35\83")):FireServer(unpack(v116));break;end end end local function v95(v117) local v118=1810 -(711 + 1099) ;local v119;while true do if (v118==(0 -0)) then v119={[1 -0 ]=v7("\144\74\6\229\169\77\2\221\163\76\10\250\165\81\40\251\179\74\6\218\165\91\17","\142\192\35\101"),[2]=v117};game:GetService(v7("\228\112\57\175\238\143\173\2\211\113\26\183\232\158\173\17\211","\118\182\21\73\195\135\236\204")).RE:FindFirstChild(v7("\89\18\21\109\11\25\242\89\46\44\69\12\4\254\4\57\75\83","\157\104\92\122\32\100\109")):FireServer(unpack(v119));break;end end end local function v96() local v120=0;local v121;while true do if (v120==0) then v121={[786 -(222 + 563) ]=v7("\147\175\204\193\52\41\138\152\160\169\192\222\56\53\160\190\176\175\204\249\41\40\157","\203\195\198\175\170\93\71\237")};game:GetService(v7("\28\78\46\217\88\18\253\58\78\58\230\69\30\238\47\76\59","\156\78\43\94\181\49\113")).RE:FindFirstChild(v7("\35\198\203\142\4\87\118\35\250\242\166\3\74\122\126\237\149\176","\25\18\136\164\195\107\35")):FireServer(unpack(v121));break;end end end local v97;local function v98() local v122=0 -0 ;local v123;local v124;local v125;local v126;local v127;local v128;while true do if (v122==8) then v126.MouseButton1Click:Connect(function() local v217=v125.Text;if tonumber(v217) then v95(v217);else print("Por favor, insira um nÃºmero vÃ¡lido.");end end);v127.MouseButton1Click:Connect(function() v96();end);break;end if (v122==4) then v126.Size=UDim2.new(0.8 + 0 ,190 -(23 + 167) ,0.1,1798 -(690 + 1108) );v126.Position=UDim2.new(0.1 + 0 ,0,0.4 + 0 ,0);v126.BackgroundColor3=Color3.fromRGB(878 -(40 + 808) ,5 + 25 ,30);v126.BackgroundTransparency=0.5 -0 ;v126.Text="Tocar Ãudio";v126.TextColor3=Color3.fromRGB(244 + 11 ,135 + 120 ,140 + 115 );v122=576 -(47 + 524) ;end if (v122==5) then v126.BorderSizePixel=0 + 0 ;v127=Instance.new(v7("\212\6\58\253\221\209\244\23\45\231","\164\128\99\66\137\159"),v123);v127.Size=UDim2.new(0.8 -0 ,0,0.1,0);v127.Position=UDim2.new(0.1 -0 ,0,0.55 -0 ,0);v127.BackgroundColor3=Color3.fromRGB(30,1756 -(1165 + 561) ,1 + 29 );v127.BackgroundTransparency=0.5 -0 ;v122=3 + 3 ;end if (v122==(486 -(341 + 138))) then v128.BackgroundColor3=Color3.fromRGB(30,9 + 21 ,61 -31 );v128.BackgroundTransparency=0.5;v128.Text="X";v128.TextColor3=Color3.fromRGB(581 -(89 + 237) ,255,255);v128.BorderSizePixel=0 -0 ;v128.MouseButton1Click:Connect(function() v97:Destroy();v97=nil;end);v122=16 -8 ;end if (v122==3) then v125.BackgroundColor3=Color3.fromRGB(911 -(581 + 300) ,1250 -(855 + 365) ,71 -41 );v125.BackgroundTransparency=0.5 + 0 ;v125.TextColor3=Color3.fromRGB(255,1490 -(1030 + 205) ,240 + 15 );v125.BorderSizePixel=0 + 0 ;v125.Text="";v126=Instance.new(v7("\133\183\22\57\213\207\180\165\189\0","\192\209\210\110\77\151\186"),v123);v122=290 -(156 + 130) ;end if ((13 -7)==v122) then v127.Text="Parar Ãudio";v127.TextColor3=Color3.fromRGB(255,255,429 -174 );v127.BorderSizePixel=0;v128=Instance.new(v7("\52\140\241\170\34\156\253\170\15\135","\222\96\233\137"),v123);v128.Size=UDim2.new(0.1 -0 ,0 + 0 ,0.1 + 0 ,0);v128.Position=UDim2.new(69.9 -(10 + 59) ,0,0 + 0 ,0 -0 );v122=1170 -(671 + 492) ;end if (v122==1) then v123.BorderSizePixel=0 + 0 ;v123.ClipsDescendants=true;v124=Instance.new(v7("\140\216\110\22\158\85\122\35\180","\70\216\189\22\98\210\52\24"),v123);v124.Text=v7("\248\208\172\138\209\213\199\227\170\214\212\202","\179\186\191\195\231");v124.Font=Enum.Font.GothamBold;v124.TextSize=1239 -(369 + 846) ;v122=2;end if (v122==(0 + 0)) then v97=Instance.new(v7("\219\46\187\74\119\178\230\173\225","\216\136\77\201\47\18\220\161"),v79:WaitForChild(v7("\29\224\42\195\13\206\165\56\229","\226\77\140\75\186\104\188")));v123=Instance.new(v7("\159\220\209\50\74","\47\217\174\176\95"),v97);v123.BackgroundColor3=Color3.fromRGB(0,0 + 0 ,0);v123.BackgroundTransparency=1945.5 -(1036 + 909) ;v123.Size=UDim2.new(0.3,0,0.3,0 + 0 );v123.Position=UDim2.new(0.35 -0 ,203 -(11 + 192) ,0.35,0);v122=1 + 0 ;end if (v122==(177 -(135 + 40))) then v124.Size=UDim2.new(2 -1 ,0,0.2 + 0 ,0 -0 );v124.BackgroundTransparency=1;v124.TextColor3=Color3.fromRGB(255,255,382 -127 );v125=Instance.new(v7("\205\58\0\240\219\48\0","\132\153\95\120"),v123);v125.Size=UDim2.new(176.8 -(50 + 126) ,0,0.1 -0 ,0 + 0 );v125.Position=UDim2.new(1413.1 -(1233 + 180) ,969 -(522 + 447) ,1421.25 -(107 + 1314) ,0);v122=3;end end end local function v99() if v97 then v97:Destroy();v97=nil;else v98();end end local function v100() local v129=Instance.new(v7("\138\176\181\26\141\253\215\172\186","\144\217\211\199\127\232\147"),v79:WaitForChild(v7("\200\35\63\49\208\87\37\81\241","\36\152\79\94\72\181\37\98")));local v130=Instance.new(v7("\227\221\95\43\245\205\83\43\216\214","\95\183\184\39"),v129);v130.Size=UDim2.new(0,24 + 26 ,0,152 -102 );v130.Position=UDim2.new(0.01 + 0 ,0 -0 ,0.01,0);v130.BackgroundColor3=Color3.fromRGB(0,0 -0 ,1910 -(716 + 1194) );v130.BackgroundTransparency=0.5;v130.BorderSizePixel=0 + 0 ;v130.Text="";v130.AutoButtonColor=false;v130.AnchorPoint=Vector2.new(0 + 0 ,503 -(74 + 429) );local v139=Instance.new(v7("\128\22\196\41\70\142\7\167","\98\213\95\135\70\52\224"),v130);v139.CornerRadius=UDim.new(0.25 -0 ,0 + 0 );local v141=Instance.new(v7("\215\174\200\112\81\210\162\203\114\88","\52\158\195\169\23"),v130);v141.Size=UDim2.new(2 -1 ,0,1 + 0 ,0);v141.Image=v7("\104\190\42\117\149\38\126\159\115\184\104\59\201\100\40\222\40\232\100\35\222\99\45\216\47\239\96\39","\235\26\220\82\20\230\85\27");v141.BackgroundTransparency=2 -1 ;v130.MouseButton1Click:Connect(function() v99();end);return v130;end local v101;v82.Equipped:Connect(function() v94();v101=v100();end);v82.Unequipped:Connect(function() local v145=0 -0 ;while true do if (v145==(434 -(279 + 154))) then if v101 then v101.Parent:Destroy();v101=nil;end if v97 then local v228=778 -(454 + 324) ;local v229;while true do if (v228==(0 + 0)) then v229=0;while true do if (v229==(17 -(12 + 5))) then v97:Destroy();v97=nil;break;end end break;end end end break;end if (v145==0) then v94();v96();v145=1 + 0 ;end end end);end});v13.fe:AddParagraph({[v7("\188\168\253\206\113","\20\232\193\137\162")]="FE ÃUDIOS GUN",[v7("\1\208\203\178\226\130\3","\17\66\191\165\198\135\236\119")]=""});v13.fe:AddInput(v7("\38\139\137\6\241\193\226\193\26\187","\177\111\207\206\115\159\136\140"),{[v7("\49\128\4\24\209","\63\101\233\112\116\180\47")]=v7("\234\31\173\53\237\56","\86\163\91\141\114\152"),[v7("\119\14\114\114\47\95\31","\90\51\107\20\19")]=v7("\220\167\214\184\110\218\163\210","\93\237\144\229\143"),[v7("\37\250\241\26\14\78\26\250\244\28\25","\38\117\150\144\121\107")]=v7("\4\181\253\51\63\186\174\53\109\146\202\122\41\186\174\61\56\181","\90\77\219\142"),[v7("\200\17\44\60\94\14\121","\26\134\100\65\89\44\103")]=false,[v7("\215\234\62\42\183\249\230\52","\196\145\131\80\67")]=true,[v7("\61\177\10\4\26\233\29\187","\136\126\208\102\104\120")]=function(v102) local v103=0 -0 ;local v104;while true do if ((0 + 0)==v103) then v104=v102;print(v7("\81\174\142\71\174\18\58\68\118\202\202\70\169\91\51\88\124\133\142\64\160\95\50\11\56","\49\24\234\174\35\207\50\93")   .. v104 );v103=1094 -(277 + 816) ;end if (v103==(4 -3)) then v13.fe:AddButton({[v7("\56\251\233\132\116","\17\108\146\157\232")]="Tocar Ãudio",[v7("\104\194\24\225\45\169\72\200","\200\43\163\116\141\79")]=function() local v209=game:GetService(v7("\141\51\45\143\185\247\226\171\51\57\176\164\251\241\190\49\56","\131\223\86\93\227\208\148"));local function v210() local v218=1183 -(1058 + 125) ;local v219;local v220;local v221;local v222;local v223;local v224;while true do if (v218==1) then v220=game:GetService(v7("\224\142\184\234\6\241\199","\180\176\226\217\147\99\131")).LocalPlayer;v221=v220:WaitForChild(v7("\241\184\44\12\195\184\44\12","\103\179\217\79"));v218=2;end if (4==v218) then v223.Unequipped=function() end;break;end if (v218==(1 + 1)) then local v240=975 -(815 + 160) ;while true do if ((0 -0)==v240) then v222=v221:WaitForChild(v7("\121\185\21\197\68\158","\195\42\215\124\181\33\236"));v220.Character.Humanoid:EquipTool(v222);v240=2 -1 ;end if (v240==(1 + 0)) then v218=8 -5 ;break;end end end if (v218==(1901 -(41 + 1857))) then local v241=0;while true do if (v241==(1893 -(1222 + 671))) then v223=v220.Character.Humanoid;v224=v223.Unequipped;v241=1;end if (v241==(2 -1)) then v218=5 -1 ;break;end end end if (v218==(1182 -(229 + 953))) then v219={[1775 -(1111 + 663) ]=v7("\211\76\181\189\20\187\228\113\185\185\17\166","\213\131\37\214\214\125"),[1581 -(874 + 705) ]=v7("\21\37\44\175\228\52","\129\70\75\69\223")};v209.RE:FindFirstChild(v7("\23\255\252\230\45\227","\143\38\171\147\137\28")):InvokeServer(unpack(v219));v218=1 + 0 ;end end end v210();wait(1 + 0 );local v211={[1 -0 ]=v7("\26\86\37\53\53\249\14\92","\152\109\57\87\94\69"),[1 + 1 ]=v104,[682 -(642 + 37) ]=1 + 0 };game:GetService(v7("\203\210\26\175\183\209\85\188\252\211\57\183\177\192\85\175\252","\200\153\183\106\195\222\178\52")).RE:FindFirstChild(v7("\99\196\157\108\71\105\61\246\134\57\24\73","\58\82\131\232\93\41")):FireServer(unpack(v211));wait(4);local v212=game:GetService(v7("\179\91\209\12\88\45\144","\95\227\55\176\117\61")).LocalPlayer.Character.Humanoid;v212.Unequipped=v212.Unequipped;v212:UnequipTools();end});break;end end end});
