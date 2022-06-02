    Filtragem Adaptativa - TIP7188

    Kenneth Brenner dos Anjos Benicio - 519189

    Professores: André e Henrique
---

# Lista de Exercícios 03: Filtragem Linear Ótima <!-- omit in toc -->

## Sumário <!-- omit in toc -->
- [Problema 1](#problema-1)
- [Problema 2](#problema-2)
- [Problema 3](#problema-3)
- [Problema 4](#problema-4)
- [Problema 5](#problema-5)
- [Problema 6](#problema-6)

---
## Problema 1

Deseja-se minimizar a função objetivo $\mathbb{E}\{e^{4}(n)\}$ utilizando-se um algoritmo do gradiente estocástico do tipo LMS. O algoritmo resultando é chamado de algoritmo least mean
fourth (LMF). Derive tal algoritmo. Derive também o ﬁltro ótimo para tal critério e compare as soluções.

SOLUÇÃO:

Podemos inicialmente definir a função erro para esse filtro como

$$\begin{align}
    \boldsymbol{e}(n) &= d(n) - y(n), \\
    \boldsymbol{e}(n) &= d(n) - \boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n), 
\end{align}$$

e em sequência define-se a seguinte função objetivo que podemos simplifcar utilizando expansão polinomial de newton em conjunto com propriedades do operador transposto

$$\begin{align}
    \notag \mathbb{E}\{e^{4}(n)\} &= \mathbb{E}\{\left[d(n) - \boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n)\right]^{4}\}, \\
    \notag \mathbb{E}\{e^{4}(n)\} &= \mathbb{E}\{d^{4}(n)\} - 4\mathbb{E}\{d^{3}(n)\boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n)\} + 6\mathbb{E}\{d^{2}(n)\left[\boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n)\right]^{2}\} - 4\mathbb{E}\{d(n)\left[\boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n)\right]^{3}\} + \mathbb{E}\{\left[\boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n)\right]^{4}\}, \\
    \notag \mathbb{E}\{e^{4}(n)\} &= \mathbb{E}\{d^{4}(n)\} - 4\mathbb{E}\{d^{3}(n)\boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n)\} + 6\mathbb{E}\{d^{2}(n)\left[\boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n) \boldsymbol{x}^{\text{T}}(n)\boldsymbol{w}(n)\right]\} - 4 \mathbb{E}\{\boldsymbol{w}^{\text{T}}(n) d(n) \boldsymbol{x}(n) \boldsymbol{x}^{\text{T}}(n) \boldsymbol{x}(n) \boldsymbol{w}(n) \boldsymbol{w}^{\text{T}}(n) \} + \mathbb{E}\{\boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n) \boldsymbol{x}^{\text{T}}(n) \boldsymbol{w}(n) \boldsymbol{w}^{\text{T}}(n)\boldsymbol{x}(n) \boldsymbol{x}^{\text{T}}(n)\boldsymbol{w}(n)\}, \\
    \notag \mathbb{E}\{e^{4}(n)\} &= \mathbb{E}\{d^{4}(n)\} - 4 \boldsymbol{w}^{\text{T}}(n)\mathbb{E}\{d^{3}(n)\boldsymbol{x}(n)\} + 6 \boldsymbol{w}^{\text{T}}(n) \mathbb{E}\{d^{2}(n)\boldsymbol{x}(n) \boldsymbol{x}^{\text{T}}(n)\} \boldsymbol{w}(n) - 4\boldsymbol{w}^{\text{T}}(n) \mathbb{E}\{d(n) \boldsymbol{x}(n) \boldsymbol{x}^{\text{T}}(n) \boldsymbol{x}(n)\} \boldsymbol{w}(n) \boldsymbol{w}^{\text{T}}(n) + \boldsymbol{w}^{\text{T}}(n) \boldsymbol{w}(n) \mathbb{E}\{\boldsymbol{x}(n) \boldsymbol{x}^{\text{T}}(n) \boldsymbol{x}(n) \boldsymbol{x}^{\text{T}}(n)\} \boldsymbol{w}^{\text{T}}(n) \boldsymbol{w}(n), \\
