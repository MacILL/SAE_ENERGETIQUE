function [donnees_meteo] = recupere_meteo(date)
%function [donnees_meteo] = recupere_meteo(date)
%Fonction qui r�cup�re les donn�es m�t�o d'un jour particulier
%param�tre d'entr�e: date du jour au format [jour mois ann�e]
%param�tre de sortie: texte du fichier

%Construction de l'url des données
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
%Lecture de l'url et conversion en cellules séparées
%donnees_meteo=split(webread(url));
donnees_meteo=urlread(url);


end