# Tokens — Podi

> Este repositório está configurado **só para a marca Podi**.
> Quando o design estiver fechado, ele será duplicado e a paleta trocada para Optimall.
> Trocar cor: mexer **só neste arquivo e nos `style`/`bgcolor`**. A estrutura HTML não muda.

## Cor de marca

**`#48DB84`** (verde Podi).

Contraste sobre branco: **1,79:1** — reprova em qualquer texto. Isso governa três regras:

| Situação | Cor certa | Por quê |
|---|---|---|
| Texto **em cima** do verde | `#101010` | 10,6:1. Texto branco sobre o verde é **proibido** |
| Texto/link de marca **sobre branco** | `#0C6E3B` | 6,4:1 — e 5,2:1 sobre a tag `#D4F0DF`, que é o piso real |
| Texto/link de marca no **dark mode** | `#6FE9A2` | 11,5:1 sobre `#1A1A1A` |

O `#48DB84` só entra como **fundo** — botão, tag, régua de destaque. Nunca como cor de texto.

Os **ícones sociais do rodapé usam a variante verde** `#48DB84` (`brand/assets/icones/*-green.png`) —
decisão de marca. Vale saber o que ela custa: 1,63:1 sobre a página clara `#EDF7F1` e
9,73:1 sobre o dark `#1A1A1A`. No modo claro o ícone é **decorativo**, não um alvo de leitura;
quem sustenta o link ali é o `alt` com o nome da rede e a área de toque, não a forma.
Nunca usar o verde para um ícone que precise carregar informação sozinho.

As outras variantes: `-roxo` `#9934FF` (cor da Tacla Labs) passa nos dois fundos,
`-black` some no dark (1,1:1), `-white` some no claro.

## Fundos

| Token | Hex | Uso |
|---|---|---|
| `page` | `#EDF7F1` | Fundo da mensagem, fora do container |
| `canvas` | `#EDF7F1` | Fundo do container 600px — mesma cor da página |
| `surface` | `#FFFFFF` | Fundo dos cards de seção e do card de header |
| `accent-soft` | `#D4F0DF` | Fundo de tag/eyebrow e de card de destaque |
| `hairline` | `#D2E7DA` | Divisores |

`page` e `canvas` são a mesma cor de propósito: o container não se destaca do fundo,
e quem constrói a estrutura visual são os **cards brancos**.

## Texto

| Token | Hex | Uso | Contraste sobre `page` |
|---|---|---|---|
| `ink` | `#101010` | Títulos e texto forte | 17,4:1 |
| `body` | `#4A4A4A` | Texto corrido | 8,1:1 |
| `muted` | `#6E6E6E` | Legal, legendas, rodapé | 4,7:1 |

## Dark mode

| Token | Hex |
|---|---|
| `page-dark` / `canvas-dark` | `#1A1A1A` |
| `surface-dark` | `#242424` |
| `accent-soft-dark` | `#16281E` |
| `header-card-dark` | `#FFFFFF` — o card do header **não** escurece: o "Tacla" do logo é preto |
| `accent-dark` | `#6FE9A2` |
| `ink-dark` | `#F5F5F5` |
| `body-dark` | `#C9C9C9` |
| `muted-dark` | `#8F8F8F` |
| `hairline-dark` | `#333333` |

O **CTA verde não inverte** no dark — `#48DB84` já contrasta sobre `#1A1A1A`.
Só o CTA neutro escuro (`#101010`) usa `.dm-btn` para virar branco.

## Tipografia

Stack: `'Inter',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif`

| Papel | Tamanho / line-height / peso |
|---|---|
| Hero headline | 30px / 38px / 600 |
| Section headline | 26px / 32px / 600 |
| Card title | 20px / 26px / 600 |
| Card title compacto | 17px / 23px / 600 |
| Body | 16px / 25px / 400 |
| Body small | 15px / 23px / 400 |
| Número de destaque | 32px / 38px / 600, letter-spacing -0.5px |
| Label de número | 14px / 20px / 400 |
| Eyebrow / tag | 12px / 16px / 600, letter-spacing 1px, uppercase |
| CTA | 15px / 15px / 600 |
| Legal | 12px / 18px / 400 |

O **label de número** (14px) é a única exceção ao piso de 15px do corpo de texto: ele é
legenda de um número grande, nunca texto corrido, e só aparece no `08-destaque-numeros`.

## Espaçamento e formas

Escala: `8 · 12 · 16 · 20 · 24 · 32 · 40 · 48`
- Container padding lateral: 32px desktop / 20px mobile
- Padding interno de card: 24–32px desktop / 16–20px mobile
- Gap entre seções: 32px · entre cards de uma mesma lista: 16px
- Raio: card 20px · imagem 12–16px · miniatura 12px · botão 100px

## Tamanhos de imagem

| Bloco | Exibição | Exportar (2x) |
|---|---|---|
| Hero / imagem de seção | 536 × auto | 1072 × auto |
| Card de notícia (topo) | 536 × auto | 1072 × auto |
| Miniatura compacta (1:1) | 160 desktop / 88 mobile | 320 × 320 |
| Artigo alternado | 248 × 248 | 496 × 496 |
| Logo | 180 × 24 | 360 × 48 |
| Ícone social | 22 × 22 | 44 × 44 |
