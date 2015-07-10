function lvbo2
%��ĳ���ļ����µ�����binx�ļ���С���任���˲���������Ϊbinx
%input: 
%-Wave_Name   С����
%-Level_Anal      �ֲ���
%-Timelength  С���任�����ݳ��ȣ�һ��
clear all
%function xiaoboTransform
%[filename, pathname] = uigetfile('H:\*.binx', 'Pick files','MultiSelect', 'on');
%�����ļ����������ļ�
pathname0=uigetdir('h:\');
dir2=dir(pathname0);
for k=3:length(dir2)
   fold3{k-2,1}=[pathname0,'\',dir2(k).name]; 
end

for n=1:length(fold3)
    pathname=fold3{n};
    if pathname(end)~='\'
        pathname=[pathname,'\'];
    end
    dirs=dir([pathname,'*binx']);
    nf=length(dirs);
    filename=cell(nf,1);count=1;
    for i=1:nf
        if~dirs(i).isdir
            %�����ļ�������names���cell�У�names{n,1}
            filename{count,1}=fullfile(pathname,dirs(i).name);
            count=count+1;
        end
    end
    %��binx�ļ�
    %��������С���任����������ֲ�����
    %�������ݱ���Ϊbinx
    Wavelet_Name='db6';%'db6';
    Level_Anal=6;
    for i = 1:length(filename)
        file=filename{i};
    %----- --------- - --- -- ---
        fid = fopen(file,'rb','l');
        while ~feof(fid)  
            fg = fread(fid,40,'*char');%station name,char[32] &&channel name,char[8]
            fg1 = fread(fid,2,'*uint');%sample numerator[4]&& sample denominator[4]
            fg2 = fread(fid,1,'int64');%filetime begin time,int64[8]
            fg3 = fread(fid,8,'*char');% data type ,char[8]
            freserved = fread(fid,960,'*char');%reserved char[960]
            Signal_Anal = fread(fid,'*int32');%data int32
        end
        fclose(fid);
        slength=length(Signal_Anal);
%         outA=zeros(slength,Level_Anal);% approximate part
        outD=zeros(slength,1);% detail part
        [coefs,longs] = wavedec(double(Signal_Anal),Level_Anal,Wavelet_Name);
        for Level_i=1:Level_Anal
            outD = wrcoef('d',coefs,longs,Wavelet_Name,Level_i);
            savefilename_part2=[file(1:end-5),'_',Wavelet_Name,'_d',num2str(Level_i),'.binx'];
            fod = fopen(savefilename_part2,'wb','l');% 'l' represents little_endian ordering
            fwrite(fod,fg,'*char');  
            fwrite(fod,fg1,'*uint');   % write sample fs: numerator/denominator
            fwrite(fod,fg2,'*int64');     %write filetime
            fwrite(fod,fg3,'*char');  %write data type
            reserved = [Wavelet_Name,'Level',num2str(Level_i),'d',num2str(Level_i)];
            fwrite(fod,reserved,'*char');  
            fwrite(fod,zeros(960-length(reserved),1),'*char');
            fwrite(fod,int32(outD),'*int32'); %write data
            fclose(fod);      %close file
        end
        disp(savefilename_part2);
    end
end
% matlabpool close
%-- - -- -- --- ----- -- ------------  -- 
disp('transformed done');
