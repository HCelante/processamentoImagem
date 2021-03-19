pkg load image

# 0 - carregando a imagem
imagem = imread("pratica5.png");

# 1,2 - funcao para gerar ruido
function saida = ruidonvezes (n, imagem,name)
  resultado = zeros(256,384);
  for i = 1:n
    newzero = zeros(256,384);
    newzero = imnoise(imagem, "gaussian", 0 , 0.25);
    newzero = newzero*(1/n);
    resultado += newzero;
  endfor
  imwrite(resultado, name)
  saida = resultado;
endfunction


# imagens
imagem8 = ruidonvezes(8,imagem,'8.png');
imagem16 = ruidonvezes(16,imagem,'16.png');
imagem64 = ruidonvezes(64,imagem,'64.png'); 
# Com a diferenca de quantidade de amostras que entram na media
# aritmetica, as imagens com maior numero de amostras tem mais chance de
# ter uma imagem menos ruidosa

