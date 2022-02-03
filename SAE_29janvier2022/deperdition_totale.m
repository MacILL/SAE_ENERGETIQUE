function H=deperdition_totale(Em,Ep,Es,lambda_m,lambda_p,lambda_s,fen_sud,fen_nord,fen_ouest,fen_est, inv_hint_m, inv_hext_m,inv_hint_p,inv_hext_p,inv_hint_s,inv_hext_s,bm,bp,bs,bf,K,Ufen,longueur,largeur,hauteur,Cp_air,n)
%tout est vérifié 17/12/21

% Paramètres d'entrée: UbS un vecteur qui rassemble l'ensemble des b*U*S
% Paramètres de sortis: Hp: dperdition des parois
%Auteurs Dianoux, Gbaguidi, Qian
%Date 28/12/2021

%fabrication d'un vecteur qui regroupe les conductances (du mur, de la paroi,
% de la fenêtre)
% Em:les épaisseurs des couches composants le murs
%lambda_m : les conductivités  des composants dans le même ordre 
%resctivement pour le plafond et le sol
[Um,Up,Us] = Calcul_U(Em ,lambda_m ,Ep, lambda_p, Es, lambda_s, inv_hint_m, inv_hext_m,inv_hint_p,inv_hext_p,inv_hint_s,inv_hext_s);

%Sm,Sp, Ss, Sfen surface du mur du plafond, du sol et des fenêtres
Sm=longueur*hauteur*(1-fen_ouest)+hauteur*largeur*(1-fen_nord)+hauteur*largeur*(1-fen_sud)+hauteur*longueur*(1-fen_est);
Sp=longueur*largeur;
Ss=longueur*largeur;
Sfen=(2*largeur+2*longueur)*hauteur - Sm;

%deperdition de la paroi
% mat_cara: contruction d'une matrice mat_cara regroupant les caractéristiques 
% du mur,du plafond, du sol et de la fenêtre 
mat_cara=[Sm Um bm;Sp Up bp;Ss Us bs; Sfen Ufen bf];
%UbS un vecteur qui rassemble l'ensemble des Ui*bi*Si
UbS= ens_UbS(mat_cara);
Hp=deperditions_paroi(UbS,K);

%deperdition via le renouvellement de l'air
%V: le volume du bâtiment
V= longueur*largeur*hauteur;
Hv= Cp_air*n*V;

%dépertition totale
H=Hp+Hv;
end
%teste
%H=deperdition_totale(1.1,S,15,12,10,0.34,0.5)

