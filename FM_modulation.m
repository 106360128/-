clear,close;
%�n���T���ɰ�--------------------------------
fs=44100;%�����W�v
T=1/fs;%���˶g��
fileName='test.wav';
[m_t, fs]=audioread(fileName);
time = 1/fs:1/fs:length(m_t)/fs; %���˶g��0.5s
ta = 0:0.001:0.5;
m_t=m_t(:,1);%���n�D
N=length(m_t);
%����n�������H��-------------------------------------
fprintf('���T�ɮ� "%s" ����T: \n',fileName);
fprintf('���T����= "%g"��: \n',N/fs);
fprintf('�����W�v= "%g" �����I/��: \n',fs);
fprintf('���˶g��= "%g" s: \n',T);
subplot(3,2,1),plot(time,m_t);title('�n���H���ɰ�');xlabel('t');ylabel('m(t)');
%�n���T���W��-------------------------------
fm_t=fftshift(fft(m_t));
subplot(3,2,2),plot(abs(fm_t));title('�n���H���W��');xlabel('�W�vf (Hz)');ylabel('Amplitude');
%���i�T���ɰ�-------------------------------
fc=22000;
t=time;
c_t=cos(2*pi*fc*t);
subplot(3,2,3);
plot(c_t);axis([0 300 -2 2]);title('���i�ɰ�');xlabel('t');ylabel('c(t)');
%���i�T���W��--------------------------------
fc_t = fftshift(fft(c_t));
subplot(3,2,4),plot(abs(fc_t));title('���i�W��');xlabel('�W�vf (Hz)');ylabel('Amplitude');
%FM���ܰT���ɰ�-------------------------------
m_t = m_t';
s_t = cos(2*pi*fc*t + 2*pi*2000*(cumsum(m_t)/fs));
subplot(3,2,5);plot(t,s_t);axis([0 300 -2 2]);title('���ܫ�ɰ�');xlabel('t');ylabel('s(t)');
%FM���ܰT���W��-------------------------------
fs_t = fftshift(fft(s_t));
subplot(3,2,6);plot(abs(fs_t));title('���ܫ��W��');xlabel('�W�vf (Hz)');ylabel('Amplitude');