\end{align}$$

---
## Problema 2

Considere o uso de um a sequência de ruído branco com média nula e variância $\sigma^{2}$ como entrada do algoritmo LMS. Avalie

(a) a condição para convergência do algoritmo em média quadrática.

(b) o erro em excesso em média quadrática.

---
## Problema 3

Avalie a questão anterior para o caso do algoritmo LMS-Normalizado. Compare os dois casos.

---
## Problema 4

Considere um sinal branco gaussiano de variância unitária transmitido por um canal de comunicação de função de transferência $H(z) = 1 + 1.6z^{-1}$. Para compensar este
canal utiliza-se um equalizador dado por $W(z) = w_{0} + w_{1}z^{-1}$ .

(a) Forneça o equalizador ótimo segundo o critério de Wiener. Esboce a posição dos zeros do canal e do equalizador no plano Z.

(b) Obtenha o ﬁltro de erro de predição direta de passo unitário, correspondente ao sinal à saída do canal. Calcule os zeros deste ﬁltro e compare com os do equalizador.

(c) Obtenha as trajetórias sobre as curvas de nível, tendo condições iniciais nulas para os coeﬁcientes do equalizador, para os seguintes algoritmos

- Algoritmo de Newton
- Gradiente Determinístico
- Least Means Square
- Least Means Square Normalizado

(d) Obtenha também a evolução do erro quadrático médio para cada um dos algoritmos anteriores.

(e) Qual o número de condicionamento para o problema em questão?

(f) Qual deveria ser o canal para que o número de condicionamento fosse menor/maior que 5?
Comente os resultados.

---
## Problema 5

Utilize o algoritmo LMS para identiﬁcar um sistema com a função de transferência dada abaixo.

$$\begin{align}
    H(z) = \frac{1 - z^{-12}}{1 - z^{-1}}
\end{align}$$

O sinal de entrada é um ruído branco distribuído uniformemente com variância $\sigma^{2}_{x} = 1$, e o ruído de medida é assumido gaussiano branco descorrelacionado da entrada e com variância de entrada 
$\sigma^{2}_{v} = 10^{-3}$ . O ﬁltro adaptativo tem 12 coeﬁcientes.

(a) Calcule o limite superior para $\mu$ (ou seja $\mu_{\text{max}}$) para garantir a estabilidade do algoritmo.

(b) Execute o algoritmo para $\frac{\mu_{\text{max}}}{2}$, $\frac{\mu_{\text{max}}}{10}$ e $\frac{\mu_{\text{max}}}{50}$. Comente sobre o comportamento da convergência de cada caso.

(c) Meça o desajuste (misadjustment ) em cada exemplo e comparar com os resultados obtidos pela solução teórica (Eq. (3.50) do livro texto)

(d) Mostre o gráﬁco da resposta em frequência do ﬁltro FIR em qualquer uma das iterações após a convergência ser obtida e compare com o sistema desconhecido.

## Problema 6

Seja o canal de comunicações dado por

$$\begin{align}
    H(z) = 0.5 + 1.2z^{-1} + 1.5z^{-2} + z^{-3},
\end{align}$$

e deseja-se projetar um equalizar para o mesmo. A estrutura do equalizador é mostrada na Figura abaixo. Os símbolos $s(n)$ são transmitidos através de um canal e corrompidos por ruído aditivo
gaussiano branco complexo $v(n)$. O sinal recebido $x(n)$ é processado pelo equalizador FIR para gerar estimativas $\overset{\sim}{s}(n - \delta)$, as quais são passados por um dispositivo decisor gerando símbolos $\hat{s}(n − \delta)$. O equalizador possui dois modos de operação: um modo de treinamento durante o
qual uma versão atrasada e replicada da sequência de entrada é usada como o sinal de referência (desejado) e um modo dirigido por decisão no qual a saída do dispositivo de decisão substitui a
sequência de referência. O sinal de entrada $s(n)$ é escolhido de uma constelação QAM (por exemplo, 4-QAM, 16-QAM, 64-QAM ou 256-QAM).

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