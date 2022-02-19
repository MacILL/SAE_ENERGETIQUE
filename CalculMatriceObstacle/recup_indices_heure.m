function [indices_heure]=recup_indices_heure(chem, ind_jour)
[Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem, ind_jour);
 [indices_heure]=decoupage_bloc_heure(minutes_conforme);
end