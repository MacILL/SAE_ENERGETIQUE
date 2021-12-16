%test concaténation

[SBat1, TBat1]=Batiment(1, 3, 5, [0 0 0])
[SBat2, TBat2]=Batiment(1, 2, 5, [5 5 0]);
SSol1=[0 0 0];
SSol2=[0 1 0];
SSol3=[1 0 0];
SSol4=[1 1 0];
SSol=[SSol1;
    SSol2;
    SSol3;
    SSol4
    ];

TSol=[1 2 3;
    2 4 3];
[T, S]=Construction_scene(SBat1, TBat1 ,SBat2, TBat2, SSol, TSol, 1, 2)