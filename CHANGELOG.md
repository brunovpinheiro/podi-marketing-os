# Changelog

Mudanças no padrão — templates, tokens, regras e assets fixos.

Mantido pelo dono do repositório. Quem escreve newsletter lê para saber o que mudou
desde o último envio; as skills avisam quando o clone está atrás.

**Ação necessária** marca o que exige refazer ou revisar algo já montado. O resto
entra sozinho no próximo e-mail.

---

## 2026-09-01 — apresentações e cor secundária

O repositório deixou de cobrir um material só. **Apresentação** entra ao lado de newsletter,
com design system, template e skill próprios — e o roxo que o time já usava nos slides vira
regra escrita.

### Adicionado

- **Cor secundária de marca `#9934FF`** em `brand/README.md`. Ela já existia de fato — nos
  slides do time e como variante de ícone social — mas sem regra escrita, o que na prática
  significa que cada peça decidia sozinha. Agora está definida como **detalhe gráfico**:
  ícone, régua sob título, bullet, borda fina. Nunca texto, nunca título, nunca fundo de
  área grande, nunca sobre o verde (2,4:1).
  O contraste sobre branco passaria em texto (4,9:1) — a regra é mais restritiva **de
  propósito**: o verde é a marca, o roxo é tempero. Sem esse limite, em três campanhas o
  deck vira roxo e deixa de parecer Podi.
- **`design-system/apresentacao/`** — tokens de projeção (corpo a partir de 28px, título de
  slide a 64px), os quatro tokens do roxo, canvas fixo, uso do roxo, ritmo do deck e QA.
  Nasceu ao lado de `newsletter/` e **não herdou nada de e-mail**: aqui flex, grid e `var()`
  são obrigatórios, e as regras de `email-compat.md` não valem.
- **16 tipos de slide** em `design-system/apresentacao/slides/`, do `00-capa` ao
  `15-encerramento`, mais o shell `_slide.html`. Quatro deles — capa, split foto + cards,
  features em duas colunas e mockup de app — são a formalização dos três layouts que o time
  já vinha usando. O padrão **descreve o que existia**; não inventou direção visual nova.
- **`brand/assets/header/logo-podi.svg`** — o logo Podi sozinho, em vetor **monocromático**.
  Não tem cor gravada: a cor vem de fora, por `currentColor`. Era a peça que faltava — os
  PNGs existentes são verdes, e logo verde sobre fundo verde some, o que obrigava a enfiar o
  logo dentro de uma placa branca em toda capa. Agora ele vai branco direto sobre o verde,
  como nos decks que o time já fazia.
  Junto veio a regra em `brand/README.md`: **logo não é texto**. A regra de contraste do
  verde governa palavras; o logo é marca gráfica, e branco sobre o verde é como a Podi
  assina. O que continua proibido é recolorir por `filter` ou por efeito.
- **O rodapé de todo slide é assinado pelo logo**, não pela palavra "Podi". Assinatura de
  marca é a marca; texto no lugar dela é o tipo de detalhe que ninguém nota no slide 3 e
  incomoda no slide 15. Sobre fundo claro o logo é sempre o verde original `#48DB84`, em
  qualquer tamanho: ali ele é assinatura discreta, não alvo de leitura — o mesmo raciocínio
  já escrito para o ícone social verde do rodapé do e-mail.
- **`templates/apresentacao/base.html`** — shell com os tokens no `:root`, canvas de
  1920 × 1080, escala automática para preview na tela e `@page` configurado para o PDF sair
  em paisagem com um slide por página. O logo entra como `<symbol>` carregado uma vez só;
  os slides o usam por `<use href="#logo-podi">`, para o desenho não ser copiado três vezes
  dentro do mesmo arquivo.
- **Skill `/apresentacao-podi`** — lê o briefing, define o roteiro (número, tipo de slide,
  o que ele diz), **confirma o roteiro antes de montar**, monta em `saida/<slug>/` e roda o
  QA. A confirmação do roteiro é o passo que evita o erro caro do material: refazer 18
  slides prontos custa o dobro de discordar de uma lista.
- **Rota `/design`** documentada na skill (§4) e no `CLAUDE.md`. Quem quiser editar o visual
  à mão leva o mesmo conteúdo para o canvas do `/design` — mas **o `/design` não decide
  identidade**: cor, tipografia e uso do roxo vão no briefing do canvas, prontos. Canvas
  fora do sistema se corrige; design system não.

### Alterado

- **`CLAUDE.md`** — a frase "hoje o único material coberto é newsletter" saiu, e duas regras
  não negociáveis entraram: o roxo de detalhe e o canvas fixo de 1920 × 1080.
