--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v32=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v32,v32 + 1 )),v1(v2(v25,1 + (v32% #v25) ,1 + (v32% #v25) + 1 )))%256 ));end return v5(v26);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=game:GetService(v7("\17\216\36\246\249\49\219\35\198\249","\156\67\173\74\165"));local v10=v8.LocalPlayer;local v11=game:GetService(v7("\3\184\91\29\175\54\71\55\178","\38\84\215\41\118\220\70"));local v12=v10.Character or v10.CharacterAdded:Wait() ;local v13=v12:WaitForChild(v7("\120\3\47\19\240\95\31\38\32\241\95\2\18\19\236\68","\158\48\118\66\114"));local v14=Instance.new(v7("\141\43\28\50\118\183","\155\203\68\112\86\19\197"),v11);local v15=Instance.new(v7("\118\220\36\232","\152\38\189\86\156\32\24\133"),v14);local v16=Instance.new(v7("\221\67\179\71\255\95\170\67\242\67","\38\156\55\199"),v15);v15.Anchored=true;v15.CanCollide=false;v15.Transparency=1;if  not getgenv().Network then local v33=448 -(10 + 438) ;local v34;while true do if (v33==(0 + 0)) then getgenv().Network={[v7("\138\124\111\45\35\117\232\87\187","\35\200\29\28\72\115\20\154")]={},[v7("\47\186\221\208\142\37\32\0","\84\121\223\177\191\237\76")]=Vector3.new(53.46262424 -39 ,12.46262424 + 2 ,1194.46262424 -(1123 + 57) )};Network.RetainPart=function(v42) if ((typeof(v42)==v7("\146\88\218\180\59\94\51\196","\161\219\54\169\192\90\48\80")) and v42:IsA(v7("\107\67\19\32\121\67\18\49","\69\41\34\96")) and v42:IsDescendantOf(v11)) then table.insert(Network.BaseParts,v42);v42.CustomPhysicalProperties=PhysicalProperties.new(0,0,0 + 0 ,254 -(163 + 91) ,0);v42.CanCollide=false;end end;v33=1;end if (v33==(1932 -(1869 + 61))) then v34();break;end if (v33==(1 + 0)) then local v41=0 -0 ;while true do if (v41==1) then v33=2 -0 ;break;end if (v41==0) then v34=nil;function v34() local v56=0 + 0 ;local v57;while true do if (v56==0) then v57=0;while true do if (v57==(0 -0)) then v10.ReplicationFocus=v11;v9.Heartbeat:Connect(function() sethiddenproperty(v10,v7("\143\202\218\31\14\42\168\202\216\4\48\42\184\202\194\25","\75\220\163\183\106\98"),math.huge);for v64,v65 in pairs(Network.BaseParts) do if v65:IsDescendantOf(v11) then v65.Velocity=Network.Velocity;end end end);break;end end break;end end end v41=1 + 0 ;end end end end end local function v20(v27) if (v27:IsA(v7("\50\187\153\35","\185\98\218\235\87")) and  not v27.Anchored and  not v27.Parent:FindFirstChild(v7("\227\41\42\231\208\165\194\56","\202\171\92\71\134\190")) and  not v27.Parent:FindFirstChild(v7("\1\196\45\140","\232\73\161\76")) and (v27.Name~=v7("\147\216\76\89\18\190","\126\219\185\34\61"))) then local v35=1474 -(1329 + 145) ;local v36;local v37;local v38;while true do if (v35==(971 -(140 + 831))) then for v52,v53 in next,v27:GetChildren() do if (v53:IsA(v7("\46\193\90\107\95\121\244\242\0\207\76\68\123\123\252\228\5\218\71","\135\108\174\62\18\30\23\147")) or v53:IsA(v7("\148\230\46\210\62\161\33\196\179","\167\214\137\74\171\120\206\83")) or v53:IsA(v7("\169\255\54\68\223\190\153\255","\199\235\144\82\61\152")) or v53:IsA(v7("\37\25\189\50\55\25\170\34\19\31\182\37","\75\103\118\217")) or v53:IsA(v7("\229\91\116\13\141\22\213\65\99\0","\126\167\52\16\116\217")) or v53:IsA(v7("\234\33\36\153\130\28\240\199\45\41\148\173","\156\168\78\64\224\212\121")) or v53:IsA(v7("\53\225\166\197\2\250\149\220\8\254\176\194\20\231\170\192","\174\103\142\197"))) then v53:Destroy();end end if v27:FindFirstChild(v7("\119\60\75\57\38\86\245\83\38\75","\152\54\72\63\88\69\62")) then v27:FindFirstChild(v7("\245\208\250\93\215\204\227\89\218\208","\60\180\164\142")):Destroy();end if v27:FindFirstChild(v7("\121\82\12\46\41\221\29\75\87\17\32\40\227","\114\56\62\101\73\71\141")) then v27:FindFirstChild(v7("\153\229\210\195\182\217\212\215\177\253\210\203\182","\164\216\137\187")):Destroy();end if v27:FindFirstChild(v7("\230\233\35\163\179\251","\107\178\134\81\210\198\158")) then v27:FindFirstChild(v7("\12\1\144\215\191\61","\202\88\110\226\166")):Destroy();end v35=1851 -(1409 + 441) ;end if (v35==(719 -(15 + 703))) then v27.CanCollide=false;v36=Instance.new(v7("\247\0\144\230\223\198","\170\163\111\226\151"),v27);v36.Torque=Vector3.new(100000,46311 + 53689 ,100438 -(262 + 176) );v37=Instance.new(v7("\48\60\187\63\64\7\38\2\57\166\49\65\57","\73\113\80\210\88\46\87"),v27);v35=1723 -(345 + 1376) ;end if (v35==(691 -(198 + 490))) then v37.Responsiveness=883 -683 ;v37.Attachment0=v38;v37.Attachment1=v16;break;end if (v35==2) then v38=Instance.new(v7("\160\56\217\19\228\137\33\200\28\243","\135\225\76\173\114"),v27);v36.Attachment0=v38;v37.MaxForce=10000000000000000;v37.MaxVelocity=math.huge;v35=6 -3 ;end end end end local v21=true;local function v22() local v28=1206 -(696 + 510) ;local v29;while true do if (v28==0) then v29=0 -0 ;while true do if (v29==(1262 -(1091 + 171))) then v21= not v21;if v21 then for v58,v59 in next,v11:GetDescendants() do v20(v59);end v11.DescendantAdded:Connect(function(v60) if v21 then v20(v60);end end);spawn(function() while v21 and v9.RenderStepped:Wait()  do v16.WorldCFrame=v13.CFrame;end end);end break;end end break;end end end v22();local v23=game:GetService(v7("\47\254\189\162\133\179\183\15\249\139\181\190\171\174\25\232","\199\122\141\216\208\204\221"));v23.InputBegan:Connect(function(v30,v31) if  not v31 then if (v30.KeyCode==Enum.KeyCode.F5) then v22();end end end);

--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v36,v37) local v38={};for v39=1, #v36 do v6(v38,v0(v4(v1(v2(v36,v39,v39 + 1 )),v1(v2(v37,1 + (v39% #v37) ,1 + (v39% #v37) + 1 )))%256 ));end return v5(v38);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=Instance.new(v7("\16\206\56\192\249\45\234\63\204","\156\67\173\74\165"));v10.Parent=v9:WaitForChild(v7("\4\187\72\15\185\52\97\33\190","\38\84\215\41\118\220\70"));local v12=Instance.new(v7("\118\4\35\31\251","\158\48\118\66\114"));v12.Size=UDim2.new(0.5,0,0.3,0 -0 );v12.Position=UDim2.new(0.25 -0 ,0 + 0 ,1954.35 -(508 + 1446) ,0);v12.BackgroundColor3=Color3.fromRGB(186 + 69 ,1252 -(915 + 82) ,722 -467 );v12.BorderSizePixel=0;v12.Parent=v10;local v18=Instance.new(v7("\159\33\8\34\95\164\249\174\40","\155\203\68\112\86\19\197"));v18.Size=UDim2.new(1 + 0 ,0 -0 ,1187.2 -(1069 + 118) ,0 -0 );v18.Position=UDim2.new(0 -0 ,0,0 + 0 ,0 -0 );v18.Text="Bring all parts! - Alert âš ï¸";v18.TextScaled=true;v18.Parent=v12;local v24=Instance.new(v7("\114\216\46\232\108\121\231\253\74","\152\38\189\86\156\32\24\133"));v24.Size=UDim2.new(1 + 0 ,0,791.5 -(368 + 423) ,0 -0 );v24.Position=UDim2.new(18 -(10 + 8) ,0 -0 ,442.2 -(416 + 26) ,0 -0 );v24.Text="Por favor, use um teclado virtual script se vocÃª estiver no celular e aperte a tecla F5 para ativar. No computador, aperte a tecla F5.";v24.TextScaled=true;v24.Parent=v12;local v30=Instance.new(v7("\200\82\191\82\222\66\179\82\243\89","\38\156\55\199"));v30.Size=UDim2.new(0.4,0,0.2 + 0 ,0 -0 );v30.Position=UDim2.new(438.3 -(145 + 293) ,430 -(44 + 386) ,1486.75 -(998 + 488) ,0 + 0 );v30.Text=v7("\135\86","\35\200\29\28\72\115\20\154");v30.TextScaled=true;v30.Parent=v12;v30.MouseButton1Click:Connect(function() v10:Destroy();end);
