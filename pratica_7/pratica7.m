# 1 - Carregando o pacote
pkg load image;

# 2 - Carregar imagem de entrada 808 x 754
imagemEntrada = imread('pratica7.png');

# 3 - Converter para double
imagemEntrada = im2double(imagemEntrada);

# 4 - Zero Padding e aplicando fft2
[M, N] = size(imagemEntrada);
P = 2*M;
Q = 2*N;
imagemTransformada = fft2(imagemEntrada, P, Q);

# 5 - Centralizar a transformada de Fourier
imagemTransformada = fftshift(imagemTransformada);

# 6 - Espectro de Fourier com uint8 e abs
imagemEspectro = uint8(abs(imagemTransformada));
figure = imagemEspectro;
imwrite(imagemEspectro, "espectro.png");

# 7 - Filtro proposto
function out = passaBaixa(P, Q)
  h = ones(P, Q);
  min = (Q * 0.5) - 15;
  max = (Q * 0.5) + 15;
  h(1 : (Q + 100), min : max) = 0;
  min1 = (P * 0.5) - 70;
  max1 = (P * 0.5) + 70;
  h(min1:max1, min:max) = 1;
  out = h;
endfunction

filtro = passaBaixa(P, Q);
imwrite(filtro, "filtro.png");
figure = filtro;
figure = (filtro .* imagemEspectro);

# 8 - Multiplicar a matriz da transformada pelo filtro
imagemFiltro = imagemTransformada .* filtro;

# 9 - Aplicando a funcao ifftshift
imagemFiltro = ifftshift(imagemFiltro);

# 10 - Aplicando  a transformada com ifft2 
imagemFiltro = ifft2(imagemFiltro);

# 11 - Selecionando apenas a parte real 
imagemFiltro = real(imagemFiltro);

# 12 - Extrair a regiao M x N
imagemSaida = zeros(M, N);

# 13 - Salvar a imagem do resultado final
imagemSaida = imagemFiltro(1:M, 1:N);
figure = (im2uint8(imagemSaida));
imwrite(figure, "resultado.png");

#figure, imshow(imagemEntrada);
