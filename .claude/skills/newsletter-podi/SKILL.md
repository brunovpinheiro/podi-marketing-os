---
name: newsletter-podi
description: Monta uma newsletter, Podi News, informativo interno ou e-mail marketing do Podi a partir de um briefing em projects/_inbox/<slug>/. Use quando pedirem para gerar, montar ou criar uma newsletter, um Podi News, um informativo interno ou um e-mail marketing a partir de um documento e uma pasta de imagens.
---

# Montar uma newsletter Podi

Argumento: o slug da pasta em `projects/_inbox/`. Sem argumento, listar as pastas
disponíveis e perguntar qual.

Esta skill é o **procedimento**. As regras que ela obedece estão em outros lugares e
valem integralmente:

| Camada | Onde | O que manda |
|---|---|---|
| Brand | `brand/README.md`, `brand/links-oficiais.md` | Identidade, contraste, frentes, links fixos |
| Brand | `brand/photography/STYLE-LOCK-PODI.md` | Direção fotográfica — só quando a peça pedir **foto nova** |
| Design System | `design-system/newsletter/` | Tokens, componentes, compatibilidade, ritmo, QA |
| Template | `templates/newsletter/base.html` | O shell |

Em caso de conflito, a camada mais alta prevalece. Ver `docs/governanca.md`.

## 0. Atualizar o padrão

Antes de qualquer coisa, e **sem perguntar nada ao usuário**:

```bash
./scripts/check-atualizacao.sh --atualizar
```

Quem usa este comando não é pessoa técnica (`CLAUDE.md`). Não peça para ela rodar Git:
o script já traz a versão nova sozinho.

- **Saída 0** → seguir. Se o script disse que atualizou, mencione em uma linha, em
  português comum: *"Atualizei o padrão para a versão mais recente antes de montar."*
  Se não atualizou nada, não comente — silêncio é o esperado.
- **Saída 1** → houve alteração local conflitante. **Parar.** Dizer que esta cópia do
  padrão está diferente da oficial e que é preciso avisar quem cuida do repositório.
  Não tentar resolver, não sugerir comando, não montar assim mesmo: o e-mail sairia com
  o template antigo e nada no arquivo denunciaria isso.

Sem Git, sem remoto ou offline, o script sai 0 e o trabalho segue normalmente.

## 1. Ler tudo antes de decidir qualquer coisa

```bash
ls -R projects/_inbox/<slug>/
```

- `.docx` → `textutil -convert txt -stdout arquivo.docx`
- `.pdf` → `pdftotext arquivo.pdf -`
- `.zip` → `unzip -o arquivo.zip -d projects/_inbox/<slug>/imagens/`
- Imagens → **abrir de fato** com a tool Read. Nome de arquivo não é prova de conteúdo,
  e você precisa da proporção real para escolher o bloco.

## 2. Mapear imagem → componente

O nome do arquivo carrega a intenção (ver `docs/como-enviar-conteudo.md`):

| Nome | Significado | Componente |
|---|---|---|
| `capa.*` | Abertura da edição | `00-hero-podi-news` (Podi News) ou `03-hero-image` |
| `NN-nome.*` | Notícia NN, imagem no topo em largura inteira | `11-card-noticia` |
| `NN-nome-1x1.*` | Notícia NN, imagem ao lado do texto | `07-artigos-alternados` ou `12-card-noticia-compacta` |

O `NN` casa com o número do bloco no documento. Se o texto e a imagem não fecharem,
**perguntar** — associação errada é pior que pergunta a mais.

## 3. Conferir a proporção antes de montar

E-mail não recorta imagem: o arquivo entra com a forma que tem.

- Sem sufixo / `capa` → **16:9 ou mais panorâmica**, mínimo 1072px de largura
- `-1x1` → **quadrada**, tolerância de 2%, mínimo 496×496

Quando não bater, **não distorça e não corte por conta própria**. Monte o resto do
e-mail e relate no fim: qual arquivo, qual proporção veio, qual era esperada.

Exceção: se a imagem estiver só acima do tamanho mínimo (proporção certa, sobra de
pixel), pode usar — o `width` do HTML resolve.

Formato fora de JPG/PNG (WebP, AVIF, HEIC, SVG) é bloqueio: converter com
`sips -s format jpeg` e avisar, ou pedir o arquivo certo.

## 4. Montar

1. Frente `cliente` ou `interno` (`brand/README.md`) — decide rodapé e tom.
   **Cliente final sem link de descadastro é erro de LGPD.**
2. Edição do **Podi News** → header obrigatório `00-hero-podi-news.html`
   (`design-system/newsletter/components/README.md`).
3. Copiar `templates/newsletter/base.html` para **`saida/<slug>/index.html`** e colar os
   blocos de `design-system/newsletter/components/` no lugar marcado.
   Nunca gravar em `examples/` — aquilo é acervo curado, gravado só por quem cuida do padrão.
4. Máximo de **4 blocos de conteúdo**. Passou disso, cortar ou propor dois envios.
5. Ativos e links fixos de `brand/links-oficiais.md` — imagem do fecho, URLs sociais,
   link do app — **não se inventa**.
6. **Nunca escrever cor solta.** Toda cor sai de `design-system/newsletter/tokens.md`.

## 5. Quando falta algo no sistema

Se o conteúdo pede um bloco, uma cor ou um layout que não existe:

1. **Não invente.** Não crie uma cor nova, não improvise um bloco com CSS solto.
2. Verifique se um componente existente resolve com outro conteúdo.
3. Se realmente não resolve, monte o resto do e-mail e **relate a ausência no fim**,
   marcada explicitamente como **proposta**: o que falta, onde seria usado, e o que você
   sugere.
4. Proposta não vira padrão sozinha. Quem decide é o maintainer (`docs/governanca.md`).

Se o briefing pedir uma **fotografia que ainda não existe**, a direção visual não se
inventa: ela está em `brand/photography/STYLE-LOCK-PODI.md`. Relate o que falta e aponte o
Style Lock como referência para quem for produzir a imagem.

Isso vale **só para fotografia**. As imagens que chegam em `_inbox/` não passam por
avaliação de estilo fotográfico — muitas são print de tela, montagem gráfica ou arte, e
para elas o único critério continua sendo formato e proporção (§3).

Se o pedido do usuário conflita com o brand — outra cor, texto branco sobre o verde,
outro logo — **sinalize o conflito** em vez de alterar a identidade. Explique a regra em
uma frase e ofereça a alternativa que respeita o sistema.

## 6. QA e entrega

Rodar `design-system/newsletter/guidelines/qa-checklist.md` inteiro antes de dizer que
está pronto. Os itens verificáveis por comando:

```bash
f=saida/<slug>/index.html
wc -c < $f                                                         # < 100 KB
grep -cE '<script|<form|<iframe|display:flex|calc\(|var\(--' $f    # 0
grep -o '<table[^>]*>' $f | grep -cv 'role="presentation"'         # 0
grep -o '<img[^>]*>' $f | grep -cv 'alt='                          # 0
grep -o '<a [^>]*href="http[^>]*>' $f | grep -cv 'target="_blank"' # 0
```

Relatar sempre: caminho do arquivo, **subject** (≤45 caracteres), **preheader** (60–90),
peso do HTML, componentes usados, imagens a hospedar com dimensão final, e o que ficou
de fora e por quê.
