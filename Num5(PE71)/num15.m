fid = fopen('name.txt','rt');
s = char(fread(fid))';
fclose(fid);
s = strrep(s,'"','');
inx = [0 find(s==',') length(s)+1];
c = cell(length(inx)-1,1);
for i=1:length(inx)-1
    c{i} = s(inx(i)+1 : inx(i+1)-1);
end
c = sortrows(c);
r = cellfun(@(s)sum(s-'A'+1),c).*(1:length(c))';
sum(r)