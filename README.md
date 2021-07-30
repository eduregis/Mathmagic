# Mathmagic


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)
![Release Tag](https://img.shields.io/github/v/tag/eduregis/Mathmagic?color=gre&label=Release)

É um framework cujo objetivo é otimizar o desenvolvemento em atividades relacionadas ao meio estatístico cujo uso dessas funções minimizaria o tempo de implementação.

- [Medidas Estátisticas](#medidas-estatisticas)
    - [Medidas de Tendência Central](#medidas-de-tendencia-central)
        - [Métodos disponíveis](#metodos-disponiveis)
    	    - [Média Aritmética](#media-aritmetica)
    	    - [Média Ponderada](#media-ponderada)
    	    - [Média Geométrica](#media-geometrica)
    	    - [Mediana](#mediana)
    	    - [Moda](#moda)
    	    - [Percentil](#Percentil)
    	    - [Decil](#Decil)
    	    - [Quartil](#Quartil)
    - [Medidas de Dispersão](#medida-de-dispersao)
        - [Métodos disponíveis](#metodos-disponiveis)
    	    - [Variância](#variancia)
    	    - [Desvio-padrão](#desvio-padrao)
    	    - [Covariância](#covariancia)
    	    - [Correlação](#correlacao)
- [Installation](#installation)
- [License](#license)

## Medidas Estátisticas
São valores calculados para um conjunto de dados, e usados de alguma forma, para descrever e resumir estes dados. As medidas estatísticas são divididas em medidas de tendência central e medidas de dispersão.

### Medidas de Tendência Central
São as medidas estatísticas, obtidas para um conjunto de dados, cujos valores, geralmente, estão localizados em torno do centro deste conjunto de dados, estando eles ordenados.

#### Métodos Disponíveis
##### Média Aritmética
É a soma de todas as medições divididas pelo número de observações no conjunto de dados.
É definido por:
`.mean(array: [NSNumber]!)`
Ele recebe um array de NSNumbers e retorna um número do tipo **double** com o resultado da média aritmética. 
**Atenção:** Certifique-se de que os dois arrays possuam o mesmo tamanho, para que se obtenha o resultado correto.
```swift
let media = CentralTrendMeasures()
media.mean([2.0, 1.0, 6.0])
```


##### Média Ponderada
A média aritmética é a média de valor de um conjunto de dados. Essa média, por sua vez, pode ser ponderada, isto é, quando os dados usados no cálculo possuem pesos diferentes.
É definido por:
`.weightedMean(array: [NSNumber]!, weights: [NSNumber]!)`
Ele recebe dois arrays de NSNumbers, um com os números e o outro, com seus respectivos pesos. e retorna um número do tipo **double** com o resultado da média ponderada. 

```swift
let media = CentralTrendMeasures()
media.weightedMean([7.0, 6.0, 8.0, 7.5], [1, 2, 3, 4])
```

##### Média Geométrica
A média geométrica de um conjunto de números positivos é definida como o produto de todos os membros do conjunto elevado ao inverso do número de membros.
É definido por:
`.geometricMean(array: [NSNumber]!)`
Ele recebe um array de NSNumbers e retorna um número do tipo **double** com o resultado da média aritmética. 

```swift
let media = CentralTrendMeasures()
media.geometricMean([3.0, 12.0, 16.0, 36.0])
```

##### Mediana
Ocorre quando ordenados os elementos da amostra, a mediana é o valor (pertencente ou não à amostra) que a divide ao meio, isto é, 50% dos elementos da amostra são menores ou iguais à mediana e os outros 50% são maiores ou iguais à mediana.
É definido por:
`.median(array: [NSNumber]!)`
Ele recebe um array de NSNumbers e retorna um número do tipo **double** com o resultado da mediana. 

```swift
let media = CentralTrendMeasures()
media.median([5.8, 6.0, 2.0, 1.5, 7.5, 2.2])
```

##### Moda
É a soma de todas as medições divididas pelo número de observações no conjunto de dados.
É definido por:
`.mode(array: [NSNumber]!)`
Ele recebe um array de NSNumbers e retorna um **array de NSNumbers** com a(s) moda(s) do conjunto.

```swift
let media = CentralTrendMeasures()
media.mode([1.0, 2.0, 2.0, 1.0, 2.0, 1.0, 3.0])
```

##### Percentil
Em estatística descritiva, percentis são medidas que dividem a amostra (por ordem crescente dos dados) em 100 partes, cada uma com uma percentagem de dados aproximadamente igual. 
É definido por:
`.percentile(array: [NSNumber]!, percentile: NSNumber!)`
Ele recebe um array de NSNumbers e retorna um **array de NSNumbers** com a(s) moda(s) do conjunto.
**Atenção:** Caso o percentil pedido esteja fora do intervalo viável (abaixo ou acima dos extremos), o retorno será zero, esse comportamento é temporário.

```swift
let media = CentralTrendMeasures()
media.percentile([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0], 70)
```

##### Decil
Em estatística descritiva, decil é qualquer um dos nove valores que dividem os dados ordenados de uma variável em dez partes iguais, de modo que cada parte representa 1/10 da amostra ou população.
É definido por:
`.decile(array: [NSNumber]!, decile: NSNumber!)`
Ele recebe um array de NSNumbers com os dados da amostra e um NSNumber que indica o decil desejado e retorna um **double** com o valor do dele.
**Atenção:** Caso o decil pedido seja fora do intervalo viável (de 1 à 9), o retorno será zero, esse comportamento é temporário.

```swift
let media = CentralTrendMeasures()
media.decile([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0], 4)
```


##### Quartil
Na estatística descritiva, um quartil é qualquer um dos três valores que divide o conjunto ordenado de dados em quatro partes iguais, e assim cada parte representa 1/4 da amostra ou população.
Assim, no caso duma amostra ordenada,
- [x] **primeiro quartil** (designado por Q1/4) = quartil inferior = é o valor aos 25% da amostra ordenada = 25º percentil.
- [x] **segundo quartil** (designado por Q2/4) = mediana = é o valor até ao qual se encontra 50% da amostra ordenada = 50º percentil, ou 5º decil.
- [x] **terceiro quartil** (designado por Q3/4) = quartil superior = valor a partir do qual se encontram 25% dos valores mais elevados = valor aos 75% da amostra ordenada = 75º percentil'.

É definido por:
`.quartile(array: [NSNumber]!, quartile: NSNumber!)`
Ele recebe um array de NSNumbers com os dados da amostra e um NSNumber que indica o quartil desejado e retorna um **double** com o valor do quartil.
**Atenção:** Caso o quartil pedido esteja fora do intervalo viável (de 1 à 3), o retorno será zero, esse comportamento é temporário.

```swift
let media = CentralTrendMeasures()
media.quartile([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0], 1)
```

### Medidas de Dispersão
As medidas de dispersão são utilizadas para indicar o grau de variação dos elementos de um conjunto numérico em relação à sua média.

#### Métodos Disponíveis
##### Variância
A variância de uma variável aleatória é uma medida da sua dispersão estatística, indicando "o quão longe" em geral os seus valores se encontram do valor esperado.
É definido por:
`.variance(array: [NSNumber]!)`
Ele recebe um array de NSNumbers e retorna um número do tipo **double** com o resultado da variância. 

```swift
let dis = DispersionMeasures()
dis.variance([1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
```

##### Desvio-padrão
É uma medida de dispersão em torno de uma variável aleatória. Indica uma medida de dispersão dos dados em torno de média amostral.
É definido por:
`.standardDeviation(array: [NSNumber]!)`
Ele recebe um array de NSNumbers e retorna um número do tipo **double** com o resultado do desvio padrão. 

```swift
let dis = DispersionMeasures()
dis.standardDeviation([1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
```

##### Covariância
É uma medida do grau de interdependência (ou inter-relação) numérica entre duas variáveis aleatórias. O quão mais próximas de 0, mais independentes estas amostras são uma da outra.
É definido por:
`.covariance(X: [NSNumber]!, Y: [NSNumber]!)`
Ele recebe dois arrays de NSNumbers com as distribuições e retorna um número do tipo **double** com o resultado da covariância. 
**Atenção:** Certifique-se de que os dois arrays possuam o mesmo tamanho, para que se obtenha o resultado correto.

```swift
let dis = DispersionMeasures()
dis.covariance([1.0, 2.0, 3.0, 4.0, 5.0], [2.0, 3.0, 5.0, 8.0, 10.0])
```

##### Correlação
Na estatística o coeficiente de correlação de Pearson (r), mede a relação que existe entre duas variáveis dentro de uma mesma escala métrica. O quão mais próximas de 0, mais independentes estas amostras são uma da outra. O quão mais próximas de -1 ou 1, mas dependentes elas são uma da outra. O resultado sempre será entre -1 e 1. Um resultado negativo indica que elas se influenciam inversamente, se uma sabe, a outra desce, e vice-versa.
É definido por:
`.correlation(X: [NSNumber]!, Y: [NSNumber]!)`
Ele recebe dois arrays de NSNumbers com as distribuições e retorna um número do tipo **double** com o resultado da correlação. 
**Atenção:** Certifique-se de que os dois arrays possuam o mesmo tamanho, para que se obtenha o resultado correto.

```swift
let dis = DispersionMeasures()
dis.correlation([1.0, 2.0, 3.0, 4.0, 5.0], [2.0, 3.0, 5.0, 8.0, 10.0])
```


## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

Para importar o framework para um projeto, faça o seguinte:
- Abra um terminal na pasta do projeto e digite:
```sh
pod init
```
- Agora, um arquivo chamado Podfile foi criado na pasta do seu projeto, abra-o como bloco de notas e coloque antes da linha com 'end':
```
pod ‘Mathmagic', '~> 0.0.5’
```
remova a marcação de comentário (#) do comando # platform :ios, '9.0'.
mude também a versão minima de 9.0 para 14.0, no começo do arquivo.

- E então, volte ao termina e digite:
```sh
pod install
```
- Por fim, entre no projeto pelo .xcworkspace, criado após o pod install. Basta importar o framework com import.

## License

Mathmagic is available under the MIT license. See the LICENSE file for more info.
