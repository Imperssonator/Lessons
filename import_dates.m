function DT = import_dates(filename)

fid = fopen(filename, 'rt');
a = textscan(fid, '%f %s', ...
'Delimiter',',', 'CollectOutput',1, 'HeaderLines',1);
fclose(fid);

date_strings = a{2};

dvy = cellfun(@(x) str2num(x(1:4)),date_strings);
dvm = cellfun(@(x) str2num(x(6:7)),date_strings);
dvd = cellfun(@(x) str2num(x(9:10)),date_strings);

DV = [dvy, dvm, dvd];

DT = datenum(DV);

end