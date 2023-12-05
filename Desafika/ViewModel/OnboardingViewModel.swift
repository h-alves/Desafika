//
//  OnboardingViewModel.swift
//  Desafika
//
//  Created by Henrique Semmer on 28/11/23.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    func createList() {
        let completeList: [Challenge] = [
            // CASA:
            
            Challenge(description: "Crie uma lista de pistas e esconda pequenos presentes ou notas em diferentes locais da casa ou do bairro. Deixe seu parceiro decifrar as pistas e encontrar os tesouros.", category: .house, progress: .none),
            Challenge(description: "Passem um dia sem tecnologia, desligando os celulares e dedicando tempo de qualidade um ao outro.", category: .house, progress: .none),
            Challenge(description: "Organizem uma sessão de fotos onde vocês se vestem e posam como personagens famosos de filmes ou séries de TV", category: .house, progress: .none),
            Challenge(description: "Escolham um país e preparem juntos um jantar com pratos típicos daquele lugar. Pesquisem receitas, comprem os ingredientes e divirtam-se cozinhando juntos.", category: .house, progress: .none),
            Challenge(description: "Cada um escolhe um filme que gosta/quer assistir, mas o parceiro não costuma gostar para assistirem juntos.", category: .house, progress: .none),
            Challenge(description: "Tentem construir uma fortaleza gigante usando apenas móveis, cobertores e travesseiros, e passem a noite lá dentro.", category: .house, progress: .none),
            Challenge(description: "Tentem cozinhar uma receita desafiadora juntos, como um soufflé ou um prato étnico complexo.", category: .house, progress: .none),
            Challenge(description: "Durante 5 minutos, conversem soletrando pelo menos uma das palavras da frase que irá falar.", category: .house, progress: .none),
            Challenge(description: "Montem um quebra-cabeça de mil peças em tempo recorde, com direito a contagem regressiva.", category: .house, progress: .none),
            Challenge(description: "Organizem uma competição de quem consegue fazer a careta mais engraçada em frente a um espelho.", category: .house, progress: .none),
            Challenge(description: "Criem um álbum de fotos ou scrapbook com as melhores lembranças do relacionamento, adicionando legendas e anotações personalizadas.", category: .house, progress: .none),
            Challenge(description: "Organizem uma competição de dublagem de filmes, onde cada um escolhe um personagem e deve dublar suas falas de forma engraçada.", category: .house, progress: .none),
            Challenge(description: "Completem um quebra-cabeça desafiador, dedicando algumas horas para resolver todas as peças.", category: .house, progress: .none),
            Challenge(description: "Cada um deve cozinhar uma refeição usando apenas ingredientes bizarros ou incomuns.", category: .house, progress: .none),
            Challenge(description: "Comprem e degustem bebidas que nenhum dos dois tenha experimentado anteriormente.", category: .house, progress: .none),
            Challenge(description: "Realizem uma competição de imitação de celebridades, onde cada um escolhe um famoso para imitar e vocês tentam adivinhar quem é.", category: .house, progress: .none),
            Challenge(description: "Criem um jogo de tabuleiro personalizado, com regras malucas e desafios engraçados, e divirtam-se jogando juntos.", category: .house, progress: .none),
            Challenge(description: "Realizem uma sessão de fotos extravagante e engraçada, com roupas e acessórios malucos, poses exageradas e cenários inusitados.", category: .house, progress: .none),
            Challenge(description: "Realizar uma sessão de massagem.", category: .house, progress: .none),
            Challenge(description: "Criem um apelido ridículo e usem um com o outro durante o dia inteiro.", category: .house, progress: .none),
            Challenge(description: "Transformem uma área de sua casa em um labirinto, desafiando um ao outro a encontrar o caminho mais rápido até o final.", category: .house, progress: .none),
            Challenge(description: "Criem um prato culinário inusitado e convidem amigos para experimentarem.", category: .house, progress: .none),
            Challenge(description: "Realizem um concurso de dublagem, escolhendo uma música e interpretando-a de maneira exagerada e divertida.", category: .house, progress: .none),
            Challenge(description: "Criem um bolo ou uma sobremesa totalmente maluca e decorá-la de forma criativa e exagerada.", category: .house, progress: .none),
            Challenge(description: "Realizem uma competição de quem consegue equilibrar mais objetos estranhos na cabeça, como colheres, livros ou frutas.", category: .house, progress: .none),
            Challenge(description: "Façam uma escultura de argila às cegas, onde um de vocês vende os olhos e o outro molda a argila.", category: .house, progress: .none),
            Challenge(description: "Inventem um novo idioma e tentem se comunicar exclusivamente nele por um dia inteiro.", category: .house, progress: .none),
            Challenge(description: "Organizem uma festa temática em casa, onde vocês devem se vestir e agir como personagens de filmes, desenhos animados ou épocas históricas específicas.", category: .house, progress: .none),
            Challenge(description: "Passem um dia inteiro falando apenas em rimas, criando frases engraçadas e inventivas.", category: .house, progress: .none),
            Challenge(description: "Comprem uma caixa de legos e construam uma estrutura gigante juntos, sem seguir nenhuma instrução, apenas usando a criatividade.", category: .house, progress: .none),
            Challenge(description: "Organizem uma competição de \"mímica maluca\", onde um de vocês deve representar objetos ou situações sem usar palavras.", category: .house, progress: .none),
            Challenge(description: "Mantenham uma conversa inteira usando apenas palavras que começam com a mesma letra.", category: .house, progress: .none),
            Challenge(description: "Façam um piquenique dentro de casa, com direito a cesta, toalha e comidinhas, mesmo sem ter um espaço externo.", category: .house, progress: .none),
            Challenge(description: "Joguem videogames antigos e clássicos, como Super Mario ou Pac-Man, e vejam quem consegue a maior pontuação.", category: .house, progress: .none),
            Challenge(description: "Invertam a ordem das refeições durante um dia, começando pelo jantar, seguido pelo almoço e terminando com o café da manhã.", category: .house, progress: .none),
            Challenge(description: "Preparem um jantar sem utensílios modernos, usando apenas as mãos e objetos improvisados.", category: .house, progress: .none),
            Challenge(description: "Criem charadas ou enigmas malucos um para o outro e vejam quem consegue resolver mais.", category: .house, progress: .none),
            Challenge(description: "Passem uma noite contando histórias de terror um para o outro, criando uma atmosfera sombria e explorando a imaginação.", category: .house, progress: .none),
            Challenge(description: "Leiam contos de terror em voz alta um para o outro, criando um ambiente assustador com luz de velas e música sinistra.", category: .house, progress: .none),
            Challenge(description: "Transformem uma noite chuvosa em um spa caseiro, com máscaras faciais e massagens.", category: .house, progress: .none),
            Challenge(description: "Decorem camisetas brancas com tintas e canetas coloridas para criar uma roupa personalizada.", category: .house, progress: .none),
            Challenge(description: "Transformem um dia chato de limpeza em uma festa de dança, colocando músicas animadas enquanto organizam a casa.", category: .house, progress: .none),
            Challenge(description: "Escrevam uma história em conjunto, cada um adicionando uma frase por vez, alternadamente.", category: .house, progress: .none),
            Challenge(description: "Cozinhem um prato novo e exótico, seguindo uma receita em outro idioma.", category: .house, progress: .none),
            Challenge(description: "Planejem uma noite de jogos de tabuleiro com um toque de suspense, utilizando lanternas para iluminar o ambiente.", category: .house, progress: .none),
            Challenge(description: "Planejem um dia de \"relembrar a infância\", jogando jogos de videogame antigos, assistindo a desenhos animados clássicos e fazendo lanches favoritos da época.", category: .house, progress: .none),
            Challenge(description: "Organizem um \"concurso de cozinha\", onde cada um tem que criar uma receita exclusiva usando ingredientes pré-determinados.", category: .house, progress: .none),
            Challenge(description: "Criem uma noite de stand-up comedy em casa, onde cada um tem que contar piadas engraçadas para o outro.", category: .house, progress: .none),
            Challenge(description: "Peçam o item mais barato que encontrarem em um delivery de comida.", category: .house, progress: .none),
            Challenge(description: "Tenham um jantar temático de \"comida de cinema\", preparando pratos que são destaque em filmes famosos.", category: .house, progress: .none),
            Challenge(description: "Planejem uma sessão de \"cinema ao ar livre\" no quintal, com cobertores, pipoca e computador.", category: .house, progress: .none),
            Challenge(description: "Planejem um encontro de cinema em casa, com direito a ingressos, pipoca e cobertores.", category: .house, progress: .none),
            Challenge(description: "Assistam a um filme mudo e tentem dublar os diálogos, improvisando vozes e efeitos sonoros.", category: .house, progress: .none),
            Challenge(description: "Criem uma paródia de um filme conhecido, reescrevendo a história com um tema completamente diferente.", category: .house, progress: .none),
            Challenge(description: "Recriem uma cena de romance de um filme usando apenas expressões faciais, sem falar uma palavra.", category: .house, progress: .none),

            // PARQUE:
            
            Challenge(description: "Vão a um parque e façam uma competição para ver quem encontra mais espécies de animais", category: .park, progress: .none),
            Challenge(description: "Realizem um torneio de bolhas de sabão em um parque, com desafios extras, como fazer a bolha mais gigante ou a bolha que dura mais tempo.", category: .park, progress: .none),
            Challenge(description: "Realizem uma competição de imitação de animais, tentando reproduzir os sons e os movimentos de maneira engraçada.", category: .park, progress: .none),
            Challenge(description: "Transformem uma caminhada no parque em uma competição de quem encontra o objeto mais estranho.", category: .park, progress: .none),
            Challenge(description: "Organizem um concurso de imitações de animais em um zoológico ou reserva natural.", category: .park, specificSearch: "zoológico", progress: .none),
            Challenge(description: "Sigam as pegadas de animais pelo parque e tentem adivinhar quais espécies deixaram as marcas.", category: .park, progress: .none),
            Challenge(description: "Comprem telas pequenas e tintas acrílicas. Pintem um retrato um do outro sem revelar o resultado até o final. Depois, mostrem as pinturas e vejam como ficaram.", category: .park, progress: .none),
            Challenge(description: "Tirem fotos engraçadas em um zoológico ou parque temático, interagindo com os animais e atrações de forma divertida.", category: .park, progress: .none),
            Challenge(description: "Realizem uma competição de \"pior pintura\", onde cada um deve pintar um quadro com as cores mais extravagantes e técnicas duvidosas.", category: .park, progress: .none),
            Challenge(description: "Organizem um piquenique romântico em um parque local e preparem uma cesta cheia de comidas deliciosas.", category: .park, progress: .none),
            Challenge(description: "Criem uma obra de arte abstrata utilizando apenas materiais reciclados e objetos do dia a dia.", category: .park, progress: .none),
            Challenge(description: "Façam uma pintura juntos, mas com os pincéis amarrados nos dedos, resultando em uma obra de arte única.", category: .park, progress: .none),
            Challenge(description: "Criem uma pintura colaborativa com as mãos em um grande quadro ou tela.", category: .park, progress: .none),
            Challenge(description: "Criem uma pintura em conjunto, onde cada um deve adicionar um elemento à obra, alternando entre vocês.", category: .park, progress: .none),
            Challenge(description: "Realizem uma sessão de fotos temática em locais turísticos, imitando poses de estátuas ou monumentos famosos.", category: .park, progress: .none),
            Challenge(description: "Realizem uma sessão de pintura em grupo em um local público, convidando outras pessoas para se juntarem e criarem obras de arte colaborativas.", category: .park, progress: .none),
            Challenge(description: "Realizem uma competição de \"pegadinhas\" um com o outro em um parque, tentando pregar sustos engraçados em pessoas desconhecidas.", category: .park, progress: .none),
            Challenge(description: "Imitem super-heróis em um parque, criando poses e falas épicas como se fossem personagens com superpoderes, envolvendo as pessoas que estiverem por perto.", category: .park, progress: .none),
            Challenge(description: "Tirem fotos criativas em que brinquem com a perspectiva, criando ilusões de ótica engraçadas.", category: .park, progress: .none),
            Challenge(description: "Façam bolhas de sabão gigantes e tentem estourá-las antes que elas estourem no chão.", category: .park, progress: .none),
            Challenge(description: "Planejem um dia de \"turista na própria cidade\", visitando pontos turísticos locais e tirando fotos engraçadas.", category: .park, progress: .none),
            Challenge(description: "Planejem uma sessão de fotos espontânea em um parque, capturando momentos divertidos e descontraídos.", category: .park, progress: .none),
            Challenge(description: "Tenham um dia de \"fotógrafos de natureza\", explorando um parque ou reserva natural e registrando a beleza ao seu redor.", category: .park, progress: .none),
            Challenge(description: "Em um parque ou praça movimentada, puxem conversa com estranhos de forma engraçada e divertida.", category: .park, progress: .none),
            Challenge(description: "Tenham um dia de \"piquenique gourmet\", preparando comidas sofisticadas para desfrutar ao ar livre.", category: .park, progress: .none),
            Challenge(description: "Façam um piquenique em um jardim botânico.", category: .park, specificSearch: "jardim botânico", progress: .none),

            // MUSEU:
            
            Challenge(description: "Criem uma sessão de fotos engraçadas em um museu, interagindo com as obras de arte de forma divertida.", category: .museum, progress: .none),
            Challenge(description: "Visitem um museu ou exposição de arte e discutam suas impressões sobre as obras expostas.", category: .museum, progress: .none),
            Challenge(description: "Visitem um museu e deem nomes engraçados para as obras expostas", category: .museum, progress: .none),
            Challenge(description: "Visitem uma exposição fingindo que são críticos de arte.", category: .museum, progress: .none),
            Challenge(description: "Criem histórias fictícias sobre as pinturas ou esculturas que vocês encontrarem no museu, inventando narrativas engraçadas e surreais.", category: .museum, progress: .none),
            Challenge(description: "Encontrem as peças mais estranhas ou curiosas do museu e criem histórias malucas sobre como elas foram parar lá.", category: .museum, progress: .none),
            Challenge(description: "Organizem uma caça ao tesouro dentro do museu, criando pistas divertidas e desafiadoras que levem a diferentes obras de arte.", category: .museum, progress: .none),
            Challenge(description: "Façam um desenho rápido, onde vocês escolhem uma obra de arte e têm apenas alguns minutos para tentar reproduzi-la da maneira mais engraçada possível.", category: .museum, progress: .none),
            Challenge(description: "Façam uma visita guiada fictícia pelo museu, onde um de vocês se passa por um guia maluco e improvisa informações engraçadas sobre as peças.", category: .museum, progress: .none),
            Challenge(description: "Escrevam um poema ou uma história em formato de rap inspirada em uma obra de arte do museu, com rimas e versos divertidos.", category: .museum, progress: .none),
            Challenge(description: "Realizem uma competição de adivinhação, onde vocês escolhem uma obra de arte e tentam adivinhar o título real ou inventam títulos engraçados.", category: .museum, progress: .none),
            Challenge(description: "Façam uma competição de quem consegue encontrar o objeto mais estranho ou incomum no museu.", category: .museum, progress: .none),
            Challenge(description: "Tente encontrar objetos nas pinturas que se assemelham a objetos reais dentro do museu e tirem uma foto comparativa.", category: .museum, progress: .none),
            Challenge(description: "Encontrem uma obra de arte que se pareça com um de vocês e tirem uma foto lado a lado.", category: .museum, progress: .none),
            Challenge(description: "Encontrem uma obra de arte que represente uma cena engraçada e criem uma legenda para ela.", category: .museum, progress: .none),
            Challenge(description: "Procurem uma obra de arte que represente uma cena romântica e tirem uma foto em uma pose semelhante.", category: .museum, progress: .none),
            Challenge(description: "Procurem por feiras de artesanato locais e desafiem-se a encontrar objetos artesanais de uma cor escolhida. Apoiem os artistas locais e descubram peças únicas.", category: .museum, specificSearch: "feira de artesanato", progress: .none),
            Challenge(description: "Vão ao museu e presenteiem um ao outro com uma lembrança da loja de souvenirs.", category: .museum, progress: .none),

            // RESTAURANTE:
            
            Challenge(description: "Vão em uma confeitaria e cada um escolhe um doce diferente para o outro experimentar.", category: .restaurant, specificSearch: "confeitaria", progress: .none),
            Challenge(description: "Cada um deve criar uma combinação inusitada de sabores de café, chá ou sobremesas e experimentá-las.", category: .restaurant, specificSearch: "confeitaria", progress: .none),
            Challenge(description: "Visitem diferentes cafeterias ou confeitarias e experimentem o maior número possível de sobremesas em um determinado período de tempo.", category: .restaurant, specificSearch: "confeitaria", progress: .none),
            Challenge(description: "Vão a uma confeitaria e deixem que um escolha o pedido do outro, para fazer uma surpresa.", category: .restaurant, specificSearch: "confeitaria", progress: .none),
            Challenge(description: "Preparem um date romântico usando apenas comidas cor de rosa. Podem ser cupcakes, macarons, sorvetes, bebidas, frutas ou qualquer outra comida nessa tonalidade.", category: .restaurant, specificSearch: "confeitaria", progress: .none),
            Challenge(description: "Misturem os sabores de sorvete mais malucos e experimentem cada um deles.", category: .restaurant, specificSearch: "sorveteria", progress: .none),
            Challenge(description: "Encontrem e experimentem os sabores de sorvete mais estranhos em uma sorveteria local.", category: .restaurant, specificSearch: "sorveteria", progress: .none),
            Challenge(description: "Procurem por um restaurante com uma proposta de culinária molecular, onde pratos são preparados com técnicas e apresentações inovadoras.", category: .restaurant, specificSearch: "restaurante molecular", progress: .none),
            Challenge(description: "Vão a um restaurante de comida japonesa e vejam quem consegue comer mais peças de sushi.", category: .restaurant, specificSearch: "restaurante japonês", progress: .none),
            Challenge(description: "Vá em um lugar com o cardápio em outro idioma e peça a comida traduzindo em português, nenhum dos dois pode falar qualquer coisa em outro idioma, apenas em português", category: .restaurant, progress: .none),
            Challenge(description: "Vão a um restaurante e peçam algo que nenhum dos dois nunca tenha pedido.", category: .restaurant, progress: .none),
            Challenge(description: "Vão a um restaurante e peçam algo que nenhum dos dois comeriam normalmente.", category: .restaurant, progress: .none),
            Challenge(description: "Apostem quem consegue comer mais.", category: .restaurant, progress: .none),
            Challenge(description: "Vão a um restaurante e o avaliem como se fossem críticos profissionais de culinária.", category: .restaurant, progress: .none),
            Challenge(description: "Realizem um tour gastronômico pela sua cidade, provando pratos típicos de diferentes restaurantes ou lanchonetes.", category: .restaurant, progress: .none),
            Challenge(description: "Procurem por um restaurante com uma proposta de culinária molecular, onde pratos são preparados com técnicas e apresentações inovadoras.", category: .restaurant, progress: .none),
            Challenge(description: "Procurem um restaurante com um cardápio exótico e experimentem pratos incomuns ou ingredientes diferentes.", category: .restaurant, progress: .none),
            Challenge(description: "Criem um jogo de adivinhação de sabores, onde um de vocês venda os olhos e o outro ofereça diferentes alimentos para serem identificados.", category: .restaurant, progress: .none),
            Challenge(description: "Tente pedir o prato mais exótico do cardápio e descrevam suas reações ao experimentá-lo.", category: .restaurant, progress: .none),
            Challenge(description: "Criem um jogo de adivinhação, onde cada um pede um prato para o outro sem revelar o nome, e o outro precisa adivinhar qual é.", category: .restaurant, progress: .none),
            Challenge(description: "Criem um jogo de adivinhação, onde cada um pede um prato para o outro sem revelar o nome, e o outro precisa adivinhar qual é.", category: .restaurant, progress: .none),
            Challenge(description: "Comam tudo com a mão não dominante.", category: .restaurant, progress: .none),
            Challenge(description: "Criem um esquema de pontuação não convencional para avaliar os pratos e dêem notas para cada um deles.", category: .restaurant, progress: .none),
            Challenge(description: "Tentem adivinhar os ingredientes principais de cada prato que pedirem.", category: .restaurant, progress: .none),
            Challenge(description: "Peçam ao garçom para recomendar o prato mais picante do menu e vejam quem consegue comê-lo sem beber água.", category: .restaurant, progress: .none),
            Challenge(description: "Tentem pedir cada item do menu de uma forma diferente, como sussurrando ou cantando.", category: .restaurant, progress: .none),
            Challenge(description: "Montem um prato artístico com os alimentos antes de começar a comer.", category: .restaurant, progress: .none),
            Challenge(description: "Façam um pedido de comida sem falar, apenas usando gestos e expressões faciais.", category: .restaurant, progress: .none),
            Challenge(description: "Troquem de pratos a cada três garfadas.", category: .restaurant, progress: .none),
            Challenge(description: "Peçam ao garçom para escolher pratos aleatórios para vocês.", category: .restaurant, progress: .none),
            Challenge(description: "Tentem aprender algumas palavras básicas do idioma do país de origem do restaurante e usem elas para fazer o pedido.", category: .restaurant, progress: .none),
            Challenge(description: "Escolham pratos apenas pelos nomes mais engraçados do menu.", category: .restaurant, progress: .none),
            Challenge(description: "Peçam para o atendente selecionar algumas sobremesas e desafiem-se a adivinhar quais são apenas pelo sabor.", category: .restaurant, progress: .none),
            Challenge(description: "Vão a uma lanchonete e tentem montar o lanche mais extravagante e criativo, utilizando ingredientes e combinações inusitadas.", category: .restaurant, progress: .none),
            Challenge(description: "Tenham um encontro no estilo anos 80, vestindo roupas retrô e comendo comidas da época.", category: .restaurant, progress: .none),
            Challenge(description: "Jantem em um restaurante temático, como um local inspirado em filmes de terror ou contos de fadas", category: .restaurant, specificSearch: "restaurante temático", progress: .none),
            
            // AMBIENTE PÚBLICO:
            
            Challenge(description: "Vão a um lugar e ambos só poderão se movimentar saltitando", category: .ambient, progress: .none),
            Challenge(description: "Façam um passeio de bicicleta pela cidade, explorando novos bairros e parando em cafeterias ou pontos turísticos ao longo do caminho.", category: .ambient, specificSearch: "aluguel de bicicleta", progress: .none),
            Challenge(description: "Façam uma sessão de fotos engraçadas em um supermercado.", category: .ambient, specificSearch: "mercado", progress: .none),
            Challenge(description: "Vão a um shopping e preparem uma caixa com presentes surpresas para dar para o parceiro.", category: .ambient, specificSearch: "shopping", progress: .none),
            Challenge(description: "Visitem uma livraria e escolham livros um para o outro sem saber o título ou a sinopse.", category: .ambient, specificSearch: "livraria", progress: .none),
            Challenge(description: "Visitem uma livraria e encontrem um livro com a capa predominantemente de uma cor específica. Depois, presenteiem-se com os livros escolhidos.", category: .ambient, specificSearch: "livraria", progress: .none),
            Challenge(description: "Escolham um dia para visitar uma feira ou festival local e experimentar comidas típicas diferentes.", category: .ambient, specificSearch: "feira", progress: .none),
            Challenge(description: "Pesquisem sobre eventos de comida de rua na cidade e experimentem pratos de diferentes foodtrucks ou barraquinhas.", category: .ambient, specificSearch: "feira", progress: .none),
            Challenge(description: "Encontrem objetos específicos em um mercado de pulgas ou feira local.", category: .ambient, specificSearch: "feira", progress: .none),
            Challenge(description: "Participar de um campeonato pequeno de algum esporte, como ciclismo ou xadrez", category: .ambient, progress: .none),
            Challenge(description: "Realizem uma competição de esculturas de areia em uma praia movimentada, desafiando outros casais a participarem.", category: .ambient, progress: .none),
            Challenge(description: "Inventem uma história absurda e improvisem ela em público, interagindo com estranhos e fazendo com que a história evolua de forma hilária.", category: .ambient, progress: .none),
            Challenge(description: "Passem um dia inteiro se comunicando apenas através de charadas e gestos, sem usar palavras.", category: .ambient, progress: .none),
            Challenge(description: "Vão a uma loja de departamento e tentem se vestir com as roupas mais estranhas que encontrarem.", category: .ambient, progress: .none),
            Challenge(description: "Peçam autógrafos de pessoas aleatórias nas ruas.", category: .ambient, progress: .none),
            Challenge(description: "Tentem convencer um estranho de uma história fictícia inusitada e vejam por quanto tempo conseguem mantê-la.", category: .ambient, progress: .none),
            Challenge(description: "Tentem completar uma lista de tarefas engraçadas, como dar um abraço grátis para alguém, ou oferecer um elogio sincero a um estranho.", category: .ambient, progress: .none),
            Challenge(description: "Criem e distribuam adesivos personalizados com mensagens engraçadas para pessoas nas ruas.", category: .ambient, progress: .none),
            Challenge(description: "Um de vocês escolherá roupas e acessórios excêntricos para o outro usar durante um dia.", category: .ambient, progress: .none),
            Challenge(description: "Façam um \"pegar ou largar\" em um mercado ou loja, onde um de vocês coloca coisas aleatórias em uma cesta e o outro deve decidir se pega o objeto ou larga.", category: .ambient, progress: .none),
            Challenge(description: "Saiam de casa usando pijamas divertidos e façam atividades do dia-a-dia.", category: .ambient, progress: .none),
            Challenge(description: "Saiam de casa usando roupas extravagantes, com combinações inusitadas e cores vibrantes, e aproveitem a reação das pessoas.", category: .ambient, progress: .none),
            Challenge(description: "Estilizem o cabelo um do outro de maneiras completamente malucas e saiam em público.", category: .ambient, progress: .none),
            Challenge(description: "Saiam para um passeio e tirem fotos improvisadas em lugares inusitados, como se estivessem fazendo uma sessão de fotos profissional.", category: .ambient, progress: .none),
            Challenge(description: "Preparem um piquenique com comidas que têm texturas, sabores e cheiros diferentes e experimentem cada uma delas vendados, usando apenas os sentidos.", category: .ambient, progress: .none),
            Challenge(description: "Peguem um transporte público sem destino definido e desçam em uma estação aleatória para explorar a área.", category: .ambient, progress: .none),
            Challenge(description: "Escolham uma palavra proibida para o dia e, sempre que alguém a disser, deverá fazer uma dança ou dar um presente para o outro.", category: .ambient, progress: .none),
            Challenge(description: "Escolham um dia para se vestirem apenas com roupas de cor neon.", category: .ambient, progress: .none),
            Challenge(description: "Visitem uma loja de artigos de festa e escolham acessórios divertidos para usar durante o dia.", category: .ambient, progress: .none),
            Challenge(description: "Escolham um dia para se vestirem apenas com roupas de uma cor específica.", category: .ambient, progress: .none),
            Challenge(description: "Planejem um dia de 'exploração de arte de rua', visitando murais e grafites pela cidade e tirando fotos divertidas.", category: .ambient, progress: .none),
            Challenge(description: "Em um local movimentado, finjam ser outras pessoas, inventando histórias e características fictícias para se divertirem.", category: .ambient, progress: .none),
            Challenge(description: "Passem um dia inteiro fazendo tudo ao contrário, desde a forma de se vestir até a maneira de falar e agir.", category: .ambient, progress: .none),
            Challenge(description: "Escolham aleatoriamente um ponto no mapa e explorem um lugar próximo que vocês nunca visitaram antes.", category: .ambient, progress: .none),
            Challenge(description: "Visitem uma loja de presentes e encontrem um presente surpresa para o outro, dentro de um tema específico de cor, como 'presente azul' ou 'presente verde'.", category: .ambient, progress: .none),
            Challenge(description: "Planejem um encontro onde ambos devem vestir roupas predominantemente de uma cor específica, criando looks criativos e estilosos.", category: .ambient, progress: .none),
            Challenge(description: "Definam uma cor específica, encontrem e comprem o maior número possível de itens nessa cor durante uma sessão de compras.", category: .ambient, progress: .none),

            // CINEMA:
            
            Challenge(description: "Procurem uma série/filme de suspense e cada um deve tentar resolver os mistérios ou enigmas, ganha quem chegar mais perto de desvendar o desfecho da história.", category: .movie, progress: .none),
            Challenge(description: "Escolham objetivamente o pior filme em cartaz para assistir", category: .movie, progress: .none),
            Challenge(description: "Façam uma maratona de filmes de comédia e façam um desafio de tente não rir.", category: .movie, progress: .none),
            Challenge(description: "Realizem um encontro fingindo que ambos não se conhecem.", category: .movie, progress: .none),
            Challenge(description: "Assistam a um filme clássico juntos e depois recriem uma cena icônica dele.", category: .movie, progress: .none),
            Challenge(description: "Escolham um filme clássico e depois tentem reproduzir o estilo de atuação dos personagens em uma cena improvisada.", category: .movie, progress: .none),
            Challenge(description: "Assistam um filme e tentem adivinhar sua trama antes apenas lendo o título e vendo o pôster, sem consultar sinopses ou trailers.", category: .movie, progress: .none),
            Challenge(description: "Assistam um filme de um gênero totalmente oposto ao que vocês costumam consumir e discutam suas opiniões sobre ele.", category: .movie, progress: .none),
            Challenge(description: "Escolham um filme de suspense e façam um jogo de adivinhação, tentando descobrir o final antes que ele seja revelado.", category: .movie, progress: .none),
            Challenge(description: "Assistam um filme de registrem quem leva sustos mais vezes.", category: .movie, progress: .none),
            Challenge(description: "Inventem combinações inusitadas de alimentos para comer durante um filme, como pipoca com cobertura de chocolate ou batatas fritas com sorvete.", category: .movie, progress: .none),
            Challenge(description: "Assistam a um filme de terror e tentem fazer piadas e comentários engraçados para deixar a atmosfera mais leve.", category: .movie, progress: .none),
            Challenge(description: "Assistam a um filme de terror e tentem prever o que acontecerá em seguida, competindo para ver quem acerta mais vezes.", category: .movie, progress: .none),
            Challenge(description: "Assistam a uma sequência de filmes malucos e engraçados durante toda uma noite.", category: .movie, progress: .none),
            Challenge(description: "Verifiquem se há exibições de filmes clássicos restaurados nos cinemas locais e mergulhem na história do cinema.", category: .movie, progress: .none),
            Challenge(description: "Escolham um filme com personagens icônicos e preparem cosplays simples para usar durante a sessão.", category: .movie, progress: .none),
            Challenge(description: "Criem lanches temáticos baseados no filme que vão levar para o cinema, como pipoca com sabores diferentes, doces ou salgadinhos que combinem com a atmosfera do filme.", category: .movie, progress: .none),
            Challenge(description: "Antes de assistir ao filme, criem uma playlist de músicas que combinem com a atmosfera do filme. Ouçam a playlist no caminho para o cinema e criem uma experiência imersiva.", category: .movie, progress: .none),
            Challenge(description: "Escolham um tema relacionado ao filme e usem roupas ou acessórios temáticos durante a sessão.", category: .movie, progress: .none),
            Challenge(description: "Escolham um filme de suspense ou investigação e tentem desvendar o mistério antes que seja revelado na tela.", category: .movie, progress: .none),
            Challenge(description: "Escolham um horário e um gênero de filme, mas não revelem o título para o seu parceiro até chegarem ao cinema. Deixe que seja uma surpresa.", category: .movie, progress: .none)
        ]
        
        let _: [Challenge] = [
            Challenge(description: "Teste Casa", category: Category.house, progress: Progress.inProgress),
            Challenge(description: "Teste Cinema", category: Category.movie, progress: Progress.inProgress),
            Challenge(description: "Teste Ambiente", category: Category.ambient, progress: Progress.inProgress),
            Challenge(description: "Teste Museu", category: Category.museum, progress: Progress.inProgress),
            Challenge(description: "Teste Parque", category: Category.park, progress: Progress.none),
            Challenge(description: "Teste Restaurante", category: Category.restaurant, progress: Progress.none),
            
            Challenge(description: "Teste Casa 2", category: Category.house, progress: Progress.none),
            Challenge(description: "Teste Cinema 2", category: Category.movie, progress: Progress.none),
            Challenge(description: "Teste Ambiente 2", category: Category.ambient, progress: Progress.none),
            Challenge(description: "Teste Museu 2", category: Category.museum, progress: Progress.none),
            Challenge(description: "Teste Parque 2", category: Category.park, progress: Progress.none),
            Challenge(description: "Teste Restaurante 2", category: Category.restaurant, progress: Progress.none)
        ]
        
        ChallengeDataSource.shared.list = completeList
    }
}
