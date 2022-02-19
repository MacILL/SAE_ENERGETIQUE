function [Qs]=Apport_solaire(IrrN, AsN, IrrS, AsS, IrrO, AsO, IrrE, AsE, Fs)
%[Qs]=Apport_solaire(Irr, Asi, Fs)
%Cette fonction calcule les apports solaires d'une surface 
%Paramètre de sortie
%Qs Apport de chaleur du soleil (par heure)
%Paramètres d'entrée
% Irr Irriadiation de la surface (heure par heure) pour 
% NB: Irr est un vecteur de 24 éléments
% Asi surface de vitrage
% Fs facteur solaire du vitrage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 14/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=0;

if (length(IrrN)~=24)
    display('attention, le vecteur IrrN contient ')
    display(length(IrrN))
end
if (length(IrrS)~=24)
    display('attention, le vecteur IrrS contient ')
    display(length(IrrS))
end
if (length(IrrO)~=24)
    display('attention, le vecteur IrrO contient ')
    display(length(IrrO))
end
if (length(IrrE)~=24)
    display('attention, le vecteur IrrE contient ')
    display(length(IrrE))
end

IrrNsurf=IrrN*AsN;
IrrSsurf=IrrS*AsS;
IrrOsurf=IrrO*AsO;
IrrEsurf=IrrE*AsE;

%Qs=zeros(length(IrrN),1);
Qs=[];


for h=1:1:length(IrrN)
Qs(h)=(IrrNsurf(h)+IrrSsurf(h)+IrrOsurf(h)+IrrEsurf(h))*Fs/1000;
end

if(FLAG_DEBUG==1)
display('Apports solaires internes')
display(Qs)
end

end