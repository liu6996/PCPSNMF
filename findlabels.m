function indices=findlabels(per,labels,Class)
%input:
%    per:the number of every class
%    labels:the label of the data
%    Class: the number of the Class
%output: the index of the data we select
indices=[];
for i=1:Class
    ind=find(labels==i);%�Ĺ���ȥ��-1
    L=length(ind);
    p=randperm(L);
    indices=[indices;ind(p(1:per))];
end
    

