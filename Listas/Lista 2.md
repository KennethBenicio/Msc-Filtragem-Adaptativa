Filtragem Adaptativa - TIP7188

Kenneth Brenner dos Anjos Benicio - 519189

Professores: André e Henrique
---

# Lista de Exercícios 02: Filtragem Linear Ótima <!-- omit in toc -->

## Sumário <!-- omit in toc -->
- [Problema 1](#problema-1)
- [Problema 2](#problema-2)
- [Problema 3](#problema-3)
- [Problema 4](#problema-4)
- [Problema 5](#problema-5)

---
## Problema 1

Considere um problema de filtragem de Wiener conforme caracterizado a seguir. A matriz de correlação $\mathbf{R}_{\mathbf{x}}$ de um vetor de entrada $\mathbf{x}(n)$ é dada por
    
$$\begin{align*}
    \mathbf{R}_{\mathbf{x}} = \left[ \begin{matrix}
    1 & {0.5}  \\   {0.5} & 1  \\ \end{matrix} \right].
\end{align*}$$

O vetor de correlação cruzada $\mathbf{p}_{\mathbf{x}d}$ entre o vetor de entrada $\mathbf{x}$ e a resposta desejada
$d(n)$ é

$$\begin{align*}
    \mathbf{p}_{\mathbf{x}d} &= \left[ \begin{matrix}   {0.5}  \\   {0.25}  \\ \end{matrix} \right]
\end{align*}$$

(a) Encontre o vetor de coeficientes do filtro de Wiener.

SOLUÇÃO:

Isso pode ser realizado de forma simples pelo uso da equação do filtro ótimo de wiener:
        
$$\begin{align}
    \mathbf{w}_{opt} &= \mathbf{R}^{-1}_{X} \mathbf{p}_{xd}, \\
    \mathbf{w}_{opt} &=  \left[ \begin{matrix} 1 & 0.5 \\ 0.5 & 1 \end{matrix} \right]  \left[ \begin{matrix} 0.5 \\ 0.25 \end{matrix} \right], \\
    \mathbf{w}_{opt} &=  \frac{4}{3} \left[ \begin{matrix} 1 & -0.5 \\ -0.5 & 1 \end{matrix} \right]  \left[ \begin{matrix} 0.5 \\ 0.25 \end{matrix} \right], \\
    \mathbf{w}_{opt} &= \left[ \begin{matrix} 0.5 \\ 0.0 \end{matrix} \right].
\end{align}$$

(b) Qual é o mínimo erro médio quadrático fornecido por este filtro?

SOLUÇÃO:

$$\begin{align}
    \mathbb{E}\{e^{2}(n)\}  &=\sigma^{2}_{d} - 2\mathbf{w}^{T}\mathbf{p}_{xd} + w^{T}\mathbf{R}_{X}\mathbf{w}      
\end{align}$$

Ao aplicar o vetor descoberto no item anterior obtem-se o erro mínimo:

$$\begin{align}
e_{min}  &=\sigma^{2}_{d} - 2\mathbf{w}^{T}_{opt}\mathbf{p}_{xd} + w^{T}_{opt}\mathbf{R}_{X}\mathbf{w}_{opt}, \\
 e_{min} &= \sigma^{2}_{d} - 2 \left[ \begin{matrix} 0.5 & 0.0 \end{matrix} \right] \left[ \begin{matrix} 0.5 \\ 0.25 \end{matrix} \right] + \left[ \begin{matrix} 0.5 & 0.0 \end{matrix} \right] \left[ \begin{matrix} 1 & -0.5 \\ -0.5 & 1 \end{matrix} \right]  \left[ \begin{matrix} 0.5  \\ 0.0 \end{matrix} \right], \\
 e_{min} &= \sigma^{2}_{d} - 2 * 0.25 + 0.25, \\
 e_{min} &= \sigma^{2}_{d} - 0.25. 
\end{align}$$

Dessa forma o erro é dependente da variância do sinal desejado.

(c) Formule uma representação do filtro de Wiener em termos dos autovalores da matriz $\mathbf{R}_{\mathbf{x}}$
e de seus autovetores associados.

SOLUÇÃO:

Utilizando a decomposição matricial em autovalores (EVD) é possível reescrever a matrix de correlação como abaixo:
        
$$\begin{align}
    \mathbf{R}_{X} &= \mathbf{Q} \mathbf{\Lambda} \mathbf{Q}^{-1}.
\end{align}$$

A matriz $\mathbf{\Lambda}$ contémm os autovalores $\lambda_{i}$ e a matriz $\mathbf{Q}$ os respectivos autovetores. Em posse dessa relação é possível reescrever a equação do fitro ótimo de wiener como:

$$\begin{align}
    \mathbf{w}_{opt} &= \mathbf{R}^{-1}_{X} \mathbf{p}_{xd}, \\
    \mathbf{w}_{opt} &= (\mathbf{Q} \mathbf{\Lambda} \mathbf{Q}^{-1})^{-1} \mathbf{p}_{xd}, \\
    \mathbf{w}_{opt} &= \mathbf{Q}^{-1} \mathbf{\Lambda}^{-1} \mathbf{Q} \mathbf{p}_{xd}.
\end{align}$$

É possível verificar de imediato que essa propriedade é bem útil uma vez que a inversa de uma matriz diagonal é certamente menos custosa que a inversa da matriz de autocorrelação completa.

---
## Problema 2

Mostre que a equação do erro mínimo pode se escrita da seguinte maneira:

$$\begin{align*}
    \mathbf{A}\left[ \begin{matrix}
    1  \\
    { - \mathbf{w}}  \\
    \end{matrix} \right] = \left[ \begin{matrix}
    J_{\text{min}}  \\
    \mathbf{0}  \\
    \end{matrix} \right],
\end{align*}$$

em que $J_{\text{min}}$ é o mínimo erro médio quadrático, $\mathbf{w}$ é o filtro de Wiener, e $\mathbf{A}$ é a matriz de
correlação do vetor aumentado

$$\begin{align*}
    \left[ \begin{matrix}
    d(n)  \\
    \mathbf{x}(n)  \\
    \end{matrix} \right],
\end{align*}$$

em que $d(n)$ é o sinal desejado e $\mathbf{x(n)}$ é o sinal de entrada do filtro de Wiener.

SOLUÇÃO:

Inicialmente deve-se calcular a matriz de correlação do vetor aumentado:
    
$$\begin{align}
    \mathbf{A} &= \mathbb{E} \{ \left[ \begin{matrix} d(n) \\ x(n) \end{matrix} \right] \left[ \begin{matrix} d(n)^{T} & x(n)^{T} \end{matrix} \right] \}, \\
    \mathbf{A} &=   \left[ \begin{matrix} \mathbb{E}\{d(n) d(n)^{T}\} & \mathbb{E}\{d(n) x(n)^{T}\} \\ \mathbb{E}\{x(n) d(n)^{T}\} & \mathbb{E}\{x(n) x(n)^{T}\} \end{matrix} \right].
\end{align}$$

Dando as devidas nomeações aos termos a expressão acima reduz-se a:

$$\begin{align}
    \mathbf{A} &=  \left[ \begin{matrix} \sigma^{2}_{d} & \mathbf{p}_{xd}^{T} \\
    \mathbf{p}_{xd} & \mathbf{R}_{X} \end{matrix} \right].
\end{align}$$

Multiplicando-se a expressão acima pelo vetor $[1 - \mathbf{w}]^{T}$:

$$\begin{align}
    \mathbf{A} \left[ \begin{matrix} 1 \\ -\mathbf{w} \end{matrix} \right] &=   \left[ \begin{matrix} \sigma^{2}_{d} & \mathbf{p}_{xd}^{T} \\
    \mathbf{p}_{xd} & \mathbf{R}_{X} \end{matrix} \right] \left[ \begin{matrix} 1 \\ -\mathbf{w} \end{matrix} \right], \\
    \mathbf{A} \left[ \begin{matrix} 1 \\ -\mathbf{w} \end{matrix} \right] &=   \left[ \begin{matrix} \sigma^{2}_{d} - \mathbf{p}_{xd}^{T}\mathbf{w} \\
    \mathbf{p}_{xd} - \mathbf{R}_{X}\mathbf{w} \end{matrix} \right].
\end{align}$$

Por fim, resta apenas aplica a equação ótima do filtro de wiener $\mathbf{w}_{opt} = \mathbf{R}^{-1}_{X} \mathbf{p}_{xd}$:

$$\begin{align}
    \mathbf{A} \left[ \begin{matrix} 1 \\ -\mathbf{w} \end{matrix} \right] &=   \left[ \begin{matrix} \sigma^{2}_{d} - \mathbf{p}_{xd}^{T}\mathbf{R}^{-1}_{X} \mathbf{p}_{xd} \\
    \mathbf{p}_{xd} - \mathbf{R}_{X}\mathbf{R}^{-1}_{X} \mathbf{p}_{xd} \end{matrix} \right], \\
    \mathbf{A} \left[ \begin{matrix} 1 \\ -\mathbf{w} \end{matrix} \right] &=   \left[ \begin{matrix} \sigma^{2}_{d} - \mathbf{p}_{xd}^{T}\mathbf{R}^{-1}_{X} \mathbf{p}_{xd} \\
    \mathbf{p}_{xd} - \mathbf{I}_{X}\mathbf{p}_{xd} \end{matrix} \right], \\
    \mathbf{A} \left[ \begin{matrix} 1 \\ -\mathbf{w} \end{matrix} \right] &=   \left[ \begin{matrix} \sigma^{2}_{d} - \mathbf{p}_{xd}^{T
    }\mathbf{R}^{-1}_{X} \mathbf{p}_{xd} \\ 0 \end{matrix} \right], \\
    \mathbf{A} \left[ \begin{matrix} 1 \\ -\mathbf{w} \end{matrix} \right] &=   \left[ \begin{matrix} J_{min} \\ 0 \end{matrix} \right].
\end{align}$$

---
## Problema 3

Em várias aplicações práticas há uma necessidade de cancelar ruído que foi adicionado a um sinal. Por exemplo, se estamos usando o telefone celular dentro de um ruído e o ruído do carro ou rádio é adicionado 
à mensagem que estamos tentando transmitir. A Figura~\ref{Fig:Cancelamento_ruido} ilustra as situações de contaminação de ruído. Calcule o filtro de Wiener (filtro ótimo) de tal configuração em relação às estatísticas dos sinais envolvidos que você dispõe (conhece).

\begin{figure}[h!]
    \centering
    \includegraphics[width = 0.7\textwidth]{images/Cancelamento_ruido.png}
    \caption{Esquema de cancelamento de ruído.}\label{Fig:Cancelamento_ruido}
\end{figure}

SOLUÇÃO:

Inicialmente é necessário calcular a equação de erro do sistema aqui proposto:
    
$$\begin{align}
    e(n) &= x(n) - \hat{v_{1}} = x(n) - \mathbf{w}^{T}v_{2}(n)
\end{align}$$

Em seguida faz-necessário calcular a função mean square error(MSE) que é facilmente fornecida pela manipulação algébrica abaixo:

$$\begin{align}
    e^{2}(n) &= [x(n) - \mathbf{w}^{T}v_{2}(n)][x(n) - \mathbf{w}^{T}v_{2}(n)]^{T}, \\
    e^{2}(n) &= x^{2}(n) - 2x(n)\mathbf{w}^{T}v_{2}(n) + \mathbf{w}^{T}v_{2}(n)v_{2}^{T}\mathbf{w}.
\end{align}$$

Sendo considerado que o filtro apresenta coeficientes constantes é possível aplicar o operador Valor Esperado de forma a obter a seguinte relação:

$$\begin{align}
    \mathbb{E}\{e^{2}(n)\} = \mathbb{E}\{x^{2}(n)\} - 2\mathbf{w}^{T}\mathbb{E}\{x(n) v_{2}(n)\} + \mathbf{w}^{T}\mathbb{E}\{v_{2}(n)v_{2}(n)^{T}\} \mathbf{w},& \\
    \mathbb{E}\{e^{2}(n)\} = \sigma^{2}_{x} - 2\mathbf{w}^{T}\mathbf{p}_{xv_{2}} + \mathbf{w}^{T}\mathbf{R}_{v_{2}} \mathbf{w}.&
\end{align}$$

Por fim, basta encontrar o $\mathbf{w}$ que minimiza o MSE acima. Para chegar a esse fim, calcula-se o gradiante quanto ao $\mathbf{w}$ igualando-se o resultado da operação a zero:

$$\begin{align}
    \nabla_{\mathbf{w}} \mathbb{E}\{e^{2}(n)\} = - 2\mathbf{p}_{xv_{2}} + 2\mathbf{R}_{v_{2}} \mathbf{w} = 0,& \\
    -\mathbf{p}_{xv_{2}} + \mathbf{R}_{v_{2}} \mathbf{w} = 0,& \\
    \mathbf{R}_{v_{2}} \mathbf{w} = \mathbf{p}_{xv_{2}}.&
\end{align}$$

Utilizando a identidade matricial abaixo é possível resolver a equação acima para obter o seguinte resultado:

$$\begin{align}
    \mathbf{R}^{-1}_{v_{2}}\mathbf{R}_{v_{2}} \mathbf{w} &= \mathbf{R}^{-1}_{v_{2}}\mathbf{p}_{xv_{2}}, \\
    \mathbf{I}\mathbf{w} &= \mathbf{R}^{-1}_{v_{2}}\mathbf{p}_{xv_{2}}, \\ 
    \mathbf{w} &= \mathbf{R}^{-1}_{v_{2}}\mathbf{p}_{xv_{2}}. 
\end{align}$$

Onde é possível reescrever o termo final como:

$$\begin{align}
    \mathbf{w} = \mathbf{R}^{-1}_{v_{2}}(\mathbf{p}_{d} + \mathbf{p}_{v_{1}} + \mathbf{p}_{v_{2}}) 
\end{align}$$

---
## Problema 4

Seja um processo estocástico dado pela expressão abaixo onde $S(n)$ é um processo estocástico WSS dado e $a$ é uma constante.

$$\begin{align*}
    x(n) = s(n + a) + s(n-4a),
\end{align*}$$

Deseja-se filtrar o processo de tal forma obter-se um processo $D(s) = s(n -a)$, o qual também sabe-se que é um processo WSS. Suponha que o sinal $d(n)$ possua média nula e variância unitária.

(a) Calcule o filtro, com dois coeficientes, que fornece a solução ótima em relação ao erro médio quadrático.

SOLUÇÃO:

(b) Calcule o preditor direto ótimo de passo unitário, com dois coeficientes, que fornece a solução ótima em relação ao erro médio quadrático.

SOLUÇÃO:

(c) Compare as soluções dos dois.

SOLUÇÃO:

---
## Problema 5

Suponha que foram encontrados os seguintes coeficientes de autocorrelação: $r_x(0) = 1$ e $r_x(1) = 0$. Tais coeficientes foram obtidos de amostras corrompidas com ruído. Além disso, a variância do sinal desejado é $\sigma_d^2 =
24.40$ e o vetor de correlação cruzada é $\mathbf{p}_{\mathbf{x}d} = [2 \ \ 4.5]^T$. Encontre:

(a) O valor dos coeficientes do filtro de Wiener.

SOLUÇÃO:

A partir dos coeficientes fornecidos é possível escrever a matrix de correlação necessário para o filtro ótimo de wiener como uma matriz identidade de ordem 2:
        
$$\begin{align}
    \mathbf{R}_{X} = \left[ \begin{matrix} 1 & 0 \\ 0 & 1 \end{matrix} \right]
\end{align}$$

Ao utilizar a solução fechada do problema chega-se ao seguinte vetor resultado:

$$\begin{align}
    \mathbf{w}_{opt} &= \mathbf{R}^{-1}_{x} \mathbf{p}_{xd}, \\
    \mathbf{w}_{opt} &=  \left[ \begin{matrix} 1 & 0 \\ 0 & 1 \end{matrix} \right]  \left[ \begin{matrix} 2 \\ 4.5 \end{matrix} \right], \\
    \mathbf{w}_{opt} &= \left[ \begin{matrix} 2 \\ 4.5 \end{matrix} \right].
\end{align}$$

(b) A superfície definida por $J(\mathbf{w})$. Faça um gráfico da mesma.

SOLUÇÃO:

Para obter a expressão que define a superfície basta utilizar a equação abaixo que foi devidamente demonstrada em aulas:
        
$$\begin{align}
    \mathbf{J}(w) &= \mathbb{E}\{e^{2}(n)\}, \\
    \mathbf{J}(w) &= \sigma^{2}_{d} - 2\mathbf{w}^{T}\mathbf{p}_{xd} + w^{T}\mathbf{R}_{X}\mathbf{w}.   
\end{align}$$

Substituindo os valores encontrados anteriormente na expressão da superfície:

$$\begin{align}
    \mathbf{J}(w_{0}, w_{1}) &= 24.40 - 2 \left[ \begin{matrix} w_{0}  w_{1} \end{matrix} \right] \left[ \begin{matrix} 2 \\ 4.5 \end{matrix} \right] + \left[ \begin{matrix} w_{0}  w_{1} \end{matrix} \right] \left[ \begin{matrix} 1 & 0 \\ 0 & 1 \end{matrix} \right]  \left[ \begin{matrix} w_{0}  \\ w_{1} \end{matrix} \right], \\
    \mathbf{J}(w_{0},w_{1}) &= 24.40 - 4w_{0} - 9w_{1} + w^{2}_{0} + w^{2}_{1}.
\end{align}$$

Utilizando um software é possível facilmente traçar a superfície por meio da variação dos coeficientes de filtro:

\begin{figure}[h!]
    \centering
    \includegraphics[width = 0.7\textwidth]{images/Figura_01.pdf}
    \caption{Superfície Definida por $\mathbf{J}(w_{0},w_{1})$}
\end{figure}