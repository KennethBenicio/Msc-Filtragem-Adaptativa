    Filtragem Adaptativa - TIP7188

    Kenneth Brenner dos Anjos Benicio - 519189

    Professores: Charles Casimiro e Guilherme Barreto
    
---

# Lista de Exercícios 01: Estatísticas de Segunda Ordem <!-- omit in toc -->

## Sumário <!-- omit in toc -->
- [Problema 1](#problema-1)
- [Problema 2](#problema-2)
- [Problema 3](#problema-3)
- [Problema 4](#problema-4)
- [Problema 5](#problema-5)
- [Problema 6](#problema-6)

---
## Problema 1

(a) Determine a média e a função de autocorrelação para o processo aleatório em que $v(n)$ é uma sequência de variáveis aleatórias independentes com média $\mu$ e variância $\sigma^2$. $x(n)$ é estacionário? Justifique.

$$\begin{align}
    &x(n) = v(n) + 3 v(n-1),
\end{align}$$

SOLUÇÃO:

Para o cálculo da média é possível escrever
        
$$\begin{align}
    &E[x(n)] = E[v(n) + 3v(n-1)], 
\end{align}$$

mas uma vez que todas as variáveis aleatórias possuem mesma média o resultado será

$$\begin{align}
    &E[x(n)] = \mu + 3\mu = 4\mu.  
\end{align}$$

De forma semelhante a variância pode ser obtida por 

$$\begin{align}
    &\mathbb{E}\{[(x(n) - \mu_{X})]^2\}, \\
    &\mathbb{E}\{[x(n) - 4\mu]^2\} = \mathbb{E}\{[v(n) - 3v(n-1) -4\mu]^{2}\}, \\
    &\mathbb{E}\{[x(n) - 4\mu]^2\} = \mathbb{E}\{[v(n) - \mu + 3v(n-1) -3\mu]^{2}\},
\end{align}$$

e ao desenvolver o valor quadrado da expressão chega-se em
        
$$\begin{align}
    &\mathbb{E}\{[x(n) - 4\mu]^2\} = \mathbb{E}\{ [v(n) - \mu]^{2} + 9[v(n-1) - \mu]^{2} + 6[v(n) - \mu][v(n-1) - \mu] \}, \\
    &\mathbb{E}\{[x(n) - 4\mu]^2\} = \sigma^{2} + 9\sigma^{2} + \mathbb{E}\{6[v(n) - \mu][v(n-1) - \mu]\}.
\end{align}$$

Sabendo que os sinais são descorrelacionados uma vez que temos duas variáveis aleatórias independentes temos

$$\begin{align}
    &6\mathbb{E}\{[v(n) - \mu][v(n-1) - \mu]\} = \mathbb{E}\{v(n)v(n-1) - \mu v(n) -\mu v(n-1) + \mu^{2}\}, \\
    &6\mathbb{E}\{[v(n) - \mu][v(n-1) - \mu]\} = \mathbb{E}\{v(n)v(n-1)\} - \mu^{2} -\mu^{2} + \mu^{2}, \\
    &6\mathbb{E}\{[v(n) - \mu][v(n-1) - \mu]\} = \mathbb{E}\{v(n)\} \mathbb{E}\{v(n-1)\} - \mu^{2}, \\
    &6\mathbb{E}\{[v(n) - \mu][v(n-1) - \mu]\} = \mu^{2} - \mu^{2} = 0,
\end{align}$$

Portanto, a média pode ser dada por

$$\begin{align}
    &\mathbb{E}\{[x(n) - 4\mu]^2\} = 10\sigma^{2}. 
\end{align}$$

Além disso, a função de correlação pode ser adquirida por meio da seguinte operação 
        
$$\begin{align}
    &\mathbb{E}\{x(n)x^{*}(n)\} = \mathbb{E}\{[v(n) + 3v(n-1)][v(n) + 3v(n-1)]^{*}\}, \\
    &\mathbb{E}\{x(n)x^{*}(n)\} = \mathbb{E}\{[v(n)v^{*}(n)] + 3[v(n)v^{*}(n-1)] + 3[v(n-1)v^{*}(n)] + [9v(n-1)v^{*}(n-1)]\},
\end{align}$$

onde é possível reescrever a equação acima ao considerarmos novamente a descorrelação entre as variáveis aleatórias 
 
$$\begin{align}
    &\mathbb{E}\{x(n)x^{*}(n)\} = \mathbb{E}\{\mu^{2} + 3\mu^{2} + 3\mu^{2} + 9\mu^{2}\}, \\
    &\mathbb{E}\{x(n)x^{*}(n)\} = 16\mu^{2}.
\end{align}$$

Uma vez que as estatísticas de primeira e de segunda ordem são independentes quanto ao deslocamento temporal é possível afirmar que o processo descrito é Estacionário no Sentido Amplo(WSS). Entretanto, não é possível afirmar que o processo é Estacionário no Sentido Estrito(SSS) uma vez que não se tem conhecimento da função que descreve a densidade de probabilidade desse sistema.

---
## Problema 2

Sejam os processos aleatórios $x(n)$ e $y(n)$ definidos por

$$\begin{align} 
    &x(n) = v_1(n) + 3v_2(n-1), \\
    &y(n) = v_2(n + 1) + 3v_1(n-1),
\end{align}$$

em que $v_1(n)$ e $v_2(n)$ são processos de ruído branco independentes cada um com variância igual a $0,5$.

(a) Quais são as funções de autocorrelação de $x$ e de $y$? Os processos são WSS?

SOLUÇÃO:

Antes de tudo é de interesse definir o processo estocástico de ruído branco. Um processo desse tipo é formado por um número qualquer de amostras
independentes entre si e com média nula. Desse modo, uma vez que a média de processos de ruído branco são nulas é possível obter facilmente a média dos novos processos formados pela combinação dos ruídos
             
$$\begin{align}
    &\mathbb{E}\{x(n)\} = \mathbb{E}\{v_{1}(n) + 3v_{2}(n-1)\} = \mu_{1} + 3\mu_{2} = 0, \\
    &\mathbb{E}\{y(n)\} = \mathbb{E}\{v_{2}(n+1) + 3v_{1}(n-1)\} = \mu_{2} + 3\mu_{1} = 0.
\end{align}$$

Para a variância teremos uma resposta similar

$$\begin{align}
    &\mathbb{E}\{[x(n) - \mu]^{2}\} = \mathbb{E}\{[x(n) - 0]^{2}\} = \mathbb{E}\{[x(n)]^{2}\}, \\
    &\mathbb{E}\{[x(n) - \mu]^{2}\} = \mathbb{E}\{[v_{1}(n) + 3v_{2}(n-1)]^{2}\} = \mathbb{E}\{ [v^{2}_{1}(n)] + 6[v_{1}(n)v_{2}(n-1)] + 9[v^{2}_{2}(n-1)]\}, \\
    &\mathbb{E}\{[y(n) - \mu]^{2}\} = \mathbb{E}\{[y(n) - 0]^{2}\} = \mathbb{E}\{[y(n)]^{2}\}, \\
    &\mathbb{E}\{[y(n) - \mu]^{2}\} = \mathbb{E}\{[v_{2}(n+1) + 3v_{1}(n-1)]^{2}\} = \mathbb{E}\{ [v^{2}_{2}(n+1)] + 6[v_{2}(n+1)v_{1}(n-1)] + 9[v^{2}_{1}(n-1)]\}.
\end{align}$$

Rescrevendo a expressão para obter a formula da variância e utilizando o fato dos processos de ruído serem descorrelacionados uma nova expressão é obtida

$$\begin{align}
    &\mathbb{E}\{[x(n) - \mu]^{2}\} = \mathbb{E}\{ [v^{2}_{1}(n) - 0] + 0 + 9[v^{2}_{2}(n-1) - 0]\}, \\
    &\mathbb{E}\{[x(n) - \mu]^{2}\} = \sigma^{2}_{1} + 9\sigma^{2}_{2} = 10*0.5 = 5, \\
    &\mathbb{E}\{[y(n) - \mu]^{2}\} = \mathbb{E}\{ [v^{2}_{2}(n+1) - 0] + 0 + 9[v^{2}_{1}(n-1) - 0]\}, \\
    &\mathbb{E}\{[y(n) - \mu]^{2}\} = \sigma^{2}_{2} + 9\sigma^{2}_{1} = 10*0.5 = 5.
\end{align}$$

A função de autocorrelação para $X$ é calculada como se segue 
$$\begin{align}
    &r_{x}(\tau) = \mathbb{E}\{x(n)x(n + \tau)\} = \mathbb{E}\{[v_{1}(n) + 3v_{2}(n-1)][v_{1}(n + \tau) + 3v_{2}(n-1 + \tau)]\}, \\
    &r_{x}(\tau) = \mathbb{E}\{[v_{1}(n)v_{1}(n + \tau)] + 3[v_{1}(n)v_{2}(n-1 + \tau)] + 3[v_{2}(n-1)v_{1}(n + \tau)] + 9[v_{2}(n-1)v_{2}(n-1 + \tau)] \}.    
\end{align}$$

Sabendo que amostras de um mesmo processo são descorrelacionadas e que ambos os processos também são descorrelacionados, além de termos conhecimento 
de que ambos possuem média nula, então 

$$\begin{align}
    &\mathbb{E}\{[v_{1}(n)v_{1}(n + \tau)]\} = \mathbb{E}\{[v_{1}(n)]\} \mathbb{E}\{[v_{1}(n + \tau)]\} = 0, \\ 
    &3\mathbb{E}\{[v_{1}(n)v_{2}(n-1 + \tau)]\} = 3\mathbb{E}\{[v_{1}(n)]\} \mathbb{E}\{[v_{2}(n-1 + \tau)]\} = 0, \\
    &3\mathbb{E}\{[v_{2}(n-1)v_{1}(n + \tau)]\} = 3\mathbb{E}\{[v_{2}(n-1)]\} \mathbb{E}\{[v_{1}(n + \tau)]\} = 0, \\
    &9\mathbb{E}\{[v_{2}(n-1)v_{2}(n-1 + \tau)]\} = 9\mathbb{E}\{[v_{2}(n-1)]\} \mathbb{E}\{[v_{2}(n-1 + \tau)]\} = 0, \\ 
    &r_{x}(\tau) = 0.
\end{align}$$

Repetindo o procedimento para $Y$ e omitindo informações redundantes chega-se ao seguinte resultado

$$\begin{align}
    &r_{y}(\tau) = 0.
\end{align}$$

Sendo as estatísticas de primeira e de segunda ordem independentes quanto ao tempo para os dois processos então é possível afirmar que eles são WSS.

(b) Qual é a função de correlação cruzada $r_{xy}(n_1,n_0)$? Estes processos são conjuntamente estacionários (no sentido amplo)? Justifique.

SOLUÇÃO:

$$\begin{align}
    &r_{x,y}(n_{1},n_{0}) = \mathbb{E}\{[x(n_{1})y^{*}(n_{0})]\} = \mathbb{E}\{[v_{1}(n_{1}) + 3v_{2}(n_{1}-1)][v_{2}(n_{0}+1) + 3v_{1}(n_{0}-1)]^{*}\}, \\
    &r_{x,y}(n_{1},n_{0}) = \mathbb{E}\{[v_{1}(n_{1})v^{*}_{2}(n_{0}+1)] + 3[v_{1}(n_{1})v^{*}_{1}(n_{0}-1)] + 3[v_{2}(n_{1}-1)v^{*}_{2}(n_{0}+1)] + 9[v_{2}(n_{1}-1)v^{*}_{1}(n_{0}-1)]\}.  
\end{align}$$
             
Novamente considerando que os processos de ruído branco são descorrelacionadas entre si e que as amostras individuais são também independentes então podemos simplificar a expressão acima da seguinte forma

$$\begin{align}
    &r_{x,y}(n_{1},n_{0}) = 0 
\end{align}$$

Sendo assim, os processos podem ser considerados conjuntamente estacionários uma vez que a correlação cruzada é independente do instante temporal e que os processos que compoẽm o processo conjunto podem 
ser considerados estacionários em sentido amplo isoladamente. Entretanto, vale notar que foi possível realizar tal afirmação apenas por termos conhecimento da relação de independência entre os processos 
de ruído branco, pois de outro modo não seria possível realizar afirmações quanto a correlação cruzada do processo conjunto.

---
## Problema 3

Quais as condições que os elementos de uma matriz

$$\begin{align}
    \mathbf{R} = \left[
    \begin{matrix}
    a & b  \\
    c & d  \\
    \end{matrix} \right]
\end{align}$$

devem satisfazer tal que $\mathbf{R}$ seja uma matriz de autocorrelação válida de

(a) Um vetor aleatório bidimensional?

SOLUÇÃO:

Em suma, precisamos estar atentos às seguintes propriedades para garantir que temos em mãos uma matriz de autocorrelação válida
                

- $\mathbf{R_{x}} = \mathbf{R^{H}_{x}}$

- $\mathbf{a^{H}} \mathbf{R_{xa}} \geq 0$

- $\mathbf{Ax} = \lambda \mathbf{x}, \forall \lambda \geq 0 \text{ and } \mathbf{x} \in \mathbb{R}$

Desse modo, considerando um vetor aleatório bidimensional descrito por $\mathbf{X} = (x_{1},x_{2})$ podemos então

$$\begin{align}
    \mathbf{R} &= \left[ 
    \begin{matrix}
    \mathbb{E}\{[x^{2}_{1}]\} & \mathbb{E}\{[x_{1}x^{*}_{2}]\} \\
    \mathbb{E}\{[x_{2}x^{*}_{1}]\} & \mathbb{E}\{[x^{2}_{2}]\} \\
    \end{matrix} \right], \\
    \mathbf{R}^{\text{H}} &= \left[ 
    \begin{matrix}
    \mathbb{E}\{[x^{2}_{1}]\} & \mathbb{E}\{[x_{2}x^{*}_{1}]\} \\
    \mathbb{E}\{[x_{1}x^{*}_{2}]\} & \mathbb{E}\{[x^{2}_{2}]\} \\
    \end{matrix} \right].
\end{align}$$

Inicialmente, podemos garantir a simetria quanto ao hermitiano se fizermos 

$$\begin{align}
    &\mathbb{E}\{[x_{1}x^{*}_{2}]\} \overset{\Delta}{=} \mathbb{E}\{[x_{2}x^{*}_{1}]\},
    &\mathbb{E}\{[x_{2}x^{*}_{1}]\} \overset{\Delta}{=} \mathbb{E}\{[x_{1}x^{*}_{2}]\}.
\end{align}$$

Entretanto, sabemos que o operador esperança é linear tornando assim as expressões acima equivalentes. Em continuidade do problema, podemos 
considerar que a restrição as quais os autovalores estão submetidos pode ser facilmente atingida ao garantirmos que o determinante da matriz 
de correlação seja maior que a nulidade

$$\begin{align}
    &\mathbb{E}\{[x^{2}_{1}]\} \mathbb{E}\{[x^{2}_{1}]\} - \mathbb{E}\{[x_{1}x_{2}]\} \mathbb{E}\{[x_{2}x_{1}]\} > 0, \\
    &\mathbb{E}\{[x_{1}^{2}]\} \mathbb{E}\{[x^{2}_{2}]\} > \mathbb{E}\{[x_{1}x_{2}]\} \mathbb{E}\{[x_{2}x_{1}]\}.
\end{align}$$

(b) Um processo estocástico estacionário escalar?

SOLUÇÃO:

Considerando um processo estocástico estacionário escalar do tipo $\mathbf{X}_{t} = x(t)$ e uma versão atrasada desse
processo definida por $\mathbf{X}_{t + \tau} = x(t + \tau)$ temos que a matriz de correlação pode ser escrita da seguinte forma
                
$$\begin{align}
    \mathbf{R} &= \left[ 
    \begin{matrix}
    \mathbb{E}\{[x^{2}(t)_{1}]\} & \mathbb{E}\{[x(t)x^{*}(t + \tau)]\} \\
    \mathbb{E}\{[x(t + \tau)x^{*}(t)]\} & \mathbb{E}\{[x^{2}(t + \tau)]\} \\
    \end{matrix} \right], \\
    \mathbf{R}^{\text{H}} &= \left[ 
    \begin{matrix}
    \mathbb{E}\{[x^{2}(t)_{1}]\} & \mathbb{E}\{[x(t + \tau)x^{*}(t)]\} \\
    \mathbb{E}\{[x(t)x^{*}(t + \tau)]\} & \mathbb{E}\{[x^{2}(t + \tau)]\} \\
    \end{matrix} \right].
\end{align}$$


Em sequência, podemos garantir a simetria quanto ao hermitiano se fizermos 

$$\begin{align}
    &\mathbb{E}\{[x(t)x^{*}(t + \tau)]\} \overset{\Delta}{=} \mathbb{E}\{[x(t + \tau)x^{*}(t)]\}, \\
    &\mathbb{E}\{[x(t + \tau)x^{*}(t)]\} \overset{\Delta}{=} \mathbb{E}\{[x(t)x^{*}(t + \tau)]\},
\end{align}$$

mas, mais uma vez, considerando que o operador esperança é linear então as duas expressões são equivalentes. Já considerando a
restrição imposta aos autovalores da matriz temos novamente

$$\begin{align}
    &\mathbb{E}\{[x^{2}(t)]\} \mathbb{E}\{[x^{2}(t + \tau)]\} > \mathbb{E}\{[x(t)x^{*}(t + \tau)]]\}  \mathbb{E}\{[x(t + \tau)]x^{*}(t)]\}.
\end{align}$$

---
## Problema 4

(a) Assuma que a inversa $\mathbf{R}_{\mathbf{x}}^{-1}$ da matriz de autocorrelação de um vetor coluna $N$-dimensional exista. Mostre que
        
$$\begin{align}
    \mathbb{E}\left\{\mathbf{x}^H \mathbf{R}_{\mathbf{x}}^{-1} \mathbf{x} \right\} = N
\end{align}$$

SOLUÇÃO:

Inicialmente podemos escrever a expressão regular para a matriz de autocorrelação e supondo que de fato existe uma inversa bem definida 
para a matriz de autocorrelação

$$\begin{align}
    \mathbb{E}\{\mathbf{x} \mathbf{x}^{\text{H}}\} = \mathbf{R}_{x}, \\
    \mathbb{E}\{\mathbf{x} \mathbf{x}^{\text{H}}\}\mathbf{R}^{-1}_{x} = \mathbf{R}_{x}\mathbf{R}^{-1}_{x}, \\
    \mathbb{E}\{\mathbf{x} \mathbf{x}^{\text{H}}\mathbf{R}^{-1}_{x}\} = \mathbf{I}_{N}, \\
\end{align}$$

onde a última passagem foi possível pois consideramos que, embora de naturaze aleatória, a matriz de autocorrelação possui medicões fixas 
após o término da coleta das amostas. Desse modo, podemos aplicar o operador traço de matriz e por meio das propriedades relevantes é possível
alterar de forma conveniente a ordem do produto dos termos, somente ao aplicarmos uma permutação cíclica, obtendo portanto o seguinte resultado

$$\begin{align}
    \text{Tr}\{\mathbb{E}\{\mathbf{x} \mathbf{x}^{\text{H}}\mathbf{R}^{-1}_{x}\}\} = \text{Tr}\{\mathbf{I}_{N}\}, \\
    \text{Tr}\{\mathbb{E}\{\mathbf{x}^{\text{H}}\mathbf{R}^{-1}_{x} \mathbf{x}\}\} = \text{Tr}\{\mathbf{I}_{N}\}, \\
    \text{Tr}\{\mathbb{E}\{\mathbf{x}^{\text{H}}\mathbf{R}^{-1}_{x} \mathbf{x}\}\} = N,
\end{align}$$

---
## Problema 5

Mostre que as matrizes de correlação e covariância satisfazem as relações abaixo:

(a) $\mathbf{R}_\mathbf{x} = \mathbf{C}_\mathbf{x} + {\bm{\mu}}_{\mathbf{x}}{\bm{\mu}}_{\mathbf{x}}^H$

SOLUÇÃO:

$$\begin{align}
    &C_{X} = \mathbb{E}\{[(x - \mu)(x - \mu)^{H}]\} = \mathbb{E}\{[xx^{H} -x\mu^{H} - \mu x^{H} + \mu \mu^{H}]\}, \\
    &C_{X} = \mathbb{E}\{[xx^{H}]\} -\mathbb{E}\{[x\mu^{H}]\} - \mathbb{E}\{[\mu x^{H}]\} + \mathbb{E}\{[\mu \mu^{H}]\}.
\end{align}$$


Considerando a matriz de correlação pode ser escrita por $R_{X} = \mathbb{E}\{[xx^{H}]\}$ e que o valor médio de um escalar é o próprio escalar temos

$$\begin{align}
    &C_{X} = R_{X} - \mathbb{E}\{[x\mu^{H}]\} - \mathbb{E}\{[\mu x^{H}]\} + \mu \mu^{H}, \\
    &C_{X} = R_{X} - \mu^{H}\mathbb{E}\{[x]\} - \mu \mathbb{E}\{[x^{H}]\} + \mu \mu^{H}, \\
    &C_{X} = R_{X} - \mu \mu^{H} - \mu \mu^{H} + \mu \mu^{H}, \\
    &C_{X} = R_{X} - \mu \mu^{H}, \\
    &R_{X} = C_{X} + \mu \mu^{H}.
\end{align}$$

(b)  $\mathbf{C}_{\mathbf{x} + \mathbf{y}} = \mathbf{C}_{\mathbf{x}} +
\mathbf{C}_{\mathbf{y}}$, para $\mathbf{x}$ e $\mathbf{y}$ descorrelacionados

SOLUÇÃO:

$$\begin{align}
    &\mathbf{C}_{\mathbf{x} + \mathbf{y}} = \mathbf{C}_{\mathbf{x}} + \mathbf{C}_{\mathbf{xy}} + \mathbf{C}_{\mathbf{yx}} + \mathbf{C}_{\mathbf{y}}.
\end{align}$$

Onde os termos de correlação cruzada $\mathbf{C}_{\mathbf{xy}}$ e $\mathbf{C}_{\mathbf{yx}}$ podem ser obtidos  da seguinte maneira

$$\begin{align}
    &\mathbf{C_{xy}} = \mathbb{E}\{[x - \mu_{x}][y - \mu_{y}]\}, \\
    &\mathbf{C_{xy}} = \mathbb{E}\{[xy]\} - \mathbb{E}\{[x\mu_{y}]\} - \mathbb{E}\{[\mu_{x} y]\} + \mathbb{E}\{[\mu_{x} \mu_{y}]\}, \\
    &\mathbf{C_{xy}} = \mathbb{E}\{[xy]\} - \mu_{y} \mu_{x} - \mu_{x} \mu_{y} + \mu_{x} \mu_{y}, \\
    &\mathbf{C_{xy}} = \mathbb{E}\{[xy]\} + \mu_{x} \mu_{y}, \\
    &\mathbf{C_{xy}} = \mu_{x} \mu_{y}, \\
\end{align}$$

$$\begin{align}
    &\mathbf{C_{yx}} = \mathbb{E}\{[y - \mu_{y}][x - \mu_{x}]\}, \\
    &\mathbf{C_{yx}} = \mathbb{E}\{[yx]\} - \mathbb{E}\{[y\mu_{x}]\} - \mathbb{E}\{[\mu_{y} x]\} + \mathbb{E}\{[\mu_{y} \mu_{x}]\}, \\
    &\mathbf{C_{yx}} = \mathbb{E}\{[yx]\} - \mu_{y} \mu_{x} - \mu_{x} \mu_{y} + \mu_{y} \mu_{x}, \\
    &\mathbf{C_{yx}} = \mathbb{E}\{[yx]\} - \mu_{x} \mu_{y}, \\
    &\mathbf{C_{yx}} = - \mu_{x} \mu_{y}.
\end{align}$$

Portanto, é possível afirmar que a soma dos termos de correlação cruzada é nula e que a correlação da soma de dois vetores descorrelacionados é de fato 
dada por $\mathbf{C}_{\mathbf{x} + \mathbf{y}} = \mathbf{C}_{\mathbf{x}} + \mathbf{C}_{\mathbf{y}}$

$$\begin{align}
    &\mathbf{C_{xy}} + \mathbf{C_{yx}}  = \mu_{x} \mu_{y} - \mu_{x} \mu_{y}, \\
    &\mathbf{C_{xy}} + \mathbf{C_{yx}}  = 0.
\end{align}$$

---
## Problema 6

Processos aleatórios $v_1(n)$ e $v_2(n)$  são independentes e têm a mesma função de correlação
        
$$\begin{align}
    r_v(n_1,n_0) = 0.5\delta(n_1 - n_0)
\end{align}$$

(a) Qual é a função de correlação do processo aleatório
        
$$\begin{align}
    x(n) = v_1(n) + 2v_1(n + 1) + 3v_2(n-1) ?
\end{align}$$

Este é um processo WSS? Justifique.

SOLUÇÃO:

Para simplificar o desenvolvimento iremos considerar que os processos possuem media nula e são descorrelacionados
$$\begin{align*}
    &r_{x} = \mathbb{E}\{x(n) x^{*}(n)\}, \\
    &r_{x} = \mathbb{E}\{[v_{1}(n) + 2v_{1}(n+1) + 3v_{2}(n-1)] [v_{1}(n) + 2v_{1}(n+1) + 3v_{2}(n-1)]^{*}(n)\}, \\
    &r_{x} = \mathbb{E}\{[v_{1}(n)v^{*}_{1}(n) + 2v_{1}(n)v^{*}_{1}(n+1) + 3v_{1}(n)v^{*}_{2}(n-1) + 2v_{1}(n + 1)v^{*}_{1}(n) + 4v_{1}(n+1)v^{*}_{1}(n+1) +
    6v_{1}(n+1)v^{*}_{2}(n-1)] + 3v_{2}(n-1)v^{*}_{1}(n) +  6v_{2}(n-1)v^{*}_{1}(n+1) + 9v_{2}(n-1)v^{*}_{2}(n-1)\}, \\
    &r_{x} = r_{v}(n,n) + 2r_{v}(n,n+1) + 0 + 2r_{v}(n+1,n) + 4r_{v}(n+1,n+1) + 0 + 0 + 0 + 9r_{v}(n-1,n-1), \\
    &r_{x} = r_{v}(n,n) + 2r_{v}(n,n+1) + 2r_{v}(n+1,n) + 4r_{v}(n+1,n+1) + 9r_{v}(n-1,n-1).
\end{align*}$$
    
Após uma breve análise na expressão $r_{v}(n_{1},n_{0})$ é possível verificar que determinados termos anulam-se ao considerar um único momento temporal devido a presença da função degrau unitário, permitindo a seguinte simplificação:

$$\begin{align}
    &r_{x} = 2r_{v}(n,n+1) + 2r_{v}(n+1,n), \\
    &r_{x} = \delta(n - n - 1) + \delta(n + 1 - n).
\end{align}$$

Onde a generalização pode ser descrita por:

$$\begin{align}
    &r_{x}(n_{1}, n_{2})= \delta(n_{1} - n_{2}) + \delta(n_{2} - n_{1}).  
\end{align}$$

Uma vez que a correlação é dependente apenas de um deslocamento temporal, então podemos classificar esse processo como WSS.

(b) Encontre a a matrix de correlação de um vetor aleatório consistindo de oito amostras consecutivas de
$x(n)$.

SOLUÇÃO:

$$\begin{align}
    \mathbf{R}_{\mathbf{x}} = \left[\\
    \begin{matrix}
        2 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
        0 & 2 & 0 & 0 & 0 & 0 & 0 & 0\\
        0 & 0 & 2 & 0 & 0 & 0 & 0 & 0\\
        0 & 0 & 0 & 2 & 0 & 0 & 0 & 0\\
        0 & 0 & 0 & 0 & 2 & 0 & 0 & 0\\
        0 & 0 & 0 & 0 & 0 & 2 & 0 & 0\\
        0 & 0 & 0 & 0 & 0 & 0 & 2 & 0\\
        0 & 0 & 0 & 0 & 0 & 0 & 0 & 2\\
    \end{matrix}
    \right]
\end{align}$$

 Para chegar a esse resultado foi utilizado a expressão para a correlação obtida no item anterior. Uma vez que a função delta de dirac terá um valor não nulo apenas quando o argumento for zero, isso irá acontecer apenas quando os momentos $n_{1}$ e $n_{2}$ forem iguais e isso irá acontecer apenas com os elementos da diagonal principal.