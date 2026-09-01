# projects/ — o trabalho, separado dos recursos oficiais

O Marketing OS guarda os **recursos oficiais** do Podi: brand, design system, templates,
skills. Um material específico — uma campanha, uma edição, um envio — **não é** recurso
oficial e não altera nenhum deles.

```
projects/
└── _inbox/          ENTRADA — briefing e imagens que o time manda (fica no seu computador)

saida/               SAÍDA — o material montado (fica no seu computador)
```

Nenhuma das duas vai para o repositório. O que você monta é seu, local, e não sobrescreve
o trabalho de ninguém.

## Entrada: `projects/_inbox/`

Uma pasta por envio:

```
projects/_inbox/2026-09-cliente-podi-news/
├── brief.docx          (ou .md / .txt / .pdf — o material bruto, do jeito que veio)
└── imagens/            (ou imagens.zip — o Claude descompacta)
    ├── capa.jpg                 → abertura da edição      (16:9, ≥1072px)
    ├── 01-cinema.jpg            → notícia 01, topo        (16:9, ≥1072px)
    ├── 02-parque-cidade.jpg     → notícia 02, topo        (16:9, ≥1072px)
    └── 03-panna-city-1x1.jpg    → notícia 03, lateral     (1:1, ≥496×496)
```

Nome da pasta: `AAAA-MM-<frente>-<assunto>`, onde frente é `cliente` ou `interno`.
Exemplos: `2026-09-cliente-dia-das-criancas`, `2026-09-interno-case-shopping-norte`.

> **Guia completo para quem escreve:** [`docs/como-enviar-conteudo.md`](../docs/como-enviar-conteudo.md)
> — nomes de arquivo, proporções e formato do documento. Leia antes do primeiro envio.

## Como pedir a montagem

```
/newsletter-podi 2026-09-cliente-dia-das-criancas
```

ou, em português mesmo:

> "Gera a newsletter de `projects/_inbox/2026-09-cliente-dia-das-criancas`"

## O que ajuda no briefing

- Objetivo do e-mail em uma frase
- Público (cliente final ou colaboradores; shopping específico se houver)
- Data de envio
- Textos já aprovados (se houver) ou os fatos brutos
- CTA principal + URL de destino
- Restrições legais / letra miúda obrigatória

## Se a campanha precisar de algo que não existe

Um projeto **não altera** o design system, o template nem a skill. Se o material pede
um bloco ou uma cor que não existe, isso vira uma **proposta de evolução do sistema** —
ver [`docs/governanca.md`](../docs/governanca.md).
