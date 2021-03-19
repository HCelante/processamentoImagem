pkg load image

#1 e 2 - Carrengando a imagem como double
Img1 = im2double(imread('pratica4.jpg'));
#imhist(Img1)

#3 e 4 - Criacao do filtro de media
filtro = ones(9, 9, 'double')/81;

#5 - Aplicando o filtro
Img2 = im2double(filter2(filtro, Img1, 'same'));
#imshow(Img2);
# ficou com a borda preta e as letras foscas

#6 - Filtro da Media
Img2 = padarray(Img1, [4 4], 'replicate');

#7 
Img2 = filter2(filtro, Img1, 'valid');
#figure, imshow(Img2);
# perdeu a borda preta

#8 - Filtros de Sobel
fs1 = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
fs2 = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

#9 - Padding e filtro Sobel
iSR = zeros(306, 306, 'double');
iSR = padarray(iSR, [1 1], 'replicate');

iS1 = filter2(fs1, Img1, 'valid');
#imshow(iS1)

iS2 = filter2(fs2, Img1, 'valid');
#imshow(iS2)


# 10 
iSR = abs(iS1) + abs(iS2);
#imhist(iSR);
figure, imshow(iSR);
imwrite(iSR,'jpgsaida.jpg');