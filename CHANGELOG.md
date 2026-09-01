# Changelog

Mudanças no padrão — templates, tokens, regras e assets fixos.

Mantido pelo dono do repositório. Quem escreve newsletter lê para saber o que mudou
desde o último envio; o `/nova-newsletter` avisa quando o clone está atrás.

**Ação necessária** marca o que exige refazer ou revisar algo já montado. O resto
entra sozinho no próximo e-mail.

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
