# Brand — Podi

Camada mais alta do Podi Marketing OS. **Nada abaixo pode contradizer este arquivo.**

Se um pedido conflita com o que está aqui, a IA sinaliza o conflito em vez de alterar
a identidade. Ver `docs/governanca.md`.

---

## Marca

**Podi** — app e comunicação dos shoppings. Assinatura conjunta com **Tacla Labs** no
topo de toda peça (logo Podi à esquerda, Tacla Labs à direita).

Logos oficiais em `brand/assets/header/`. Na **assinatura conjunta**, sempre a versão light
mode (arte escura sobre fundo claro): o "Tacla" do logo é preto, então em fundo escuro a
assinatura vai dentro de uma placa branca — nunca se troca o arquivo por CSS.

O logo Podi **sozinho** tem uma versão vetorial monocromática: `logo-podi.svg`. Ela é uma
forma só, sem cor gravada — a cor vem de fora, por `currentColor`. É o arquivo a usar
sempre que o logo aparecer sem a Tacla Labs:

| Fundo | Cor do logo |
|---|---|
| Verde de marca `#48DB84` | Branco `#FFFFFF` |
| Preto `#101010` | Branco `#FFFFFF` |
| Branco ou claro | Verde de marca `#48DB84` |

Sobre fundo claro é **sempre o verde original `#48DB84`**, em qualquer tamanho — inclusive
na assinatura pequena do rodapé. Ele dá 1,63:1 ali, e é uma marca discreta de propósito:
como o ícone social verde do rodapé do e-mail, é ornamento, não alvo de leitura. O que
identifica a peça é a forma do logo, não o contraste dele.

**Logo não é texto.** A regra de contraste do verde governa palavras; o logo é uma marca
gráfica, e branco sobre o verde é como a Podi assina desde sempre. O que continua proibido
é **recolorir por filtro ou por efeito** — trocar a cor é trocar o `color` do SVG, e ponto.

## Cor de marca — e a regra que ela impõe

**`#48DB84`** (verde Podi). Contraste sobre branco: **1,79:1** — reprova em qualquer texto.

| Situação | Cor certa | Contraste |
|---|---|---|
| Texto **em cima** do verde | `#101010` | 10,6:1 — texto branco sobre o verde é **proibido** |
| Texto/link de marca **sobre branco** | `#0C6E3B` | 6,4:1 |
| Texto/link de marca no **dark mode** | `#6FE9A2` | 11,5:1 sobre `#1A1A1A` |

O `#48DB84` só entra como **fundo** — botão, tag, régua de destaque. **Nunca como cor
de texto.** Esta regra não é negociável em nenhum material, de e-mail a impresso.

Paleta completa e tokens derivados: `design-system/newsletter/tokens.md` (e-mail) e
`design-system/apresentacao/tokens.md` (apresentação).

## Cor secundária — roxo de detalhe

**`#9934FF`** (roxo Tacla Labs). Entra como **detalhe gráfico**, nunca como conteúdo.

| Onde pode | Onde não pode |
|---|---|
| Ícone, glifo dentro de chip claro | Texto corrido |
| Régua ou gradiente fino sob um título | Título, subtítulo, número de destaque |
| Bullet de lista, ponto de linha do tempo | Fundo de área grande — esse papel é do verde |
| Borda fina de container | Qualquer coisa **em cima do verde** (2,4:1) |

Contraste sobre branco: **4,9:1** — passaria em texto. A regra é mais restritiva de
propósito: **o verde é a marca, o roxo é tempero.** Se o roxo virar cor de texto, a peça
deixa de parecer Podi em duas ou três seções.

Como o ícone social verde, **um detalhe roxo nunca carrega informação sozinho**: ele
acompanha um rótulo, não substitui um.

Tokens derivados e as versões claras do roxo: `design-system/apresentacao/tokens.md`.

## As duas frentes

Mesma marca, mesma paleta. O que muda é público, tom e obrigação legal.

| | Cliente final | Endomarketing |
|---|---|---|
| Público | Consumidor dos shoppings, usuário do app | Colaboradores Podi |
| Objetivo | Promoções, eventos, novidades do app, aniversariantes | Cases de uso, resultados, bastidores |
| Tom | Direto, aspiracional, 1 CTA por bloco | Próximo, celebratório, foco em pessoas |
| Rodapé | Completo: razão social, endereço, motivo do recebimento, **descadastro**, privacidade e termos | Contato de comunicação interna / RH; sem descadastro |

**A diferença que não pode errar:** material para cliente final sem link de descadastro
é problema de entregabilidade e de LGPD.

## Fotografia

Direção fotográfica oficial: [`photography/STYLE-LOCK-PODI.md`](photography/STYLE-LOCK-PODI.md).
Vale para qualquer foto de marca, em qualquer material. O bloco `STYLE LOCK` se copia sem
editar uma palavra — é ele que faz as imagens parecerem do mesmo ensaio.

Lá o verde é figurino e objeto dentro da foto, não texto: a regra de contraste acima
continua valendo integralmente.

## Ativos e links fixos

Ver `brand/links-oficiais.md`. Não se inventa URL, não se cria arte nova para o que já tem.

## Sobre a duplicação para Optimall

Este repositório está configurado **só para a marca Podi**. Quando o design estiver
fechado, ele será duplicado e a paleta trocada para Optimall — a estrutura e as regras
continuam idênticas. Por isso: **nunca escreva cor solta.** Toda cor sai dos tokens.
