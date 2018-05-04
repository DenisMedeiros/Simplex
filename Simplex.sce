// Simplex 
// Autor: Denis Medeiros

// Ignora divisão por zero e trata como infinito.
ieee(2);


// Tabela inicial

// z x1 -x2 ... b
// 0 x1 x2 

//M = [
//1 -12 -15 0 0 0 0 0;
//0 1 0 1 0 0 0 3;
//0 0 1 0 1 0 0 4;
//0 1 1 0 0 1 0 6;
//0 1 3 0 0 0 1 13;
//];

M = [
1 -807 -909 0 100 0 100 0 -3500;
0 -1 1 1 0 0 0 0 2;
0 3 5 0 -1 1 0 0 15;
0 5 4 0 0 0 -1 1 20;
];

// Define a base inicial e com as variáveis artificiais.
base = [5, 6, 7, 8];

[l,c] = size(M);

passo = 0;
printf('\nTabela Inicial');
disp(M);

while (find(M(1,:) < 0))
        
    // Encontra  variável a entrar na base.
    [mz, kz] = min(M(1,1:c-1))
    
    passo = passo + 1;
    
    // Verifica se ela já fez parte da base.
    if(find(base == kz)) then
        printf('\nPasso %d', passo);
        disp(M);
        break;
    end
    
    base = [base, kz];
    
    // Calcula o valor q.
    q = M(2:l,c) ./ M(2:l,kz)
    
    // Remove os qs negativos (faz com que nunca sejam selecionados).
    q(q < 0) = %inf;
    
    // Seleciona o menor q não negativo.
    [mq, kq] = min(q);
    
    ks = kq+1;
    
    // Coloca a linha na forma canônica.
    M(ks,:) = M(ks,:) / M(ks,kz)
    
    // Faz a eliminação de Gauss Jordan nas demais linhas.
    for i=1:1:l
       if i ~= ks then
           M(i,:) = M(i,:) - (M(i,kz) / M(ks,kz)) * M(ks,:);
       end
    end
    
    
    printf('\nPasso %d', passo);
    disp(M);

end

:
