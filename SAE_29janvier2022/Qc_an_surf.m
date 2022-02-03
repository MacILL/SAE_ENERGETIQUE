function Qc_an_surf = benchmark1(Ach,DJUL,Gint,Tint, IrrN, IrrS, IrrE, IrrO, AsN,AsS,AsE, AsO)
% pour une h donnée
% Surface chauffée=  Ach
AsN=fen_nord*largeur*hauteur;
AsS=fen_sud*largeur*hauteur;
AsE=fen_est*hauteur*longueur;
AsO=fen_ouest*hauteur*longueur;
Ach=etage*longueur*largeur

% pour un jour donné
H=deperdition_totale(Em_platre,Em_isolant,Em_beton,Em_enduit,Ep_platre, Ep_isolant,Ep_beton,Es_carr,Es_beton1,Es_isolant,Es_beton2,lambda_platre,lambda_isolant,lambda_beton,lambda_enduit,lambda_carr,fen_sud,fen_nord,fen_ouest,fen_nord,e_m ,lamda_m, lamda_p, lamda_s, hint_m, hext_m,hint_p,hext_p,hint_s,hext_s,,bmur,bp,bs,K,longueur,largeur,hauteur,Cp_air,n);
Qg=chaleur_g(Gint,Ach,IrrN, AsN, IrrS, AsS, IrrO, AsO, IrrE, AsE, Fs);
Ql= chaleur_l(Temperature_par_heure,H,Tint);
Qc_jour=besoin_de_chauffage_par_jour(Ql,Qg);
Tjour=(max(Temperature_par_heure)-min(Temperature_par_heure))/2;
Qc_an=Qc_jour(j)*DJUL(Tref-Tjour)

Qc_an_surf= Qc_an/Ach;