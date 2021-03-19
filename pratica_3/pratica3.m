pkg load image;

##1 - carregando a imagem
img1 = imread('imagem.jpg');

# Nota -  pega os valores dos pontos do histograma
#imhist(img1);

[histg, out] = imhist(img1);    

#2 - Matriz auxiliar
aux = zeros(1, 256);

#3 - Matrix de zeros para a imagem corrigida
img2 = zeros(679, 800, 'uint8');

#4 - Normalizacao do histograma
histg = histg/(800*679);


for k=1:256
  count = 0;
  for j=1:k
    count = count+histg(j);
  endfor
  aux(k) = uint8(round(255*count));
endfor

#5 - Aplicando os valores
for i = 1:679
  for j = 1:800
    img2(i, j) = aux(1,img1(i, j)+1);
  endfor
endfor

#6 - Exibindo a saida 
imshow(img2);

#7 - Plot do histograma

figure,plot(out,aux);
title("Histograma Equalizado");

#8 - Salva a imagem no disco 
imwrite(img2,'jpgsaida.jpg');
