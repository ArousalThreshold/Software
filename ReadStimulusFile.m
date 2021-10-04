[file,path,filterIndex] = uigetfile('../*.txt','Select stimuli file to read');
OriginalPath = path;
if isequal(file,0) || isequal(path,0)
else
    filestimuli = file;
    disp(['INFO: Stimuli file analyzed::' path file]);      
    fid    = fopen([path file], 'r');
    line   = fgetl(fid);
    ii=1;
    while ischar(line)
        data    = textscan(line,'%s','Delimiter',' ');
        date    = textscan(data{1}{1},'%s','Delimiter','/');
        months  = str2num(date{1}{1});
        days    = str2num(date{1}{2});
        years   = str2num(date{1}{3});
                 
        times   = textscan(data{1}{2},'%s','Delimiter',':');        
        hours   = str2num(times{1}{1});
        hours   = hours + offseth;
        mins    = str2num(times{1}{2}) + offsetmin;
        secs    = str2num(times{1}{3});
        
        if strcmp(DAMtiming,'30sec')  
            if secs < 30
                indicess(ii)     = datenum(years,months,days,hours,mins,0);
            elseif secs > 30
                indicess(ii)     = datenum(years,months,days,hours,mins,30);            
            else
                indicess(ii)     = datenum(years,months,days,hours,mins,secs);
            end
        elseif strcmp(DAMtiming,'1min')
            indicess(ii)     = datenum(years,months,days,hours,mins,0);         
        else
        end
        line         = fgetl(fid);
        ii=ii+1;
    end
    fclose(fid);
end