- **`brand/README.md`** — nova seção "Cor secundária" e o ponteiro de tokens agora aponta
  para os dois materiais.
- **`docs/estrutura.md`, `skills/README.md`, `saida/README.md`** atualizados com a pasta
  nova, a skill nova e o que fazer com o deck pronto (o PDF, e mandar a pasta inteira —
  o HTML sozinho perde as imagens).

### O que ficou de fora, de propósito

- **Export nativo para `.pptx`.** O PDF cobre o uso real e trava a tipografia; um `.pptx`
  gerado substituiria a Inter na máquina de quem abrisse e desmontaria o espaçamento. Quem
  precisa do PowerPoint importa o PDF como imagem de fundo. Deck que precise ser **editado**
  no PowerPoint depois é um pedido diferente — falar com quem cuida do padrão.
- **Subir tokens comuns de newsletter + apresentação para `brand/`.** Agora existem dois
  casos de uso reais, então a promoção finalmente pode ser discutida — mas ela é uma
  mudança estrutural, e mudança estrutural não entra junto com o material que a motivou.
- **`examples/apresentacao/`.** Acervo é curado a partir de trabalho real entregue. O
  primeiro deck montado com o padrão é o candidato natural.

---

## 2026-09-01 — skill de foto e sufixo `-podi`

### Adicionado

- **Skill `/foto-podi`** — escreve o prompt de uma foto de marca a partir de um pedido em
  português: enquadra o pedido nas dimensões obrigatórias, parte de uma das 8 variações
  prontas quando cabe, monta o prompt em inglês com o bloco `STYLE LOCK` copiado sem edição,
  roda o checklist e entrega as duas versões (com e sem campo de negative). Fecha a lacuna
  aberta na entrada anterior: `brand/photography/` dizia **o que é permitido**, e não havia
  nada dizendo **como executar**.
  A skill **referencia** o Style Lock; não copia trechos dele. Direção visual continua tendo
  uma fonte só.
- **`saida/fotos/NNN-slug.md`** — onde os prompts entregues ficam guardados. É o histórico do
  ensaio: dá para repetir uma foto meses depois e reaproveitar a seed. Como todo `saida/`,
  é local e fora do Git.

### Alterado

- **Toda skill oficial passa a terminar em `-podi`.** `/newsletter` virou **`/newsletter-podi`**;
  a skill nova já nasceu `/foto-podi`. A ferramenta de IA traz dezenas de comandos próprios —
  sem o sufixo, na hora de digitar não dá para saber qual é o padrão da marca.
  **Ação necessária:** quem já usava `/newsletter` passa a digitar `/newsletter-podi`. O
  material montado antes não muda em nada.
- **`skills/README.md`, `README.md`, `projects/README.md`, `docs/como-enviar-conteudo.md`,
  `docs/estrutura.md`, `CLAUDE.md` e `scripts/check-atualizacao.sh`** atualizados com o nome
  novo e com a regra do sufixo escrita, para skill nova já nascer certa.
- **`saida/README.md`** deixou de falar só em newsletter: agora a pasta recebe dois tipos de
  saída.
- **`brand/photography/README.md`** — a seção "o que ainda não existe" virou o ponteiro para
  a `/foto-podi`.

---

## 2026-09-01 — direção fotográfica

### Adicionado

- **`brand/photography/`** — a direção fotográfica da Podi passa a ser diretriz oficial de
  Brand, no mesmo nível da cor e do logo. Contém o `STYLE-LOCK-PODI.md` migrado íntegro do
  repositório de fotografia, as 5 referências que o originaram e um `README.md` dizendo o
  que ali é normativo (DNA, tradução para interior, blocos STYLE LOCK, checklist, verde) e
  o que é ferramenta de execução (fórmula de slots, suíte de prompts, negative por gerador).
  Está em `brand/` e não em `design-system/` porque vale para qualquer material — e-mail,
  post, impresso —, não só para e-mail.
- **Regra não negociável no `CLAUDE.md`** — não se inventa direção visual nova, e o bloco
  `STYLE LOCK` se copia sem editar uma palavra. Parafrasear o bloco é o erro que ninguém
  percebe até ter quarenta imagens desalinhadas entre si.

### Alterado

- **O verde da fotografia ficou decidido: `#48DB84`.** O Style Lock vinha operando com o hex
  oficial "a confirmar" — o Marketing OS já o tinha. Os termos `vivid emerald green` /
  `deep pine green` / `soft mint green` ficam confirmados como a tradução desse verde para o
  vocabulário dos geradores; as variantes lime e jade continuam no §8 só como registro do que
  foi descartado.
