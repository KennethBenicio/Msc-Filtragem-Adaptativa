    Filtragem Adaptativa - TIP7188

    Kenneth Brenner dos Anjos Benicio - 519189

    Professores: charles e Guilherme
---

# Lista de Exercícios 03: Algoritmos Recursivos <!-- omit in toc -->

## Sumário <!-- omit in toc -->
- [Problema 1](#problema-1)
- [Problema 2](#problema-2)
- [Problema 3](#problema-3)
- [Problema 4](#problema-4)
- [Problema 5](#problema-5)
- [Problema 6](#problema-6)

---
## Problema 1

Deseja-se minimizar a função objetivo $\mathbb{E}\{e^{4}(n)\}$ utilizando-se um algoritmo do gradiente estocástico do tipo LMS. O algoritmo resultando é chamado de algoritmo least mean fourth (LMF). Derive tal algoritmo. Derive também o ﬁltro ótimo para tal critério e compare as soluções.

SOLUÇÃO:

Podemos inicialmente definir a função erro para esse filtro como

$$\begin{align}
    \mathbf{e}(n) &= d(n) - y(n), \\
    \mathbf{e}(n) &= d(n) - \mathbf{w}^{\text{T}}(n)\mathbf{x}(n),
\end{align}$$

e em sequência define-se a seguinte função objetivo que podemos simplifcar utilizando expansão polinomial de newton em conjunto com propriedades do operador transposto

$$\begin{align}
    \notag \mathbb{E}\{e^{4}(n)\} &= \mathbb{E}\{\left[d(n) - \mathbf{w}^{\text{T}}(n)\mathbf{x}(n)\right]^{4}\}, \\
    \notag \mathbb{E}\{e^{4}(n)\} &= \mathbb{E}\{d^{4}(n)\} - 4\mathbb{E}\{d^{3}(n)\mathbf{w}^{\text{T}}(n)\mathbf{x}(n)\} + 6\mathbb{E}\{d^{2}(n)\left[\mathbf{w}^{\text{T}}(n)\mathbf{x}(n)\right]^{2}\} \\
    &-4\mathbb{E}\{d(n)\left[\mathbf{w}^{\text{T}}(n)\mathbf{x}(n)\right]^{3}\} + \mathbb{E}\{\left[\mathbf{w}^{\text{T}}(n)\mathbf{x}(n)\right]^{4}\}, \\
    \notag \mathbb{E}\{e^{4}(n)\} &= \mathbb{E}\{d^{4}(n)\} - 4\mathbb{E}\{d^{3}(n)\mathbf{w}^{\text{T}}(n)\mathbf{x}(n)\} + 6\mathbb{E}\{d^{2}(n)\left[\mathbf{w}^{\text{T}}(n)\mathbf{x}(n) \mathbf{x}^{\text{T}}(n)\mathbf{w}(n)\right]\} \\&
    -4 \mathbb{E}\{\mathbf{w}^{\text{T}}(n) d(n) \mathbf{x}(n) \mathbf{x}^{\text{T}}(n) \mathbf{x}(n) \mathbf{w}(n) \mathbf{w}^{\text{T}}(n) \} + \mathbb{E}\{\mathbf{w}^{\text{T}}(n)\mathbf{x}(n) \mathbf{x}^{\text{T}}(n) \mathbf{w}(n) \mathbf{w}^{\text{T}}(n)\mathbf{x}(n) \mathbf{x}^{\text{T}}(n)\mathbf{w}(n)\}, \\
    \notag \mathbb{E}\{e^{4}(n)\} &= \mathbb{E}\{d^{4}(n)\} - 4 \mathbf{w}^{\text{T}}(n)\mathbb{E}\{d^{3}(n)\mathbf{x}(n)\} + 6 \mathbf{w}^{\text{T}}(n) \mathbb{E}\{d^{2}(n)\mathbf{x}(n) \mathbf{x}^{\text{T}}(n)\} \mathbf{w}(n) \\
    &- 4\mathbf{w}^{\text{T}}(n) \mathbb{E}\{d(n) \mathbf{x}(n) \mathbf{x}^{\text{T}}(n) \mathbf{x}(n)\} \mathbf{w}(n) \mathbf{w}^{\text{T}}(n) + \mathbf{w}^{\text{T}}(n) \mathbf{w}(n) \mathbb{E}\{\mathbf{x}(n) \mathbf{x}^{\text{T}}(n) \mathbf{x}(n) \mathbf{x}^{\text{T}}(n)\} \mathbf{w}^{\text{T}}(n) \mathbf{w}(n), \\
\end{align}$$

## Problema 2

Considere o uso de um a sequência de ruído branco com média nula e variância $\sigma^{2}$ como entrada do algoritmo LMS. Avalie

(a) a condição para convergência do algoritmo em média.

A condição de convergência está diretamente associada com o erro nos coeficientes do filtro adaptativo para cada iteração.
Desse modo, podemos iniciar o estudo desse tópico com a seguinte expressão

$$\begin{align}
    \Delta \mathbf{w} = \mathbf{w}(k) - \mathbf{w}_{\text{opt}},
\end{align}$$

(b) o erro em excesso em média quadrática.

---
## Problema 3

Avalie a questão anterior para o caso do algoritmo LMS-Normalizado. Compare os dois casos.

---
## Problema 4

Considere um sinal branco gaussiano de variância unitária transmitido por um canal de comunicação de função de transferência $H(z) = 1 + 1.6z^{-1}$. Para compensar este
canal utiliza-se um equalizador dado por $W(z) = w_{0} + w_{1}z^{-1}$ .

(a) Forneça o equalizador ótimo segundo o critério de Wiener. Esboce a posição dos zeros do canal e do equalizador no plano Z.

SOLUÇÃO:

Considerando um sinal gaussiano branco $x(n)$ a saída do canal pode ser prontamente obtida por

$$\begin{align}
    y(n) = x(n) + 1.6 x(n - 1),
\end{align}$$

e a matriz de autocorrelação será então dada por

$$\begin{align}
    \mathbf{R}_{y} =
    \begin{bmatrix}
        \mathbb{E}\{y(n)y^{\text{H}}(n)\} & \mathbb{E}\{y(n)y^{\text{H}}(n - 1)\} \\
        \mathbb{E}\{y(n - 1)y^{\text{H}}(n)\} & \mathbb{E}\{y(n - 1)y^{\text{H}}(n - 1)\}
    \end{bmatrix},
\end{align}$$

onde podemos calcular os valores teóricos para as correlações da seguinte forma se assumirmos que existe independência entre amostras distintas e que o sinal é média nula 

$$\begin{align}
    \mathbb{E}\{y(n)y^{\text{H}}(n)\} &= \mathbb{E}\{ \mathbf{x}^{2}(n) + 1.6 \mathbf{x}(n) \mathbf{x}^{\text{H}}(n - 1) + 1.6 \mathbf{x}(n - 1) \mathbf{x}^{\text{H}} (n) + 2.56 \mathbf{x}^{2}(n - 1) \} = 3.56, \\
    \mathbb{E}\{y(n)y^{\text{H}}(n - 1)\} &= \mathbb{E}\{ \mathbf{x}(n) \mathbf{x}^{\text{H}}(n - 1) + 1.6 \mathbf{x}(n) \mathbf{x}^{\text{H}}(n - 2) + 1.6 \mathbf{x}(n - 1) \mathbf{x}^{\text{H}} (n - 1) + 2.56 \mathbf{x}(n - 1) \mathbf{x}^{\text{H}}(n - 2) \} = 1.60, \\
    \mathbb{E}\{y(n - 1)y^{\text{H}}(n)\} &= \mathbb{E}\{ \mathbf{x}(n - 1) \mathbf{x}^{\text{H}}(n) + 1.6 \mathbf{x}(n - 1) \mathbf{x}^{\text{H}}(n - 1) + 1.6 \mathbf{x}(n - 2) \mathbf{x}^{\text{H}} (n) + 2.56 \mathbf{x}(n - 2) \mathbf{x}^{\text{H}}(n - 1) \} = 1.60, \\
    \mathbb{E}\{y(n - 1)y^{\text{H}}(n - 1)\} &= \mathbb{E}\{ \mathbf{x}^{2}(n - 1) + 1.6 \mathbf{x}(n - 1) \mathbf{x}^{\text{H}}(n - 2) + 1.6 \mathbf{x}(n - 2) \mathbf{x}^{\text{H}} (n - 1) + 2.56 \mathbf{x}(n - 2)^{2} \} = 3.56, \\
\end{align}$$

podendo assim descrever a matriz de autocorrelação teórica e sua inversa como

$$\begin{align}
    \mathbf{R}_{y} =
    \begin{bmatrix}
        3.56 & 1.60 \\
        1.60 & 3.56
    \end{bmatrix},
\end{align}$$

$$\begin{align}
    \mathbf{R}^{-1}_{y} = \frac{1}{3.56^{2} - 1.6^{2}}
    \begin{bmatrix}
        3.56 &  -1.60 \\
        -1.60 & 3.56
    \end{bmatrix} =
    \begin{bmatrix}
        0.35 &  -0.16 \\
        -0.16 & 0.35
    \end{bmatrix}.
\end{align}$$

Já o vetor de correlação cruzada teórico pode ser descrito por

$$\begin{align}
    \mathbf{p}_{yd} =
    \begin{bmatrix}
        \mathbb{E}\{y(n)d(n)\} \\
        \mathbb{E}\{y(n - 1)d(n)\}
    \end{bmatrix} = 
    \begin{bmatrix}
        1 \\
        0
    \end{bmatrix},
\end{align}$$

pois queremos que o sinal de saída tenha a maior correlação possivel com o sinal desejado de um mesmo instante mas continue sendo independente de um sinal de um instante temporal diferente.
Desse modo, podemos obter o equalizador ótimo segundo o critério de Wiener como

$$\begin{align}
    \mathbf{w}_{\text{opt}} = \mathbf{R}^{-1}_{y} \mathbf{p}_{yd} = \begin{bmatrix}
         0.35 \\
        -0.16
    \end{bmatrix}.
\end{align}$$

Por fim, abaixo segue o traçado para os zeros das funções de transferência tanto do canal quanto do filtro ótimo em azul e em vermelho, respectivamente.

<p align="center">
<img src="https://github.com/KennethBenicio/Msc-Filtragem-Adaptativa/blob/main/Imagens/plano_z.png?raw=true" title="Superficie de Erro" width="512" />
</p>

(b) Obtenha o ﬁltro de erro de predição direta de passo unitário, correspondente ao sinal à saída do canal. Calcule os zeros deste ﬁltro e compare com os do equalizador.

(c) Obtenha as trajetórias sobre as curvas de nível, tendo condições iniciais nulas para os coeﬁcientes do equalizador, para os seguintes algoritmos

- Algoritmo de Newton
- Gradiente Determinístico
- Least Means Square
- Least Means Square Normalizado

SOLUÇÃO:

Antes de tudo é necessário definir a superfície de erro que servirá como referência para traçar as curvas de nível. Desse modo, podemos prontamente
definir a superfície MSE como

$$\begin{align}
    \mathbf{J}(w) &= \mathbb{E}\{e^{2}(n)\}, \\
    \mathbf{J}(w) &= \sigma^{2}_{d} - 2\mathbf{w}^{T}\mathbf{p}_{xd} + w^{T}\mathbf{R}_{X}\mathbf{w}.   
\end{align}$$

Desse modo, temos as seguintes curvas de nível

(d) Obtenha também a evolução do erro quadrático médio para cada um dos algoritmos anteriores.


(e) Qual o número de condicionamento para o problema em questão?

VERIFICAR OS AUTOVALORES DA MATRIZ DE CORRELACAO

(f) Qual deveria ser o canal para que o número de condicionamento fosse menor/maior que 5?
Comente os resultados.

LEMBRAR QUE O DETERMINANTE É O PRODUTO ENTRE OS AUTOVALORES DE UMA MATRIZ E O NUMERO DE CONDICIONAMENTO 
ESTA ASSOCIADO COM A RAZAO MAXIMO/MINIMO DOS AUTOVALORES.

---
## Problema 5

Utilize o algoritmo LMS para identiﬁcar um sistema com a função de transferência dada abaixo.

$$\begin{align}
    H(z) = \frac{1 - z^{-12}}{1 - z^{-1}}
\end{align}$$

O sinal de entrada é um ruído branco distribuído uniformemente com variância $\sigma^{2}_{x} = 1$, e o ruído de medida é assumido gaussiano branco descorrelacionado da entrada e com variância de entrada $\sigma^{2}_{v} = 10^{-3}$ . O ﬁltro adaptativo tem 12 coeﬁcientes.

(a) Calcule o limite superior para $\mu$ (ou seja $\mu_{\text{max}}$) para garantir a estabilidade do algoritmo.

(b) Execute o algoritmo para $\frac{\mu_{\text{max}}}{2}$, $\frac{\mu_{\text{max}}}{10}$ e $\frac{\mu_{\text{max}}}{50}$. Comente sobre o comportamento da convergência de cada caso.

(c) Meça o desajuste (misadjustment ) em cada exemplo e comparar com os resultados obtidos pela solução teórica (Eq. (3.50) do livro texto)

(d) Mostre o gráﬁco da resposta em frequência do ﬁltro FIR em qualquer uma das iterações após a convergência ser obtida e compare com o sistema desconhecido.

## Problema 6

Seja o canal de comunicações dado por

$$\begin{align}
    H(z) = 0.5 + 1.2z^{-1} + 1.5z^{-2} + z^{-3},
\end{align}$$

e deseja-se projetar um equalizar para o mesmo. A estrutura do equalizador é mostrada na Figura abaixo. Os símbolos $s(n)$ são transmitidos através de um canal e corrompidos por ruído aditivo gaussiano branco complexo $v(n)$. O sinal recebido $x(n)$ é processado pelo equalizador FIR para gerar estimativas $\overset{\sim}{s}(n - \delta)$, as quais são passados por um dispositivo decisor gerando símbolos $\hat{s}(n − \delta)$. O equalizador possui dois modos de operação: um modo de treinamento durante o qual uma versão atrasada e replicada da sequência de entrada é usada como o sinal de referência (desejado) e um modo dirigido por decisão no qual a saída do dispositivo de decisão substitui a sequência de referência. O sinal de entrada $s(n)$ é escolhido de uma constelação QAM (por exemplo, 4-QAM, 16-QAM, 64-QAM ou 256-QAM).

<p align="center">
<img src="https://github.com/KennethBenicio/Msc-Filtragem-Adaptativa/blob/main/Imagens/equalizador_linear.png?raw=true" title="Superficie de Erro" width="512" />
</p>

(a) Faça um programa que treine o ﬁltro adaptativo com 500 símbolos de uma constelação 4-QAM, seguindo de uma operação dirigida por decisão de 5000 símbolos de uma constelação 16-QAM.
Escolha a variância do ruído $\sigma^{2}_{v}$ de maneira que ela promova uma relação sinal ruído de 30 db na entrada do equalizador. Note que os símbolos escolhidos não têm variância unitária. Por
esta razão, a a variância do ruído necessita ser ajustada adequadamente para cada uma das diferentes modulações (constelações) QAM para fornecer o nível de SNR desejado. Escolha
$\delta = 15$ e o comprimento do equalizador M = 15. Mostre os gráﬁcos da evolução temporal de $s(n)$, $x(n)$ e $\overset{\sim}{s}(n - \delta)$. Use o LMS-normalizado com um fator de passo de $\mu = 0.4$.

(b) Para os mesmos parâmetros do item (a), plote e compare os gráﬁcos de evolução que seriam resultante se o equalizador fosse treinado com 150, 300 e 500 iterações. Use o LMS com um
$\mu = 0.001$.

(c) Assuma agora que os dados transmitidos foram gerados de uma constelação 256-QAM ao invés de 16-QAM. Plote os gráﬁcos da evolução do sinal na saída do equalizador quando treinado
usando o LMS-normalizado e 500 símbolos de treinamento.

(d) Gerar as curvas de taxa de erro de símbolo (SER, do inglês Symbol Error Rate) versus SNR na entrada do equalizador para símbolos de constelações 4, 16, 64 e 256-QAM. Faça SNR variar
de 5dB a 30dB.