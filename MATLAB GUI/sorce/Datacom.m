[y,Fs] = audioread('stereo-88k-24b.flac')
[y,Fs] = audioread(MAGNIFICAT_16bits_96kHz,samples)

info = audioinfo(MAGNIFICAT_16bits_96kHz)

player = audioplayer(y(:,2:3),22050,8)