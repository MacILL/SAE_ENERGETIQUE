function [donnees_meteo] = recupere_meteo(date)
%function [donnees_meteo] = recupere_meteo(date)
%Fonction qui récupère les données météo d'un jour particulier
%paramètre d'entrée: date du jour au format [jour mois année]
%paramètre de sortie: texte du fichier

%Construction de l'url des donnÃ©es
anneetrn=date(3)-2000;
if anneetrn<10
    formatanneetrn='0%d';
else
    formatanneetrn='%d';
end
anneetrn=sprintf(formatanneetrn,anneetrn);
nommois=['jan';'feb';'mar';'apr';'may';'jun';'jul';'aug';'sep';'oct';'nov';'dec'];
formaturl='http://idmp.entpe.fr/data/%d/%s/vlx%sQC_%d_%d.txt';
url=sprintf(formaturl,date(3),nommois(date(2),:),anneetrn,date(2),date(1))
%Lecture de l'url et conversion en cellules sÃ©parÃ©es
%donnees_meteo=split(webread(url));
donnees_meteo=urlread(url);


end