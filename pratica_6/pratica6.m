# 1 - Carregando pacote
pkg load image;                         

# 2 - Carregar imagem de entrada
imagemEnmtrada = imread('pratica6.png');  

# 3 - Converter para double
imagemEnmtrada = im2double(imagemEnmtrada);    
 
# 4 - zero padding e fft2
[M, N] = size(imagemEnmtrada);
P = 2*M;
Q = 2*N;
imagemTransformada = fft2(imagemEnmtrada, P, Q); 

# 5 - usando fftshift 
imagemTransformada = fftshift(imagemTransformada); 

# 6 - Mostrar o spectro de Fourier
#figure, imshow(uint8(abs(imagemTransformada)));

# 7 - Funcoes da transformada
# 7.1 - Distancia euclidiana
function outeuc = distEuclidian(p, q, u, v)
  outeuc = (((u - p/2) ^ 2) + ((v - q/2) ^ 2)) ^ (0.5);
endfunction

# 7.2 - Passa baixa
function res = PassaBaixa(imagem, P, Q)   # 7
  
  Dist0 = 20;
  h = zeros(P, Q);

  for u=1 : P
    for v=1 : Q
      Distuv = distEuclidian( P, Q, u, v);
      h(u, v) = e ^ (-(Distuv ^ 2) / (2 * (Dist0 ^ 2)));
    end
  end
  res = h;
endfunction

filtro = PassaBaixa(imagemTransformada, P, Q);
#figure, imshow(filtro);

# 8 - Multiplique a matriz transformada pelo filtro passa baixa
imagemFiltro = imagemTransformada .* filtro;   

# 9 - usando iffshift para descentralizar o resultado do passo 8
imagemFiltro = ifftshift(imagemFiltro); 

# 10 - Usando fshift2 no resultado do passo 9 
imagemFiltro = ifft2(imagemFiltro);                

# 11 - Usando real para selecionar a parte real do resultado do passo 10 
imagemFiltro = real(imagemFiltro);                  

# 12 - Extraindo a região M x N do passo resultado do 11.
imagemSaida = zeros(M, N);
imagemSaida = imagemFiltro(1:M, 1:N);

# 13 - Mostrando resultdo final
figure, imshow(im2uint8(imagemSaida));