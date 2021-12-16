function [position_soleil, hauteur_soleil, azimut_soleil] = Calcul_position_soleil(jour, heure, coordonnees)
%% [Coord_cart_xyz,Hauteur,Azimut]=Calcul_position_soleil([12 12 2012],[12 12],[45 46 42.319; 4 55 22.249]);
%
%% D�finit la position du soleil en renvoyant ses coordonn�es : variables de sortie
% cartesiennes [x y z] dans le rep�re suivant (en m):
% l'axe z est vertical positif vers le ciel
% l'axe x est horizontal orient� Ouest Est
% l'axe y est horizontal orient� Sud Nord
% hauteur est l'angle vertical orient� positif vers le ciel (en rd)
% azimuth est l'angle (plan horizontal) entre la direction du soleil et le Sud dans le sens r�trograde (en rd)
% e.g. sens aiguilles d'une montre (Sud-->0 Ouest-->pi/2 Nord-->pi % Est-->3pi/2)
%% Variables d'entr�e
% jour: sous la forme d'un vecteur du type [jour, mois, ann�e] e.g. [29 02 2008] pour le 29 f�vrier 2008
% heure: sous la forme d'un vecteur du type [heure, minute] e.g.    [21 05] pour 21h05
% ATTENTION HEURE SOLAIRE = -2h en printemps-�t� et -1h en automne-hivers
% e.g. 14h � votre montre vous rentrez 13h su vous �tes en �t� et 12h en hiver 
% coordonnees: d�finition de la lattitude et de la longitude du lieu consid�r� exprim�es en degr�s, minutes, secondes
% e.g. coordonnees = [45 45 35;4 50 32] pour une lattitude de 45� 45' 35'' Nord et une longitude de 4� 50' 32'' Est

%% Evaluation des param�tres de base 
heure_legale = 60*heure(1) + heure(2); % Heure l�gale en min
% Calcul des lattitudes longitudes en degr�s
latitude = coordonnees(1,1)+coordonnees(1,2)/60+coordonnees(1,3)/3600;
longitude = -(coordonnees(2,1)+coordonnees(2,2)/60+coordonnees(2,3)/3600);
% Calcul du numero du jour (365.2425 jours/an)
mois = [31 28+(jour(3)/4==floor(jour(3)/4)) 31 30 31 30 31 31 30 31 30 31]; % Nombre de jours par mois
d = jour(1) - mois(jour(2)) + sum(mois(1:jour(2))); % Numero du jour dans l'ann�e

%% calcul de la distance terre soleil
% source th�se OUMBE page 22 formule 3.3 corrig�e
% http://pastel.archives-ouvertes.fr/docs/00/50/13/84/PDF/these_oumbe.pdf
j=d*2*pi/365.2422;
epsilon=0.03344*cos(j-0.049);
ro=149598e6;
distance_terre_soleil=ro/sqrt(1+epsilon);

%% Calcul de la d�clinaison en radians 
% source: http://www.csbat.net/equipe/t03_geometrie.htm
% i.e. angle direction Terre-Soleil / plan �quateur terrestre
% plus de d�tails -->http://www.heliodon.net/downloads/Beckers_2010_Helio_007_fr.pdf
if d > 173
    delta = 0.026*sin(2*pi*(d-173)/365.25);
else
    delta = 0;
end
dec = asin(0.398*sin(2*pi*(d-79.25)/365.25))+delta;

%% Calcul du temps solaire en heures
% sources: http://jean-paul.cornec.pagesperso-orange.fr/equation.htm
% http://michel.lalos.free.fr/cadrans_solaires/doc_cadrans/theorie_cs/heure_sol_leg.html
M = 357 + 0.9856*d; % Anomalie moyenne en degr�s
C = 1.9148*sin((pi/180)*M) + 0.02*sin((pi/180)*2*M) + 0.0003*sin((pi/180)*3*M); % �quation du centre (influence de l'ellipticit� de l'orbite terrestre) en degr�s
L = 280 + C + 0.9856*d; % longitude vraie du Soleil en degr�s
R = -2.465*sin((pi/180)*2*L)+0.053*sin((pi/180)*4*L)-0.0014*sin((pi/180)*6*L); % r�duction � l'�quateur (influence de l'inclinaison de l'axe terrestre) en degr�s
ET = 4*(C+R); % Equation du temps en min OK

heure_solaire = (heure_legale - 4*longitude - ET)/60;

%% Angle horaire en radians 

angle_horaire = heure_solaire*pi/12+pi;

%% Angle zenith en radians 

angle_zenith = acos(sin((pi/180)*latitude)*sin(dec) + cos((pi/180)*latitude)*cos(dec)*cos(angle_horaire));

%% Hauteur soleil en radians
% La hauteur du soleil est l'angle que fait la direction du soleil avec le plan horizontal (0 pour le plan horizontal et pi/2 pour le z�nith ). 

hauteur_soleil = pi/2 - angle_zenith;

%% Azimut du soleil en radians
% L�azimut solaire est l�angle que fait le plan vertical du soleil avec le plan m�ridien du lieu
% On le mesure � partir du Sud, vers l�Est ou vers l�Ouest ( 0 pour le Sud, pi pour le Nord ). 

a1 = sin((pi/180)*latitude)*cos(angle_horaire)-cos((pi/180)*latitude)*tan(dec);
azimut_soleil = atan(sin(angle_horaire)/a1);

if a1<=0
    azimut_soleil = azimut_soleil + pi;
end
if azimut_soleil<=0
    azimut_soleil = azimut_soleil + 2*pi;
end

%% Position du soleil dans le repere cartesien [x y z] 

position_soleil(1,1) = -distance_terre_soleil*cos(hauteur_soleil)*sin(azimut_soleil);
position_soleil(1,2) = -distance_terre_soleil*cos(hauteur_soleil)*cos(azimut_soleil);
position_soleil(1,3) = distance_terre_soleil*sin(hauteur_soleil);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% FIN DU PROGRAMME %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ann�e	Passage � l�heure d��t�      Passage � l�heure d�hiver
% 2010	28 mars                     31 octobre
% 2011	27 mars                     30 octobre
% 2012	25 mars                     28 octobre
% 2013	31 mars                     27 octobre
% 2014	30 mars                     26 octobre
% 2015	29 mars                     25 octobre
% 2016	27 mars                     30 octobre
% 2017	26 mars                     29 octobre
% 2018	25 mars                     28 octobre
% 2019	31 mars                     27 octobre
% 2020	29 mars                     25 octobre

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fichier  cr�� en 2010 par GLE Philippe 
%%          modifi� en 2012 par LOZINGUEZ Eric
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
