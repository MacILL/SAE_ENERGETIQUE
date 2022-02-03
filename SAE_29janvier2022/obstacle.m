function [matObstacle]=obstacle(Tbat, Sbat,TObstacle,SObstacle, position_soleil)
%fonction qui renvoit une matrice indiquant si les triangles du bâtiment
%sont éclairés par le soleil ou bien s'il y a une obstacle entre le
%triangle et le soleil
display('size Tbat')
display(size(Tbat,1) )

    
%matObstacle=zeros(size(Tbat,1), size(position_soleil,2));
matObstacle=[];
    for ind_triangle=1:1:size(Tbat,1)
        VectObstacle=[]
         IND=Tbat(ind_triangle,:);
         % pour un triangle fixÃ©
        %[S1 S2 S3]=eclate_triangle(T,i);
        S1=Sbat(IND(1),:);
        S2=Sbat(IND(2),:);
        S3=Sbat(IND(3),:);

        G=Centre_de_gravite(S1,S2,S3);
            for i=1:1:size(position_soleil,1)
                [test, ~] = Calcul_Intersection_Objet(TObstacle,SObstacle,position_soleil(i,:),G);
                VectObstacle(i)=test;
            end
           matObstacle=[matObstacle; VectObstacle];

    end
end