- **Skill `/newsletter`** passou a apontar o Style Lock para o caso de o briefing pedir uma
  **foto que ainda não existe**. As imagens que chegam em `_inbox/` **não** ganharam critério
  de aceite fotográfico: muitas são print de tela ou montagem gráfica, e para elas o critério
  continua sendo só formato e proporção.
- **`brand/README.md` e `docs/estrutura.md`** ganharam a seção e a linha correspondentes.

### O que ficou de fora, de propósito

- O `CLAUDE.md` do repositório de origem. Ele é o manual de uma fábrica de prompts — formato
  de entrega, numeração de arquivo, `--sref`/`--seed`/`--cref`. Isso é procedimento de skill,
  não Brand, e colide com a linguagem não técnica deste repositório.
- A pasta `prompts/` de origem: é saída de projeto, equivalente ao `saida/` daqui.
- Uma skill `/foto`. É **proposta**, registrada no `brand/photography/README.md` — não padrão.

---

## 2026-09-01 — Podi Marketing OS

O repositório deixou de ser "as newsletters da Podi" e passou a ser o **Podi Marketing OS**:
a base oficial de padrões para todo material de Marketing, Design e Publicidade. Newsletter
continua sendo o único material coberto — o que mudou foi a arrumação, para que um segundo
tipo de material caiba sem herdar as limitações de e-mail.

**Ação necessária:** todos os caminhos mudaram. Se você tem uma cópia antiga, ela vai ser
atualizada sozinha na próxima montagem. Se você tinha algo salvo fora de `saida/`, confira
antes.

### Adicionado

- **Camada `brand/`** — identidade Podi separada do design system: cor de marca e regra de
  contraste, as duas frentes (cliente/interno) com tom e rodapé, logos e ícones, e
  `links-oficiais.md` com o link do app, as URLs sociais e a imagem do fecho.
  Existe porque a regra do `#48DB84` vale para qualquer material, e as regras de tabela e
  VML valem só para e-mail. Misturadas, todo material novo herdaria limitação de Outlook.
- **`docs/governanca.md`** — quem altera o quê, a hierarquia de autoridade
  (Brand → Design System → Templates → Skills → Projeto), e como propor mudança sem editar
  recurso oficial. No MVP o único maintainer é Bruno Pinheiro.
- **`docs/estrutura.md`** — mapa comentado do repositório, com o porquê de cada separação.
- **READMEs de camada** — `brand/`, `design-system/newsletter/`,
  `design-system/newsletter/components/` (catálogo dos 18 blocos + regras do header do
  Podi News), `projects/`, `skills/`.
- **Regra "não invente padrão"** — quando falta algo no sistema, a IA identifica a ausência,
  monta o resto e relata como **proposta** explicitamente marcada. Proposta não vira padrão
  sozinha.
- **Regra de conflito** — pedido que contraria uma camada superior é **sinalizado**, não
  executado silenciosamente.

### Alterado

- **Estrutura de pastas**, com tudo movido:
  | Antes | Agora |
  |---|---|
  | `assets/header/`, `assets/icones/`, `assets/end-news-img.jpg` | `brand/assets/…` |
  | `templates/tokens.md` | `design-system/newsletter/tokens.md` |
  | `templates/sections/` | `design-system/newsletter/components/` |
  | `templates/base.html` | `templates/newsletter/base.html` |
  | `docs/qa-checklist.md` | `design-system/newsletter/guidelines/qa-checklist.md` |
  | `refs/` | `design-system/newsletter/guidelines/refs/` |
  | `content/_inbox/` | `projects/_inbox/` |
  | `examples/<slug>/` | `examples/newsletter/<slug>/` |
  Os `src` dos três exemplos e dos componentes foram reescritos junto.
- **`CLAUDE.md` reescrito como camada global.** As regras específicas foram para onde
  pertencem: compatibilidade de e-mail (§3) → `design-system/newsletter/guidelines/email-compat.md`;
  ritmo visual (§5) → `layout-ritmo.md`; frentes e contraste (§4) → `brand/README.md`;
  ativos fixos (§4b) → `brand/links-oficiais.md`; fluxo e nome de imagem (§2/§2a) → a skill.
  As não negociáveis ficaram repetidas na raiz de propósito — errar nelas custa caro demais
  para depender de um clique a mais.
- **Comando `/nova-newsletter` virou `/newsletter`.** O "nova" descrevia o momento, não o
  material — e num OS multi-material o nome do material é o que identifica a skill.
- **`README.md` reescrito** para quem não é técnico: o que é o OS, para quem, o que é
  oficial, governança e como propor mudança.
