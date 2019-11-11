clear,close;
%聲音訊號時域--------------------------------
fs=44100;%取樣頻率
T=1/fs;%取樣週期
fileName='test.wav';
[m_t, fs]=audioread(fileName);
time = 1/fs:1/fs:length(m_t)/fs; %取樣週期0.5s
ta = 0:0.001:0.5;
m_t=m_t(:,1);%單聲道
N=length(m_t);
%顯示聲音相關信息-------------------------------------
fprintf('音訊檔案 "%s" 的資訊: \n',fileName);
fprintf('音訊長度= "%g"秒: \n',N/fs);
fprintf('取樣頻率= "%g" 取樣點/秒: \n',fs);
fprintf('取樣週期= "%g" s: \n',T);
subplot(3,2,1),plot(time,m_t);title('聲音信號時域');xlabel('t');ylabel('m(t)');
%聲音訊號頻域-------------------------------
fm_t=fftshift(fft(m_t));
subplot(3,2,2),plot(abs(fm_t));title('聲音信號頻域');xlabel('頻率f (Hz)');ylabel('Amplitude');
%載波訊號時域-------------------------------
fc=22000;
t=time;
c_t=cos(2*pi*fc*t);
subplot(3,2,3);
plot(c_t);axis([0 300 -2 2]);title('載波時域');xlabel('t');ylabel('c(t)');
%載波訊號頻域--------------------------------
fc_t = fftshift(fft(c_t));
subplot(3,2,4),plot(abs(fc_t));title('載波頻域');xlabel('頻率f (Hz)');ylabel('Amplitude');
%FM調變訊號時域-------------------------------
m_t = m_t';
s_t = cos(2*pi*fc*t + 2*pi*2000*(cumsum(m_t)/fs));
subplot(3,2,5);plot(t,s_t);axis([0 300 -2 2]);title('調變後時域');xlabel('t');ylabel('s(t)');
%FM調變訊號頻域-------------------------------
fs_t = fftshift(fft(s_t));
subplot(3,2,6);plot(abs(fs_t));title('調變後頻域');xlabel('頻率f (Hz)');ylabel('Amplitude');

