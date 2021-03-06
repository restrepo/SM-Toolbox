ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},  
				
{AlphaS,    {Description -> "Alpha Strong"}},				  
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},
				
{e,         { Description -> "electric charge"}}, 

{Yu,        { Description -> "Up-Yukawa-Coupling"   }}, 
{Yd,        { Description -> "Down-Yukawa-Coupling"}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling"}}, 

{T[Ye],     { Description -> "Trilinear-Lepton-Coupling"}},
{T[Yd],     { Description -> "Trilinear-Down-Coupling"}}, 
{T[Yu],     { Description -> "Trilinear-Up-Coupling"}}, 

{\[Mu],     { Description -> "Mu-parameter"}}, 
{B[\[Mu]],  { Description -> "Bmu-parameter"}},        

{mq2,       { Description -> "Softbreaking left Squark Mass"}},
{me2,       { Description -> "Softbreaking right Slepton Mass"}},
{ml2,       { Description -> "Softbreaking left Slepton Mass"}},
{mu2,       { Description -> "Softbreaking right Up-Squark Mass"}},
{md2,       { Description -> "Softbreaking right Down-Squark Mass"}},
{mHd2,      { Description -> "Softbreaking Down-Higgs Mass"}}, 
{mHu2,      { Description -> "Softbreaking Up-Higgs Mass"}}, 

{MassB,     { Description -> "Bino Mass parameter"}},
{MassWB,    { Description -> "Wino Mass parameter"}},
{MassG,     { Description -> "Gluino Mass parameter"}},
                           
{vd,        { Description -> "Down-VEV"}}, 
{vu,        { Description -> "Up-VEV"}},       
{v,         { Description -> "EW-VEV"}},
             
{\[Beta],   { Description -> "Pseudo Scalar mixing angle"  }},             
{TanBeta,   { Description -> "Tan Beta" }},              
{\[Alpha],  { Description -> "Scalar mixing angle" }},                          
             
    
{ZD,        { Description -> "Down-Squark-Mixing-Matrix" }},             
{ZU,        { Description -> "Up-Squark-Mixing-Matrix"}},             
{ZE,        { Description -> "Slepton-Mixing-Matrix"}}, 
{ZV,        { Description->"Sneutrino Mixing-Matrix"}},   
{ZH,        { Description->"Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None }},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None }},
{ZP,        { Description->"Charged-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None }},                      
                                          
{ZN,        { Description->"Neutralino Mixing-Matrix" }}, 
{UP,        { Description->"Chargino-plus Mixing-Matrix"}}, 
{UM,        { Description->"Chargino-minus Mixing-Matrix"}}, 

{ZEL,       { Description ->"Left-Lepton-Mixing-Matrix"}},
{ZER,       { Description ->"Right-Lepton-Mixing-Matrix" }},                          
{ZDL,       { Description ->"Left-Down-Mixing-Matrix"}},                       
{ZDR,       { Description ->"Right-Down-Mixing-Matrix"}},              
{ZUL,       { Description ->"Left-Up-Mixing-Matrix"}},                        
{ZUR,       { Description ->"Right-Up-Mixing-Matrix"}},           

(*              
{ThetaW,    { Description -> "Weinberg-Angle",
             DependenceNum -> ArcSin[Sqrt[1 - (Mass[VWm]^2 - g2^2*vT^2)/Mass[VZ]^2]]}},  
*)

{ThetaW,    { Description -> "Weinberg-Angle",
             DependenceNum -> None,
	      Value -> 0.511621}},                          

{PhaseGlu,  { Description -> "Gluino-Phase" }},
{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},
{ZfW, {Description ->    "Wino Mixing Matrix"}},

{\[Lambda], {LaTeX -> "\\lambda",
             OutputName -> lam,
             LesHouches -> {HMIX,30}  } },

{MT, {LaTeX -> "M_T",
             OutputName -> MTT,
             LesHouches -> {HMIX,31}  } },

{\[Alpha], {LaTeX -> "\\alpha",
             OutputName -> alpha,
             LesHouches -> {HMIX,32}  } },

{T[\[Lambda]], {LaTeX -> "T_{\\lambda}",
             OutputName -> Tlam,
             LesHouches -> {HMIX,33}  } },

{B[MT], {LaTeX -> "B_T",
             OutputName -> BT,
             LesHouches -> {HMIX,34}  } },

{L[\[Alpha]], {LaTeX -> "L_{\\alpha}",
             OutputName -> Lal,
             LesHouches -> {HMIX,35}  } },


{mT2,       { LaTeX -> "m_t^2",
             OutputName ->  mt2,
	      LesHouches->{MSOFT,110}}},

{vT,  { LaTeX -> "v_T",
        Real -> True,
        OutputName -> vT,
        LesHouches -> {HMIX,310} }}


                                  
 }; 
 

