
function H=deperdition_totale(hint,hext,S_mur,S_plaf,S_sol,b_mur,b_plaf,b_sol,K,longueur,largeur,hauteur,Cp_air,n)

TEST_DEBUG=0;

if(TEST_DEBUG==1)
  hint=
  hext=
  S_mur=
  S_plaf=
  S_sol=
  b1=
  b2=
  b3=
  K=
  longueur=
  largeur=
  hauteur=
  Cp_air=
  n  
    
end


U1=Calcul_U(1);
U2=Calcul_U(2);
U3=Calcul_U(3);
mat_cara=[S_mur U1 b1;S_plaf U2 b2;S3 U3 b3; S4 U4 b4];
UbS= ens_UbS(mat_cara);
Hp=deperditions_paroi(UbS,K);

V= volume(longueur, largeur, hauteur);
Hv= deperditions_renouvellement_air(Cp_air,n,V);
H=Hp+Hv;
end

%teste
%H=deperdition_totale(1.1,S,15,12,10,0.34,0.5)