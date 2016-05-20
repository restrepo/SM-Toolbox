(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



getColorFactorEffPot[fields_]:=Block[{pos,i,j,fieldsordered,vertex,colorFunction,colorIndizes,res,ind,IND,sub4},pos=Position[VerticesInv[All],C@@fields]/.Cp->C;
fieldsordered=VerticesOrg[All][[pos[[1,1]]]];
vertex=VerticesVal[All][[pos[[1,1]]]];
colorFunction=ExtractStructure[vertex,color]/.Lam[a__]->1/2 Lam[a];
colorIndizes=getIndizesWI/@fieldsordered;
colorIndizes=Select[#,FreeQ[#,color]==False&]&/@colorIndizes/.{color,a_Integer}->a;
If[Length[fields]===4,sub4={ct3->ct1,ct4->ct2};,sub4={}];
colorFunction=Select[colorFunction,#[[2,1]]=!=0&];
res=Table[{},{Length[colorFunction]}];
For[i=1,i<=Length[colorFunction],
res[[i]]=colorFunction[[i,1]]*conj[colorFunction[[i,1]]]//.sub4//.sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}];
For[j=1,j<=Length[colorIndizes],
If[colorIndizes[[j]]=!={}&&(Length[fields]<4||j<3),
ind={ToExpression["ct"<>ToString[j]],1,colorIndizes[[j,1]]};
res[[i]]=ReleaseHold[Hold[Sum[res[[i]],IND]] /. IND->ind];
];
j++;];
i++;];
Return[res //. sum->Sum];];


DiracQ[p_]:=Block[{temp},
temp=Select[DiracList,#[[1]]===(p/.{conj[a_]->a,bar[a_]->a})&];
If[!temp==={},
If[temp[[1,2]]===2,Return[True]];
];
Return[False];
];


ConjugateDiagramsQ[diag1_,diag2_]:=Block[{type},
(*type=3: Hemisphere topology, type=2: Balls topology*)
type=Length[diag1[[2]]];
If[type===3,
Return[diag1[[1,1]]===diag2[[1,1]]||diag1[[1,2]]===diag2[[1,1]]];,
Return[diag1[[1,1]]===diag2[[1,1]]];
];
];


getDiracFermionList:=Block[{i,fermionlist={},ListSubstituteBack={},AllDiracFermions,name},
(*gives a list of Dirac spinors, neglect conjugates*)
fermionlist={#[[1]],#[[2]]}&/@DEFINITION[EWSB][DiracSpinors]//.{conj[a_]->a};
(*remove duplicates among Weyl spinors*)
fermionlist={#[[1]],Intersection[#[[2]]]}&/@fermionlist;
(*remove zeros (eg. the RH Neutrino part) *)
fermionlist={#[[1]],Select[#[[2]],!#===0&,2]}&/@fermionlist;
(*determine mutliplicity (1=Majorana/Weyl, 2=Dirac) *)
fermionlist=Intersection[Append[#,Length[#[[2]]]]&/@fermionlist];
ListSubstituteBack=Flatten[(name=#[[1]];Rule[#,name]&/@#[[2]])&/@fermionlist];
AllDiracFermions=Intersection[AllFermions/.ListSubstituteBack];
For[i=1,i<=Length[AllDiracFermions],i++;,
AllDiracFermions[[i]]=Append[AllDiracFermions[[i]],fermionlist[[i,3]]];
];
Return[AllDiracFermions];
];


Generate2LoopDiagramsHemisphere:=Block[{top2LoopHemispheres,insHemispheres,reducedHemispheres},
(* there are two topologies, called "Hemispheres" and "Balls" *)
top2LoopHemispheres={{C[FieldToInsert[1],FieldToInsert[2],FieldToInsert[3]],C[AntiField@FieldToInsert[1],AntiField@FieldToInsert[2],AntiField@FieldToInsert[3]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3]}};
(* Insert Fields *)
insHemispheres=InsFields[top2LoopHemispheres];
(* remove conjugate diagrams to avoid double counting *)
reducedHemispheres=Intersection[insHemispheres,SameTest->ConjugateDiagramsQ];
Return[reducedHemispheres];
];
Generate2LoopDiagramsBalls:=Block[{top2LoopBalls,insBalls},
(* there are two topologies, called "Hemispheres" and "Balls" *)
top2LoopBalls={{C[FieldToInsert[1],FieldToInsert[2],AntiField[FieldToInsert[1]],AntiField[FieldToInsert[2]]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2]}};
(* Insert Fields *)
insBalls=InsFields[top2LoopBalls];
Return[insBalls];
];


getType2LoopDiagram[diagram_]:=Block[{NrCoupParticles,p1,p2,p3,type={}},
NrCoupParticles=Length/@diagram;
Switch[NrCoupParticles,
{2,3},
p1=Internal[1]/.diagram[[2]];
p2=Internal[2]/.diagram[[2]];
p3=Internal[3]/.diagram[[2]];
Switch[getType[p1],
S,
Switch[getType[p2],
S,
If[getType[p3]===S,
type=SSS;,
type=SSV;];,
F,
type=FFS;,
V,
If[getType[p3]===S,
type=SSV;,
type=VVS;];
];,
F,
Switch[getType[p2],
S,
type=FFS;,
F,
If[getType[p3]===S,
type=FFS;,
type=FFV;];,
V,
type=FFV;
];,
V,
Switch[getType[p2],
S,
If[getType[p3]===S,
type=SSV;,
type=VVS;];,
F,
type=FFV;,
V,
If[getType[p3]===S,
type=VVS;,
type=VVV;];,
G,
type=ggV;
];,
G,
type=ggV;
];,
{1,2},
p1=Internal[1]/.diagram[[2]];
p2=Internal[2]/.diagram[[2]];
If[getType[p1]===S,
If[getType[p2]===S,
type=SS;,
type=VS;
];,
If[getType[p2]===S,
type=VS;,
type=VV;
];
];
];
Return[type];
];


Classify2LoopDiagrams[diagrams_]:=Block[{diagram,temp,bare,listSSS,listSS,listFFS,listFFSbar,listSSV,listVS,listVVS,listFFV,listFFVbar,listVV,listVVV,listggV},
listSSS={SSS,Select[diagrams,getType2LoopDiagram[#]===SSS&]};
listSS={SS,Select[diagrams,getType2LoopDiagram[#]===SS&]};
listFFS={FFS,Select[diagrams,getType2LoopDiagram[#]===FFS&]};
listFFSbar={FFSbar,Select[listFFS[[2]],TwoEqualFermionsQ]};
listSSV={SSV,Select[diagrams,getType2LoopDiagram[#]===SSV&]};
listVS={VS,Select[diagrams,getType2LoopDiagram[#]===VS&]};
listVVS={VVS,Select[diagrams,getType2LoopDiagram[#]===VVS&]};
listFFV={FFV,Select[diagrams,getType2LoopDiagram[#]===FFV&]};
listFFVbar={FFVbar,Select[listFFV[[2]],TwoEqualFermionsQ]};
listVV={VV,Select[diagrams,getType2LoopDiagram[#]===VV&]};
listVVV={VVV,Select[diagrams,getType2LoopDiagram[#]===VVV&]};
listggV={ggV,Select[diagrams,getType2LoopDiagram[#]===ggV&]};
temp={listSSS,listSS,listFFS,listFFSbar,listSSV,listVS,listVVS,listFFV,listFFVbar,listVV,listVVV,listggV};
Return[temp];
];