- **`scripts/check-atualizacao.sh`** passou a vigiar `brand/`, `design-system/` e
  `templates/` como caminhos críticos.
- **`.gitignore`** passou a ignorar `projects/_inbox/` e `*.zip` — material bruto do time
  não infla o histórico do repositório.

### Removido

- **`content/31082026_atualizacoes/`** — 3 MB de PNGs de briefing já consumido, fora da
  convenção de nome e duplicando as imagens já convertidas em
  `examples/newsletter/2026-08-podi-atualizacoes-app/assets/`.
- **`refs/exemplo-de-conteudo.html`** — e-mail salvo pelo Apple Mail. Continha caminho
  absoluto da máquina de origem, `<script>` e fontes inline; o padrão que ele
  representava já foi superado pelos três exemplos atuais.
- **`assets/logo-podi.png` e `assets/logo-tacla-labs.png`** da raiz — duplicatas órfãs
  dos arquivos de `assets/header/`, que são os realmente usados.

---

## 2026-09-01 — padrão de newsletter

### Adicionado

- **Bloco `00-hero-podi-news.html`** — header combinado das edições do Podi News:
  card branco único com topbar de logos, imagem da edição e eyebrow + headline +
  texto de apoio. Vindo do Figma `Podi-News-26-27`, node `1:422`.
  **Ação necessária:** toda edição do Podi News passa a usar este bloco. A combinação
  antiga (`01-header` + `02a` + `02` + `03` soltos) só vale para as outras frentes.
- **Pasta `saida/`** — é onde o e-mail montado é gravado a partir de agora, no lugar
  de `examples/`. Fica fora do Git: o trabalho é local de cada pessoa.
  `examples/` vira acervo curado, gravado só pelo dono do repositório.
- **Guia `docs/como-enviar-conteudo.md`** — para quem escreve: formato do documento,
  nomenclatura das imagens e proporções exigidas.
- **Comando `/nova-newsletter <slug>`** — monta a newsletter a partir de
  `content/_inbox/<slug>/`, conferindo antes se o clone está atualizado.
- **Convenção de nome de imagem** (CLAUDE.md §2a): `capa.*`, `NN-nome.*` para imagem
  no topo em largura inteira (16:9 ou mais panorâmica) e `NN-nome-1x1.*` para imagem
  ao lado do texto (quadrada). Fora da proporção, o Claude relata em vez de recortar.
- **Papéis de tipografia faltando** em `tokens.md`: número de destaque (32/38/600) e
  label de número (14/20/400), que o `08-destaque-numeros` já usava sem estar escrito.

### Alterado

- **Ícones sociais agora são os verdes** (`assets/icones/*-green.png`), por decisão de
  marca, no lugar dos roxos. Contraste de 1,63:1 sobre a página clara contra 4,5:1 do
  roxo — no modo claro o ícone é ornamento, e o que sustenta o link é o `alt`.
  **Ação necessária:** newsletters montadas antes desta data ainda apontam para
  `*-roxo.png`. Se for reenviar alguma, trocar o sufixo.
- **Link do botão de baixar o app** é fixo: `https://podi.podiapp.com.br/podi-e931a`.
  Substitui o `podi.com.br/app` que estava nos exemplos e não existia.
  **Ação necessária:** conferir esse `href` em qualquer e-mail ainda não disparado —
  ele aparece em dois lugares no botão, no `<v:roundrect>` e no `<a>`.
- **Imagem do fecho "Podi e você"** é sempre `assets/end-news-img.jpg`, nunca uma arte
  nova nem cópia dentro da pasta do envio.
- **URLs dos ícones sociais** fixadas direto no `90-social.html`, no lugar dos
  placeholders `{{URL_*}}`. Os exemplos estavam com endereços inventados.
- **Piso de 15px** no QA passou a citar as exceções reais — legal 12px, eyebrow 12px,
  label de número 14px. Antes falava em "legendas de 13px", tamanho que não existe
  em nenhum bloco.
- `&display=swap` do Google Fonts escapado como `&amp;` no `base.html`, para o arquivo
  bater com o doctype XHTML que ele declara.

### Removido

- Pasta `design-system/` e o ambiente virtual `.venv-x/`, que não participavam da
  montagem de e-mail.

---

## Como escrever uma entrada

Uma seção por data, com `Adicionado` / `Alterado` / `Removido`. Cada item diz o que
mudou e **por quê** — daqui a seis meses o porquê é a única parte que não dá para
deduzir do diff. Marcar `**Ação necessária:**` quando algo já montado precisar ser
revisto.
