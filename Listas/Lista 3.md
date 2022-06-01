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

---
## Problema 2

Considere o uso de um a sequência de ruı́do branco com média nula e variância $\sigma^{2}$ como entrada do algoritmo LMS. Avalie

(a) a condição para convergência do algoritmo em média quadrática.

(b) o erro em excesso em média quadrática.

---
## Problema 3

Avalie a questão anterior para o caso do algoritmo LMS-Normalizado. Compare os dois casos.

---
## Problema 4

Considere um sinal branco gaussiano de variância unitária transmitido por um canal de comunicação de função de transferência $H(z) = 1 + 1.6z - 1$. Para compensar este
canal utiliza-se um equalizador dado por $W(z) = w_{0} + w_{1}z - 1$ .

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

(a)

(b)

(c)

(d)