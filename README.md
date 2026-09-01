# Podi Marketing OS

O lugar onde ficam guardados os **padrões oficiais do Podi** para criação de materiais de
Marketing, Design e Publicidade — cores, componentes, modelos e as instruções que a IA
segue para montar tudo isso.

A ideia é simples: você traz o conteúdo, a IA monta o material já dentro do padrão da
marca. Ninguém precisa lembrar de cor, tamanho de fonte ou regra de rodapé.

> **Marca única.** Hoje o repositório está configurado só para o Podi. Quando o design
> estiver aprovado, ele será duplicado e a paleta trocada para Optimall — a estrutura e as
> regras continuam idênticas.

---

## Para quem é

Para o time de Marketing, Design e Publicidade do Podi.

**Não é preciso saber programar.** Você escreve o conteúdo e organiza as imagens; a IA faz
o resto. Se em algum momento uma resposta pedir que você mexa no repositório, algo saiu do
lugar — avise quem cuida do padrão.

---

## O que existe hoje

| Material | Situação |
|---|---|
| **Newsletter / e-mail** | Completo — design system, 18 componentes, modelo, 3 exemplos e skill pronta |
| Outros materiais | Ainda não. A estrutura já está preparada para receber |

---

## Como usar

**1. Monte a pasta do envio** em `projects/_inbox/`, com o documento de textos e as imagens.
O guia completo é o [`docs/como-enviar-conteudo.md`](docs/como-enviar-conteudo.md) — leia
antes do primeiro envio, ele explica como nomear as imagens.

**2. Peça a montagem.** Dentro do repositório:

```
/newsletter-podi 2026-09-cliente-podi-news
```

Ou simplesmente, em português:

> "Gera a newsletter de `projects/_inbox/2026-09-cliente-podi-news`"

**3. Confira o resultado** em `saida/<nome-da-pasta>/index.html`. Essa pasta é sua e fica
só no seu computador.

Para ver com as imagens carregando, rode:

```bash
python3 -m http.server 4321
```

e abra `http://localhost:4321/saida/<nome-da-pasta>/index.html`.

Antes de aprovar, teste a renderização real via Litmus / Email on Acid ou um disparo de
teste pela própria ferramenta de envio.

---

## Como o projeto está organizado

```
brand/               A identidade do Podi: logo, cores, tom de voz, links oficiais
design-system/       Como cada tipo de material se constrói: cores, componentes, regras
templates/           Os modelos em branco
examples/            Materiais prontos, para ver como fica
projects/_inbox/     Onde você deixa o conteúdo que quer transformar em material
saida/               Onde o material montado aparece — fica no seu computador
docs/                Os guias
skills/              Índice das instruções que a IA segue
```

Mapa detalhado: [`docs/estrutura.md`](docs/estrutura.md).

---

## O que é oficial

Tudo em **`brand/`, `design-system/`, `templates/`, `examples/`, `docs/` e as skills** é
recurso oficial do Podi. É o padrão da marca.

**`projects/_inbox/` e `saida/` são seus.** Ficam no seu computador, não vão para lugar
nenhum e não afetam ninguém.

Uma campanha específica **não altera** o padrão. Se ela precisar de algo que não existe, a
IA vai apontar isso como uma **proposta** — e a decisão de virar padrão é de quem mantém o
repositório.

---

## Governança

Neste momento (MVP), **o único maintainer é Bruno Pinheiro** — responsável por Design,
Produto e Marketing.

- Qualquer pessoa pode **usar** o Marketing OS para criar materiais.
- Ninguém deve **alterar** brand, design system, templates ou skills diretamente.
- Futuramente outros colaboradores autorizados poderão ser adicionados.

O controle é feito pelo Git: só quem tem permissão de escrita altera o repositório oficial.
Não há nenhum sistema de senha ou login dentro do projeto.

Detalhes: [`docs/governanca.md`](docs/governanca.md).

---

## Como propor uma mudança

Não mexa nos arquivos oficiais. Em vez disso:

1. Monte o material do jeito que der com o que existe hoje.
2. Anote o que faltou — e a IA já faz isso sozinha no relatório final.
3. Mande isso para o maintainer, em uma frase: *o que faltou, onde seria usado, por quê*.

Se for aprovado, o recurso entra no padrão e no
[`CHANGELOG.md`](CHANGELOG.md) — que é o que o time lê para saber o que mudou.

---

## Como adicionar um recurso novo (maintainer)

1. Colocar o recurso na camada certa: identidade → `brand/`; regra visual ou componente →
   `design-system/<material>/`; modelo em branco → `templates/<material>/`; procedimento
   que a IA segue → `.claude/skills/<skill>/SKILL.md`.
2. Documentar no README da própria pasta.
3. Escrever a entrada no `CHANGELOG.md` **na mesma leva** — com o porquê, e com
   `**Ação necessária:**` se algo já montado precisar ser revisto.

---

## Como usar com IA

O contexto geral fica em [`CLAUDE.md`](CLAUDE.md) — o Claude lê sozinho a cada sessão, não
precisa colar as regras no pedido. As instruções específicas de cada material ficam nas
skills, em [`skills/README.md`](skills/README.md).

Funciona no Claude Code sem configuração. Em outra ferramenta (Codex, por exemplo),
aponte para o `CLAUDE.md` e para o `SKILL.md` do material.

---

## Referência rápida

- **Identidade e cores:** [`brand/README.md`](brand/README.md)
- **Design system da newsletter:** [`design-system/newsletter/README.md`](design-system/newsletter/README.md)
- **Componentes:** [`design-system/newsletter/components/README.md`](design-system/newsletter/components/README.md)
- **Checklist de QA:** [`design-system/newsletter/guidelines/qa-checklist.md`](design-system/newsletter/guidelines/qa-checklist.md)
- **Como enviar conteúdo:** [`docs/como-enviar-conteudo.md`](docs/como-enviar-conteudo.md)
- **Mudanças no padrão:** [`CHANGELOG.md`](CHANGELOG.md)

### Exemplos montados

| Frente | Material |
|---|---|
| Cliente final | [Atualizações do app](examples/newsletter/2026-08-podi-atualizacoes-app/index.html) |
| Endomarketing | [Podi por dentro](examples/newsletter/2026-08-interno-podi-por-dentro/index.html) |
| Podi News | [Eventos de julho](examples/newsletter/2026-08-podi-news-eventos-julho/index.html) |
