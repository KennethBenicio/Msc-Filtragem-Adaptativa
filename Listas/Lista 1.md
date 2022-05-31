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
    &E\{[(x(n) - \mu_{X})]^2\}, \\
    &E\{[(x(n) - 4\mu]^2\} = E\{[v(n) - 3v(n-1) -4\mu]^{2}\}, \\
    &E\{[(x(n) - 4\mu]^2\} = E\{[v(n) - \mu + 3v(n-1) -3\mu]^{2}\},
\end{align}$$

Desenvolvendo o o quadrado da expressão
        
$$\begin{align}
    &E\{[(x(n) - 4\mu]^2\} = E\{ [v(n) - \mu]^{2} + 9[v(n-1) - \mu]^{2} + 6[v(n)] - \mu][v(n-1) - \mu] \}, \\
    &E\{[(x(n) - 4\mu]^2\} = \sigma^{2} + 9\sigma^{2} + E\{[6[v(n) - \mu][v(n-1) - \mu]\}.
\end{align}$$

Uma vez que os sinais são descorrelacionados devido a independência o ultimo operador esperança tem valor nulo
        
$$\begin{align}
    &E\{[(x(n) - 4\mu]^2\} = 10\sigma^{2}. 
\end{align}$$
       
Já a função de correlação pode ser obtida por
        
$$\begin{align}
    &E\{x(n)x^{*}(n)\} = E\{[v(n) + 3v(n-1)][v(n) + 3v(n-1)]^{*}\}, \\
    &E\{x(n)x^{*}(n)\} = E\{[v(n)v^{*}(n)] + 3[v(n)v^{*}(n-1)] + 3[v(n-1)v^{*}(n)] + [9v(n-1)v^{*}(n-1)]\}.
\end{align}$$

Novamente utilizando a descorrelação como um mecanismo de solução é possível escrever

$$\begin{align}
    &E\{x(n)x^{*}(n)\} = E\{\mu^{2} + 3\mu^{2} + 3\mu^{2} + 9\mu^{2}\}, \\
    &E\{x(n)x^{*}(n)\} = 16\mu^{2}.
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

Uma vez que a média de processos de ruído branco são nulas é possível obter facilmente a média dos novos processos formados pela combinação dos ruídos:
             
$$\begin{align}
    &E\{x(n)\} = E\{v_{1}(n) + 3v_{2}(n-1)\} = \mu_{1} + 3\mu_{2} = 0, \\
    &E\{y(n)\} = E\{v_{2}(n+1) + 3v_{1}(n-1)\} = \mu_{2} + 3\mu_{1} = 0.
\end{align}$$

Para a variância teremos uma resposta similar:

$$\begin{align}
    &E\{[x(n) - \mu]^{2}\} = E\{[x(n) - 0]^{2}\} = E\{[x(n)]^{2}\}, \\
    &E\{[x(n) - \mu]^{2}\} = E\{[v_{1}(n) + 3v_{2}(n-1)]^{2}\} = E\{ [v^{2}_{1}(n)] + 3[v_{1}(n)v_{2}(n-1)] + 9[v^{2}_{2}(n-1)]\}, \\
    &E\{[y(n) - \mu]^{2}\} = E\{[y(n) - 0]^{2}\} = E\{[y(n)]^{2}\}, \\
    &E\{[y(n) - \mu]^{2}\} = E\{[v_{2}(n+1) + 3v_{1}(n-1)]^{2}\} = E\{ [v^{2}_{2}(n+1)] + 3[v_{2}(n+1)v_{1}(n-1)] + 9[v^{2}_{1}(n-1)]\}.
\end{align}$$

Rescrevendo a expressão para obter a formula da variância e utilizando o fato dos processos de ruído serem descorrelacionados uma nova expressão é obtida:

$$\begin{align}
    &E\{[x(n) - \mu]^{2}\} = E\{ [v^{2}_{1}(n) - 0] + 0 + 9[v^{2}_{2}(n-1) - 0]\}, \\
    &E\{[x(n) - \mu]^{2}\} = \sigma^{2}_{1} + 9\sigma^{2}_{2} = 10*0.5 = 5, \\
    &E\{[y(n) - \mu]^{2}\} = E\{ [v^{2}_{2}(n+1) - 0] + 0 + 9[v^{2}_{1}(n-1) - 0]\}, \\
    &E\{[y(n) - \mu]^{2}\} = \sigma^{2}_{2} + 9\sigma^{2}_{1} = 10*0.5 = 5.
\end{align}$$

A função de autocorrelação para X é calculada como se segue:

$$\begin{align}
    &r_{x}(\tau) = E\{x(n)x(n + \tau)\} = E\{[v_{1}(n) + 3v_{2}(n-1)][v_{1}(n + \tau) + 3v_{2}(n-1 + \tau)]\}, \\
    &r_{x}(\tau) = E\{[v_{1}(n)v_{1}(n + \tau)] + 3[v_{1}(n)v_{2}(n-1 + \tau)] + 3[v_{2}(n-1)v_{1}(n + \tau)] + 9[v_{2}(n-1)v_{2}(n-1 + \tau)] \}.    
\end{align}$$

Utilizando novamente a propriedade da descorrelação:

$$\begin{align}
    &r_{x}(\tau) = E\{[v_{1}(n)v_{1}(n + \tau)] + 9[v_{2}(n-1)v_{2}(n-1 + \tau)]\}.
\end{align}$$

Uma vez que estamos lidando com um processo estacionário(ruído branco) é possível chegar ao seguinte resultado:

$$\begin{align}
    &r_{x}(\tau) = 0.5 + 9*0.5 = 5.
\end{align}$$

Repetindo o procedimento para Y e omitindo informações redundantes chega-se ao seguinte resultado:

$$\begin{align}
    &r_{y}(\tau) = 9*0.5 + 0.5 = 5.
\end{align}$$

Sendo as estatísticas de primeira e de segunda ordem independentes quanto ao tempo para os dois processos então é possível afirmar que eles são WSS.

(b) Qual é a função de correlação cruzada $r_{xy}(n_1,n_0)$? Estes processos são conjuntamente estacionários (no sentido amplo)? Justifique.

SOLUÇÃO:

$$\begin{align}
    &r_{x,y}(n_{1},n_{0}) = E\{[x(n_{1})y^{*}(n_{0})]\} = E\{[v_{1}(n_{1}) + 3v_{2}(n_{1}-1)][v_{2}(n_{0}+1) + 3v_{1}(n_{0}-1)]^{*}\}, \\
    &r_{x,y}(n_{1},n_{0}) = E\{[v_{1}(n_{1})v^{*}_{2}(n_{0}+1)] + 3[v_{1}(n_{1})v^{*}_{1}(n_{0}-1)] + 3[v_{2}(n_{1}-1)v^{*}_{2}(n_{0}+1)] + 9[v_{2}(n_{1}-1)v^{*}_{1}(n_{0}-1)]\}.  
\end{align}$$
             
Novamente utilizando a descorrelação entre os ruídos para simplificar a expressão:

$$\begin{align}
    &r_{x,y}(n_{1},n_{0}) = E\{3[v_{1}(n_{1})v^{*}_{1}(n_{0}-1)] + 3[v_{2}(n_{1}-1)v^{*}_{2}(n_{0}+1)]\}.
\end{align}$$

Realizando a mudança de variável $n_{1} = n_{0} - 1$ é possível reescrever a expressão como:

$$\begin{align}
    &r_{x,y}(n_{1},n_{0}) = E\{3[v_{1}(n_{1})v^{*}_{1}(n_{1})] + 3[v_{2}(n_{0}-2)v^{*}_{2}(n_{0}+1)]\}.
\end{align}$$


Sendo assim, os processos não podem ser considerados conjuntamente estacionários uma vez que um dos momentos de segunda ordem é dependente do espaço temporal.

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

Resumidamente precisamos estar atentos às seguintes propriedades para garantir que temos em mãos uma matriz de autocorrelação válida
                

- $\mathbf{R_{x}} = \mathbf{R^{H}_{x}}$

- $\mathbf{a^{H}} \mathbf{R_{xa}} \geq 0$

- $\mathbf{Ax} = \lambda \mathbf{x}, \forall \lambda \geq 0 \text{ and } \mathbf{x} \in \mathbb{R}$

Desse modo, considerando um vetor aleatório bidimensional descrito por $\mathbf{X} = (x_{1},x_{2})$ podemos então

$$\begin{align}
    \mathbf{R} = \left[ 
    \begin{matrix}
    E\{[x^{2}_{1}]\} & E\{[x_{1}x^{*}_{2}]\}  \\
    E\{[x_{2}x^{*}_{1}]\} & E\{[x^{2}_{2}]\}  \\
    \end{matrix} \right]
\end{align}$$

Para garantir a primeira propriedade é necessário a seguinte relação:

$$\begin{align}
    &E\{[x_{1}x^{*}_{2}]\} \overset{\Delta}{=} E\{[x_{2}x^{*}_{1}]\}.
\end{align}$$

Já considerando a segunda e terceira propriedade é necessário que o determinante da matriz seja maior que zero uma vez que existe uma relação advinda da álgebra linear que relaciona o produto dos autovalores de uma matriz ao valor numérico do seu determinante:

$$\begin{align}
    &E\{[x^{2}_{1}]\} E\{[x^{2}_{1}]\} - E\{[x_{1}x_{2}]\} E\{[x_{2}x_{1}]\} > 0, \\
    &E\{[x_{1}^{2}]\} E\{[x^{2}_{2}]\} > E\{[x_{1}x_{2}]\} E\{[x_{2}x_{1}]\}.
\end{align}$$

(b) Um processo estocástico estacionário escalar?

SOLUÇÃO:

Considerando um processo estocástico estacionário escalar do tipo $\mathbf{X}_{t} = x(t)$ e uma versão atrasada desse
processo definida por $\mathbf{X}_{t + \tau} = x(t + \tau)$
                
$$\begin{align}
    \mathbf{R} = \left[ 
    \begin{matrix}
    E\{[x^{2}(t)_{1}]\} & E\{[x(t)x^{*}(t + \tau)]\}  \\
    E\{[x(t + \tau)x^{*}(t)]\} & E\{[x^{2}(t + \tau)]\}  \\
    \end{matrix} \right]
\end{align}$$

Para garantir a simetria oriunda da primeira restrição precisamos ter

$$\begin{align}
    &E\{[x(t)x^{*}(t + \tau)]\} \overset{\Delta}{=} E\{[x(t + \tau)x^{*}(t)]\}.
\end{align}$$

Já considerando a propriedade associada ao determinante:

$$\begin{align}
    &E\{[x^{2}(t)]\} E\{[x^{2}(t + \tau)]\} > E\{[x(t)x^{*}(t + \tau)]]\}  E\{[x(t + \tau)]x^{*}(t)]\}.
\end{align}$$

---
## Problema 4

(a) Assuma que a inversa $\mathbf{R}_{\mathbf{x}}^{-1}$ da matriz de autocorrelação de um vetor coluna $N$-dimensional exista. Mostre que
        
$$\begin{align}
    \mathbb{E}\left\{\mathbf{x}^H \mathbf{R}_{\mathbf{x}}^{-1} \mathbf{x} \right\} = N
\end{align}$$

SOLUÇÃO:

---
## Problema 5

Mostre que as matrizes de correlação e covariância satisfazem as relações abaixo:

(a) $\mathbf{R}_\mathbf{x} = \mathbf{C}_\mathbf{x} + {\bm{\mu}}_{\mathbf{x}}{\bm{\mu}}_{\mathbf{x}}^H$

SOLUÇÃO:

$$\begin{align}
    &C_{X} = E\{[(x - \mu)(x - \mu)^{H}]\} = E\{[xx^{H} -x\mu^{H} - \mu x^{H} + \mu \mu^{H}]\}, \\
    &C_{X} = E\{[xx^{H}]\} -E\{[x\mu^{H}]\} - E\{[\mu x^{H}]\} + E\{[\mu \mu^{H}]\}.
\end{align}$$


Considerando a fórmula para a matriz de correlação e o fato de o valor médio de um escalar ser o próprio escalar:

$$\begin{align}
    &C_{X} = R_{X} - E\{[x\mu^{H}]\} - E\{[\mu x^{H}]\} + \mu \mu^{H}, \\
    &C_{X} = R_{X} - \mu^{H}E\{[x]\} - \mu E\{[x^{H}]\} + \mu \mu^{H}, \\
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

Considerando que a única alteração nessa fórmula comparada ao objetivo são os termos centrais então irei focar na demonstração de que ambos os termos serão nulos:

$$\begin{align}
    &\mathbf{C_{xy}} = E\{[x - \mu_{x}][y - \mu_{y}]\}, \\
    &\mathbf{C_{xy}} = E\{[xy]\} - E\{[x\mu_{y}]\} - E\{[\mu_{x} y]\} + E\{[\mu_{x} \mu_{y}]\}, \\
    &\mathbf{C_{xy}} = E\{[xy]\} - \mu_{y} \mu_{x} - \mu_{x} \mu_{y} + \mu_{x} \mu_{y}, \\
    &\mathbf{C_{xy}} = E\{[xy]\} + \mu_{x} \mu_{y}, \\
    &\mathbf{C_{xy}} = \mu_{x} \mu_{y}, \\
\end{align}$$

$$\begin{align}
    &\mathbf{C_{yx}} = E\{[y - \mu_{y}][x - \mu_{x}]\}, \\
    &\mathbf{C_{yx}} = E\{[yx]\} - E\{[y\mu_{x}]\} - E\{[\mu_{y} x]\} + E\{[\mu_{y} \mu_{x}]\}, \\
    &\mathbf{C_{yx}} = E\{[yx]\} - \mu_{y} \mu_{x} - \mu_{x} \mu_{y} + \mu_{y} \mu_{x}, \\
    &\mathbf{C_{yx}} = E\{[yx]\} - \mu_{x} \mu_{y}, \\
    &\mathbf{C_{yx}} = - \mu_{x} \mu_{y}.
\end{align}$$

Sendo assim:

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

$$\begin{align*}
    &r_{x} = E\{x(n) x^{*}(n)\}, \\
    &r_{x} = E\{[v_{1}(n) + 2v_{1}(n+1) + 3v_{2}(n-1)] [v_{1}(n) + 2v_{1}(n+1) + 3v_{2}(n-1)]^{*}(n)\}, \\
    &r_{x} = E\{[v_{1}(n)v^{*}_{1}(n) + 2v_{1}(n)v^{*}_{1}(n+1) + 3v_{1}(n)v^{*}_{2}(n-1) + 2v_{1}(n + 1)v^{*}_{1}(n) + 4v_{1}(n+1)v^{*}_{1}(n+1) +
    6v_{1}(n+1)v^{*}_{2}(n-1)] + 3v_{2}(n-1)v^{*}_{1}(n) +  6v_{2}(n-1)v^{*}_{1}(n+1) + 9v_{2}(n-1)v^{*}_{2}(n-1)\}, \\
    &r_{x} = r_{v}(n,n) + 2r_{v}(n,n+1) + 0 + 2r_{v}(n+1,n) + 4r_{v}(n+1,n+1) + 0 + 0 + 0 + 9r_{v}(n-1,n-1), \\
    &r_{x} = r_{v}(n,n) + 2r_{v}(n,n+1) + 2r_{v}(n+1,n) + 4r_{v}(n+1,n+1) + 9r_{v}(n-1,n-1).
\end{align*}$$
    
Após uma breve análise na expressão $r_{v}(n_{1},n_{0})$ é possível verificar que para valores de momentos iguais a expressão irá se anular, permitindo a seguinte simplificação:

$$\begin{align}
    &r_{x} = 2r_{v}(n,n+1) + 2r_{v}(n+1,n), \\
    &r_{x} = \delta(n - n - 1) + \delta(n + 1 - n).
\end{align}$$

Onde a generalização pode ser descrita por:

$$\begin{align}
    &r_{x}(n_{1}, n_{2})= \delta(n_{1} - n_{2}) + \delta(n_{2} - n_{1}).  
\end{align}$$

Uma vez que a correlação é dependente do tempo, esse processo não pode ser classificado como WSS.

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