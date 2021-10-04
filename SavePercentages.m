fid=fopen([fullfile(path,file) '.csv'],'wt');
for jj=1:length(monitorheader)-1
      fprintf(fid,'Monitor %s,',num2str(monitorheader(jj)));
end
fprintf(fid,'Monitor %s\n',num2str(monitorheader(end)));
fprintf(fid,'%s,',genotypes{1,1:end-1});
fprintf(fid,'%s\n',genotypes{1,end});

for jj=1:length(animalsv)-1
      fprintf(fid,'Flies %s,',num2str(animalsv(jj)));
end
fprintf(fid,'Flies %s\n',num2str(animalsv(end)));
    
if var ==0 
    for hh=1:size(pmonitorsnorm,1)
      for jj=1:size(pmonitorsnorm,2)-1
          fprintf(fid,'%s,',num2str(pmonitorsnorm(hh,jj)));
      end
      fprintf(fid,'%s\n',num2str(pmonitorsnorm(hh,end)));
    end
else
    for hh=1:size(PNormAlongTheNight,1)
      for jj=1:size(PNormAlongTheNight,2)-1
          fprintf(fid,'%s,',num2str(PNormAlongTheNight(hh,jj)));
      end
      fprintf(fid,'%s\n',num2str(PNormAlongTheNight(hh,end)));
    end 
end

fclose(fid);
