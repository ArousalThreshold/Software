dades = [firstg secondg thirdg fourthg];  
arxiu = [fullfile(path,file) varname '.csv'];
fid  = fopen(arxiu,'wt');
for hh=1:size(dades,1)
 for jj=1:size(dades,2)-1
     fprintf(fid,'%s,',num2str(dades(hh,jj)));
 end
 fprintf(fid,'%s\n',num2str(dades(hh,end)));
end
fclose(fid);