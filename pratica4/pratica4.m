pkg load image

# (1,2) carrengando a imagem e convertendo para double
imagemEntrada = im2double(imread('pratica4.jpg'));

# (3) monte um filtro de m�dia com tamanho 9x9
filtro = zeros(9, 9, 'double');

for i=1:9
   for j=1:9
     filtro(i, j) = 1/81;
   endfor
endfor

# (4) Use a fun��o filter2(b,x, shape) como forma para aplicar o ?ltro de m�dia do passo 3 
#     na imagem no formato double obtida no passo 2. Essa fun��o ir� fazer a correla��o do
#     ?ltro sobre a imagem. Nesse passo use o valor padr�o para o par�metro shape. 

imagemSaida = im2double(filter2(filtro, imagemEntrada, 'same'));

 # (5) Exiba a imagem resultante do passo 4 e observe a borda da imagem. O que aconteceu?
 # (R) 
imshow(imagemSaida);