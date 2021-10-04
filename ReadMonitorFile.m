fid    = fopen([path 'Monitor' num2str(monitorfile(ww)) '.txt'], 'r'); 
line   = fgetl(fid);
ii     = 1;
while ischar(line)
    data    = textscan(line,'%s','Delimiter','\t');
    raw{ii} = data; 
    date    = textscan(data{1}{2},'%s','Delimiter',' ');
    timem   = textscan(data{1}{3},'%s','Delimiter',':');
    daym    = str2num(date{1}{1});
    monthm  = date{1}{2};
    if strcmp(monthm,'Jan')
        monthm  = 1;
    elseif strcmp(monthm,'Feb')
        monthm  = 2; 
    elseif strcmp(monthm,'Mar')
        monthm  = 3; 
    elseif strcmp(monthm,'Apr')
        monthm  = 4; 
    elseif strcmp(monthm,'May')
        monthm  = 5; 
    elseif strcmp(monthm,'Jun')
        monthm  = 6; 
    elseif strcmp(monthm,'Jul')
        monthm  = 7; 
    elseif strcmp(monthm,'Aug')
        monthm  = 8; 
    elseif strcmp(monthm,'Sep')
        monthm  = 9;
    elseif strcmp(monthm,'Oct')
        monthm  = 10; 
    elseif strcmp(monthm,'Nov')
        monthm  = 11;             
    else
        monthm  = 12;               
    end
    yearm  = str2num(['20' date{1}{3}]);
    hourm  = str2num(timem{1}{1});
    minm   = str2num(timem{1}{2});
    secm   = str2num(timem{1}{3}); 
    indicesm(ii) = datenum(yearm,monthm,daym,hourm,minm,secm);
    line       = fgetl(fid);
    ii         = ii+1;
end
fclose(fid);