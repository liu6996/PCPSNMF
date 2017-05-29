function [ConfuMatrix,CorrectRate,Kappa]=ClassifiEvaluate(MatrixClassTable,Class)
%������������ConfuMatrix�����徫��CorrectRate��Kappaϵ��
%MatrixClassTableΪ�еľ��󣬵�һ��ΪĿ����𣬵ڶ���Ϊ����������
%�����ΪClass
%����������������ұ���ң��ԭ��
%���徫��CorrectRate��Kappaϵ�������������¡�Status of land cover classification accuracy assessment ��
%Remote Sensing of Environment,2002,80:185-201
MatrixClassTable=double(MatrixClassTable);
ClassNum=Class;
ConfuMatrix=zeros(ClassNum,ClassNum);
CorrectRate=0;
Kappa=0;
%��������ÿ�еĺ�
RowSum=zeros(ClassNum,1);
%��������ÿ�еĺ�
ColSum=zeros(1,ClassNum);
[Row,Col]=size(MatrixClassTable);
%�����������
for i=1:Row
    ConfuMatrix(MatrixClassTable(i,1),MatrixClassTable(i,2))=ConfuMatrix(MatrixClassTable(i,1),MatrixClassTable(i,2))+1;
end
%�������徫��CorrectRate
%����Kappaϵ��
for i=1:ClassNum
    for j=1:ClassNum
         RowSum(i,1)=RowSum(i,1)+ConfuMatrix(i,j);
         ColSum(1,j)=ColSum(1,j)+ConfuMatrix(i,j);
    end
end
temp1=0;
temp2=0;
for i=1:ClassNum
    temp1=temp1+ConfuMatrix(i,i);
    temp2=temp2+RowSum(i,1)*ColSum(1,i);
end
CorrectRate=temp1/Row;
Kappa=(Row*temp1-temp2)/(Row*Row-temp2);