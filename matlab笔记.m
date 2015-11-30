maltab 7.0:
mbuild -setup
mex -setup
mcc -B sgl sss.m

��������ʱ��
tic;w=searchfolder('H:\���ݱ���SAC20hz','.sac');toc

%----------------------------
%----------------------------
��������
fhandle=@��arglist��express
��1��express��һ��matlab�������ʽ�����磺x+x.^2��sin��x����
��2��argilst�ǲ����б�
��3������@��matlab������������Ĳ���������ʾ��������������б�arglist�ͱ��ʽexpressȷ���ĺ�������������������������ظ�����fhandle���������Ժ�Ϳ���ͨ��fhandle�����ö���õĺ����ˡ�
f1=@(x)x*2+1;
f1(2)=5;


��array��ÿ��Ԫ�ؽ��д���arrayfun
apply function to each element of array
������������������
f=@(x)['show ',num2str(x)];
a=1:4;
arrayfun(f,a,'UniformOutput',false)
ans = 

    'show 1'    'show 2'    'show 3'    'show 4'
�����Ԫ����ʽ�洢
%----------------------
��Ԫ��Ӧ������������
f=@(name)[name,' exists'];
x={'a.txt','b.txt',  'c.txt'};
cellfun(f,x,'UniformOutput',false)
ans = 

    'a.txt exists'    'b.txt exists'    'c.txt exists'

�����Ԫ����ʽ�洢
%----------------------------
%----------------------------

x = sym('x');
>> x + x
ans =
2*x
>> x * x
ans =
x^2
>> sin(x)^2 + cos(x)^2
ans =
sin(x)^2 + cos(x)^2

%΢��
>> diff(3*x^2 + sin(x))
ans =
6*x + cos(x)
%����
>> int(6*x + cos(x))
ans =
sin(x) + 3*x^2
>> taylor(exp(x), x, 0, 'Order', 10)
ans =
x^9/362880 + x^8/40320 + x^7/5040 + x^6/720 + x^5/120 + x^4/24 + x^3/6 + x^2/2 + x + 1

>> p = matlabFunction(x^2 + 2*x + sin(x))
p =
@(x)x.*2.0+sin(x)+x.^2
>> p(0.2)
ans =
0.6387




%--------------------------
%ʮ������ת��Ϊ�ַ��໥ת��
char(65) 'A'
char(ones(1,3)+64) 'AAA'
uint32('A')   65

% ��������/�ṹ��
save filename   structname 
save  filename   variablename

% cell���·�ת
b=cell(3,5);
b=b(end:-1:1,:);
% �ϲ�cell
c=[c1,c2];or  c1=[c1; c2]

%------------------------------
freqz(b,a,8192,Fs)
% Ƶ�׺�����
[H,W]=freqz(b,a,1024);
HH=abs(H).^2;
Hff=abs(HH);
Hxx=angle(HH);
figure
subplot(2,1,2);
plot(W*Fs/(2*pi),Hxx);
xlim([0,Fs/2]);
ylabel('Phase(degrees)');
xlabel('Frequency(Hz)');
grid on;
subplot(2,1,1);
plot(W*Fs/(2*pi),20*log(Hff));
ylabel('Magnitude(dB)');
xlabel('Frequency(Hz)');
grid on;
%------------------------------

��ӱ���ͼƬ
��openingfcn�����
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
II=imread('d3w.jpg');
image(II)
colormap gray
set(ha,'handlevisibility','off','visible','off');
�ı䰴ť�ı���
I=imread('buttoncdata.bmp');
set(handles.pushbutton1,'cdata',I);

-------------------------------------------------------------
matlab��figure����ͼƬ���������

 figure('MenuBar','none');%����ʾ������
%�������
%��ǰͼ�δ���get(gcf,'outerposition')
set(gcf,'outerposition', get(0,'screensize')+[-6 40 100 -40]);
 %ȥ���˵����͹�����
%        set(0,'DefaultFigureMenu','none');
%��ʾ�������Ͳ˵���
%         set(gcf,'MenuBar','figure')
%         set(0,'DefaultFigureMenu','figure')
%         ����figureΪͼƬ��ʽ
 fig=getframe(gcf);
