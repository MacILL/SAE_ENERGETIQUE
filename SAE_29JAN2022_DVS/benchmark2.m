function Qc_an_surf = benchmark2(Tref,Fs,etage,DJUL,Gint,Tint, IrrN, IrrS, IrrE, IrrO,Temperature_par_heure,Em,Ep,Es,lambda_m,lambda_p,lambda_s,fen_sud,fen_nord,fen_ouest,fen_est, inv_hint_m, inv_hext_m,inv_hint_p,inv_hext_p,inv_hint_s,inv_hext_s,bm,bp,bs,bf,K,Ufen,longueur,largeur,hauteur,Cp_air,n)
% Paramètres d'entrée: 
% Paramètres de sortis: Qc_an_surf :le besoin en chauffage annuel
% surfacique
%Auteurs Dianoux, Gbaguidi, Qian
%Date 28/12/2021

%Asi surface de vitrage pour l'orientation i 
AsN=fen_nord*largeur*hauteur;
AsS=fen_sud*largeur*hauteur;
AsE=fen_est*hauteur*longueur;
AsO=fen_ouest*hauteur*longueur;

% Surface chauffée=  Ach
Ach=etage*longueur*largeur;  


% Les pertes (renouvellement d'air et des parois) pour un jour donné
H=deperdition_totale(Em,Ep,Es,lambda_m,lambda_p,lambda_s,fen_sud,fen_nord,fen_ouest,fen_est, inv_hint_m, inv_hext_m,inv_hint_p,inv_hext_p,inv_hint_s,inv_hext_s,bm,bp,bs,bf,K,Ufen,longueur,largeur,hauteur,Cp_air,n);
% déperdition par heure
Ql= perte_horaire(Temperature_par_heure,H,Tint);

IrrN=[IrrN, IrrN(23)]
IrrS=[IrrS, IrrS(23)]
IrrO=[IrrO, IrrO(23)]
IrrE=[IrrE, IrrE(23)]
%Les apports (interne et solaire)
Qg=apport_horaire(Gint,Ach,IrrN, AsN, IrrS, AsS, IrrO, AsO, IrrE, AsE, Fs);


%Besoin de chauffage:
%journalière
tau=2.9;
Qc_jour=besoin_de_chauffage_par_jour2(Ql,Qg,tau);
Tjour=(max(Temperature_par_heure)+min(Temperature_par_heure))/2;
%annuel
Qc_an=Qc_jour*DJUL/(Tref-Tjour);
%annuel surfacique
Qc_an_surf= Qc_an/Ach

