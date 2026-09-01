# Componentes — newsletter

Blocos de HTML de e-mail. **Copiar e colar** dentro do
[`templates/newsletter/base.html`](../../../templates/newsletter/base.html), no lugar marcado.
Não editar o arquivo do componente por campanha.

A numeração é a ordem em que os blocos costumam aparecer na peça.

| Arquivo | O que é |
|---|---|
| `00-hero-podi-news.html` | Header completo das edições do Podi News (ver abaixo) |
| `01-header.html` | Header padrão: logos Podi + Tacla Labs |
| `02-hero-title.html` | Headline de abertura |
| `02a-eyebrow.html` | Tag / eyebrow acima de um título |
| `02b-titulo-secao.html` | Título de seção |
| `03-hero-image.html` | Imagem de abertura, largura inteira |
| `04-texto-cta.html` | Bloco de texto com CTA |
| `05-card-quote.html` | Citação |
| `06-card-oferta.html` | Card de oferta |
| `07-artigos-alternados.html` | Artigos com imagem alternando esquerda/direita (1:1) |
| `08-destaque-numeros.html` | Números de destaque com label |
| `09-galeria-2col.html` | Galeria de duas colunas |
| `10-divider.html` | Divisor |
| `11-card-noticia.html` | Notícia com imagem no topo, largura inteira (16:9) |
| `12-card-noticia-compacta.html` | Notícia com miniatura ao lado do texto (1:1) |
| `90-social.html` | Ícones sociais do rodapé — URLs já fixas |
| `91-footer-legal.html` | Rodapé legal completo |
| `99-spacer.html` | Espaçador vertical |
| `_button.html` | CTA no padrão VML (`<v:roundrect>` + `<a>`). Variante A verde, B neutra escura |

Obrigatórios em toda peça: `01-header` (ou `00-hero-podi-news`), `90-social`, `91-footer-legal`.
Entre blocos, usar `99-spacer`.

---

## O header do Podi News

Toda edição do **Podi News** abre com `00-hero-podi-news.html` — um único card branco de
raio 20px que empacota, nesta ordem:

1. topbar de 88px com logo Podi à esquerda e Tacla Labs à direita;
2. imagem da edição, 536×301, **flush e sem raio** (fica no meio do card);
3. eyebrow (ex.: `EDIÇÃO DE AGOSTO`), headline 30/38 e texto de apoio 16/25, centralizados.

Fonte do design: Figma **Podi-News-26-27**, node `1:422` (`hero-podi-news`).

**Não** usar `01-header` + `02a` + `02` + `03` soltos numa edição do Podi News. Nas outras
frentes, o header continua sendo o `01-header.html`.

Duas coisas que não podem ser trocadas:

- O card **não escurece** no dark mode. Ele leva `.dm-logo`, porque o "Tacla" do logo é preto.
- Por consequência, o texto **dentro deste card não leva** `.dm-ink` / `.dm-body` / `.dm-tag`.
  Seria a única forma de acabar com texto claro sobre fundo branco. É a única seção do
  repositório onde o texto fica sem classe de dark mode — e é de propósito.

---

## Caminhos de imagem

Os `src` dos componentes apontam para `../../brand/assets/…`, que é o caminho correto a
partir de `saida/<slug>/index.html`. Se o arquivo montado for para outro lugar, ajustar.
Antes de enviar, esses caminhos relativos viram URLs absolutas `https://`.