imwrite(fig.cdata,['.\',fdname,'\','test.png']);

Figure�����е�ͼ�ε�����jpg��ʽ��ͼƬʱ�����е��ֺŶ����󣬶�������̶�ֵ����Щ����»�ı䡣����õ�����Ļ����ʾ��ȫ��ͬ��jpgͼ�Σ����ֲ����óߴ�Ƚϴ��bmp.
����print����24λɫ��bmpʱ����Ҳ������saveas���ɵ�bmp�����󣬵�ֻ�ܱ����256ɫ���ᶪʧ��ɫ��
������ϸ˵��һ���ҵ�Ҫ������������
���������Ƶ�ͼ���õ���colorbar��������ɫ�Ƚ϶ࡣ
1.�����ͼƬ��Ҫ����ɫ������ʧ��
2.ͼƬҪС
3.��ʽ�Ƚϳ���
4.����Ҫ�ܹ�������������

����bmp,jpg,gif���ֳ�����ʽ��ͼƬ���matlab����ͼƬ�ķ�������˵����

1.saveas ������bmp��jpgͼ��
�˷����ɵ�bmpֻ��Ϊ256ɫ���ɫ��ʧ�档
jpg����Ϊ24λɫ���������������ʾ��������ʾ����Ļ��ʾ������������

2.print ������bmp��jpgͼ��
�˷����ɵ�bmp����Ϊ24λɫ������jpgһ��������������������ʾ����Ļ��ʾ�Ĳ���������bmp�ļ��Ƚϴ�

3.�˵�Edit->Copy Figure������������->����->ת��Ϊjpg��gif��ʽ

�÷���������24λɫ������Ļ��ʾЧ����ȫ��ͬ��bmp�����ɵ��������ת��Ϊjpg��gif��ʽ����ļ���С���⡣

ת�����⣺
      (1) jpg��ʽ������ѹ������ת����ͼ������������ʧ��
      (2) gif��ʽ������ѹ������ֻ֧��256ɫ����һ��ĸ�ʽת�����߽�24λɫbmpת��Ϊgif��ʽʱ�����ɫ��ʧ�棬��ͼ������colorbar������ʹ �õ�����ɫ����û�г���256�֣�������Acdsee��רҵ��ת������ת������Ч����bmp������ȫһ����Ч����jpg�õĶ࣬�����ļ�Ҳ��jpg��Ҫ С��

�����������⣺
      (1) Edit -> Copy Figure �����о��ó�Copy Figure�˵��Ļص�������
      uimenufcn(gcf,'EditCopyFigure');
���ǰ�gcbf����gcf����ʵ�ֵ����ǰfigure�˵�Edit -> Copy Figure ��ͬ�Ĺ��ܣ���ͼƬ�������������С�
      (2) �Ӽ������ȡͼƬ������Ϊbmp�����������VB����ɡ���VB�л�ȡͼƬ������Ĵ������£�
      picBitmap = ClipBoard.GetData(vbCFBitmap)
       savepicture picBitmap.picture,"test.bmp"
����picBitmapΪpicture�ؼ������������Ϊexe����matlab����system����
      (3)����û���ҵ���24λɫbmpת��Ϊgif�ĽϺõ�ģ�飬����������bmp����Acdsee����ת����

----------------------------------------------------------------
���루slength��ת������ʱ�����ַ���

rishengyu=rem(slength,86400);
ri=(slength-rishengyu)/86400;
shishengyu=rem(rishengyu,3600);
shi=(rishengyu-shishengyu)/3600;
fenshengyu=rem(shishengyu,60);
fen=(shishengyu-fenshengyu)/60;
miao=rem(fenshengyu,60);
datestr2='00000000';
datestr3='00��00:00:00';
pp=[ri+1,shi,fen,miao];
for k=1:4
if pp(k)<10    
    tempstr=['0',num2str(pp(k))];
else
    tempstr=num2str(pp(k));
end
datestr2(2*k-1:2*k)=tempstr;
datestr(3*k-2:3*k-1)=tempstr;
end
set(handles.edit2,'string',datestr2);
----------------------------------------------------------------


nargin :�����������ܸ���
varargin�� ���� ��ѡ�������ܸ���

��x=a��y=b��ֱ��
ˮƽ�ߣ�plot([xmin,xmax],[a,a]);
���ߣ�  plot([b,b],[ymin,ymax]);
xmin,xmax,ymin,ymax �ֱ���ˮƽ�ߺʹ��ߵ������յ㡣

��ֻ����0,1�ľ���ÿ��ת��Ϊʮ����
  N = size(Qbinnum,2);
   k = ((N-1):-1:0)';
   v = 2.^k;
   cgroup = Qbinnum*v;
����
bin2dec(int2str(Qbinnum��1������))


rem(x,y);ȡ����x/y
�Ѿ����Ϊ����
A=A(��)
all��A��dim���ж�ÿ�л�ÿ���Ƿ��Ƿ�0��
all��A>1)

ͳ�ƾ�����Ԫ�س��ִ���
grp2idx()
length(a(a==2))
����
length(find(a==2))
 [p,q]=hist(a,unique(a));
�õ��Ľ��qΪ��Ӧ��������Ӧ��pΪq��a�г��ֵĴ���
a=[11 2 33 45 2];
[p,q]=hist(a,unique(a));
p =

     2     1     1     1
q =

     2    11    33    45

��Բ
rectangle('position',[1,1,5,5],'curvature',[1,1],'edgecolor','r','facecolor','g');
'position',[1,1,5,5]��ʾ�ӣ�1,1���㿪ʼ��Ϊ5����Ϊ5��
'curvature',[1,1]��ʾx,y�����ϵ����ʶ�Ϊ1������Բ����
'edgecolor','r'��ʾ�߿���ɫ�Ǻ�ɫ��
'facecolor','g'��ʾ���������ɫΪ��ɫ��
%���figure����
        set(gcf,'outerposition', get(0,'screensize'));

 %ȥ���˵����͹�����
        set(0,'DefaultFigureMenu','none');
or
figure('MenuBar','figure')
figure('MenuBar','none')
%��ʾ�������Ͳ˵���
% set(0,'DefaultFigureMenu','figure')

��������ת����
datenum(0,0,1,0,0,0)=1  %���ص�λ���죬��ʼʱ���� 0
datevec(addtodate(datenum(1601,1,1,0,0,0),fg2*1e-7,'second'))
%����ӵ�������
 addtime = int64((datenum(datewritevec)-datenum(1601,1,1,0,0,0))*24*3600)*1e7;
дbinx��ʽ�ļ�
%open file
    fod = fopen(path_file,'wb','l');% 'l' represents little_endian ordering
    %write station Name
    fwrite(fod,stationName,'*char');  
    fwrite(fod,zeros(32-length(stationName),1),'*char');   %write null to binx
    %write channel name
    fwrite(fod,chnName,'*char');    %write null to binx
    fwrite(fod,zeros(8-length(chnName),1),'*char'); 
    %write sample fs
    fwrite(fod,[1,1],'*uint');   % write sample fs: numerator/denominator,this is 1/1Hz
    %write filetime
    fwrite(fod,addtime,'*int64');     %write filetime
    %write date type
    fwrite(fod,'I32','*char');  %write data type
    fwrite(fod,[0,0,0,0,0],'*char');
    %write reservered info
    fwrite(fod,zeros(960,1),'*char');
    %write data
    fwrite(fod,data,'int32'); %write data
    %close file
    fclose(fod);      %close file

guidata(hObject, handles);% Update handles structure


��תxy��
set(gca,'view',[90 -90])
���ÿ̶�����ʾ
����db��ʾ
 set(gca,'yticklabel',20.*log10(get(gca,'ytick')))
set(gca,'xticklabel',sprintf('.4f|',get(gca,'xtick')));%style 3
set(gca,'xtick',[min(x) (max(x)+min(x))/2 max(x)]);
set(gca,'XMinorTick','off');
set(gca,'XGrid','on');

set(gca,'XMinorGrid','off');

%˳�㸽�Ͽ��Ը�ʽ������̶ȵĳ����
x=get(gca,'xlim');

y=get(gca,'ylim');

set(gca,'xtick',[x(1) (x(1)+x(2))/2 x(2)]);

set(gca,'ytick',[y(1) (y(1)+y(2))/2 y(2)]);

��������������������������

get(gca,'xlim');�ǻ�ȡ�����С�̶ȵ�

�����Ҫ��ȡ����������������ʾ�Ŀ̶ȣ���Ҫʹ��
get(gca,'ytick')
set(gca,'xticklabel',strsplit(num2str(10:14),' '))%{'10'    '11'    '12'    '13'    '14'}
�����������֣����õͰ汾Matlab��
xlabel_start=1;
xlabel_end=31;
xlabel_len=xlabel_end-xlabel_start+1;
for xb=1:xlabel_len  %xlabel_start:xlabel_end
    xtlabel{xb,1}=num2str(xlabel_start+xb-1);
end
set(h(k),'xticklabel', xtlabel);

-----------
�����S�е����ֵ�� max(max(S))
��ͣ0.5�� pause��0.5��
---------------------------------------
ָ��λ����ʾͼ��
plot(30,30,'r.','markersize',5)

axis xy������ͨ�������ʽ��
axis ij����imageϵ�е������ʽ

����ת
flipud(a) �������·�ת 
fliplr(a) �������ҷ�ת
rot90(a)������ʱ����ת90��
B = flipdim(A,dim) returns A with dimension dim flipped.

����colorbar ��Χ caxis([0,1])


�Ծ���Aÿһ�й�һ����A./repmat(max(A),size(A,1),1);
 �Ծ���Aÿһ�й�һ����A./repmat(max(A,[],2),1,size(A,2));
 ����Ҫע������ȫ���л���ȫ���У�����л���NAN
������������
(a- repmat(min(a),size(a,1),1))./(repmat(max(a)-min(a),size(a,1),1))

������Ȼ������
n=5;
A=1��n��
B=1./(1:n);

�ַ���str�ָ�
counter = 1;
for index = 1 : 8 : length(str)
	lastIndex = min(index+7, length(str));
	ca{counter} = str(index:lastIndex);
	counter = counter + 1;
end
celldisp(ca)

 fid = fopen('examp02_03.txt','wt');    % ��д�뷽ʽ���ļ��������ļ���ʶ��
% �Ѿ���x��ָ����ʽд���ļ�examp02_03.txt
fprintf(fid,'%.4f\n',xxx);
fclose(fid);    % �ر��ļ�

  for i=2:10
 disp(['d',num2str(i),'=get(handles.checkbox',num2str(i+3),',''value'');'])
end


help wfilters
wavemngr('read',1)

wavebox={'haar', 'dmey',...
    'db1','db2','db3','db4','db5','db6','db7','db8','db9','db10',...
    'db11','db12','db13','db14','db15','db16','db17','db18','db19','db20','db21',...
    'db22','db23','db24','db25','db26','db27','db28','db29',...
    'db30','db31','db32','db33','db34','db35','db36','db37','db38','db39',...
    'db40','db41','db42','db43','db44','db45',...
   'sym2','sym3','sym4','sym5','sym6','sym7','sym8','sym9','sym10',...
    'sym11','sym12','sym13','sym14','sym15','sym16','sym17','sym18','sym19','sym20',
    'sym21','sym22','sym23','sym24','sym25','sym26','sym27','sym28','sym29',...
    'sym30','sym31','sym32','sym33','sym34','sym35','sym36','sym37','sym38','sym39',...
    'sym40','sym41','sym42','sym43','sym44','sym45',...
    'coif1','coif2','coif3','coif4','coif5',...
    'bior1.1','bior1.3','bior1.5','bior2.2','bior2.4','bior2.6','bior2.8',...
    'bior3.1','bior3.3','bior3.5','bior3.7','bior3.9','bior4.4','bior5.5','bior6.8',...
    'rbio1.1','rbio1.3','rbio1.5','rbio2.2','rbio2.4','rbio2.6','rbio2.8','rbio3.1',...
    'rbio3.3','rbio3.5','rbio3.7','rbio3.9','rbio4.4','rbio5.5','rbio6.8',...
    };

for i=1:length(wavebox)
disp(wavebox{i})
end

haar
db1
db2
db3
db4
db5
db6
db7
db8
db9
db10
sym2
sym3
sym4
sym5
sym6
sym7
sym8
coif1
coif2
coif3
coif4
coif5
bior1.1
bior1.3
bior1.5
bior2.2
bior2.4
bior2.6
bior2.8
bior3.1
bior3.3
bior3.5
bior3.7
bior3.9
bior4.4
bior5.5
bior6.8
rbio1.1
rbio1.3
rbio1.5
rbio2.2
rbio2.4
rbio2.6
rbio2.8
rbio3.1
rbio3.3
rbio3.5
rbio3.7
rbio3.9
rbio4.4
rbio5.5
rbio6.8
meyr
dmey
gaus1
gaus2
gaus3
gaus4
gaus5
gaus6
gaus7
gaus8
mexh
morl
cgau1
cgau2
cgau3
cgau4
cgau5
shan1-1.5
shan1-1
shan1-0.5
shan1-0.1
shan2-3
fbsp1-1-1.5
fbsp1-1-1
fbsp1-1-0.5
fbsp2-1-1
fbsp2-1-0.5
fbsp2-1-0.1
cmor1-1.5
cmor1-1
cmor1-0.5
cmor1-0.1