pkg load image;

##1 - carregando a imagem
img1 = imread('pollen.jpg');

##2 - gerar matrix de zeros
img2 = zeros(889, 889, 'uint8');

# Nota -  pega os valores dos pontos
imhist(img1);


##3 - Pontos
# 3.1  - primeiro
i1 = 0;
i2 = 0;

# 3.2 - segundo
r1 = 90;
s1 = 30;

# 3.3 - terceiro
r2 = 150;
s2 = 220;

# 3.4 - ultimo
f1 = 256;
f2 = 256;

# Nota : valores de preto proximos de 90 -> quanto menor os valores para r1, s2 em y, mais preto o resultado. O inverso para o branco.

##4 - Matriz de zeros para carregar os valores de entrada e saida 
v = zeros(1, 256);

##5 Coeficientes da reta.
# 5.1 - Reta 1.
m = (s1-i2)/(r1-i1);
for i = i1+1:r1
  v(i) = i2 + m * (i - i1);
endfor

# 5.2 - Reta 2. 
m = (s2-s1)/(r2-r1);
for i = r1+1:r2
  v(i) = s1 + m * (i - r1);
endfor

# 5.3 - Reta 3.
m = (f2-s2)/(f1-r2);
for i = r2+1:f1
  v(i) = s2 + m * (i - r2);
endfor

##6 - Vetor de 1 a 256 para geracao do grafico.
vetor = [1:256];
##7 - Geracao do grafico de correcao.
plot (vetor, v);

##8 - Aplicando os resultados na imagem original.
for i = 1:889
  for j = 1:889
    img2(i, j) = v(img1(i, j));
  endfor
endfor

#imshow(img2);
imhist(img2);
imwrite(img2, 'saida.jpg');
