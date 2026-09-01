# Skills

As skills oficiais ficam em **`.claude/skills/`** — é a pasta que o Claude Code descobre
sozinho ao abrir o repositório. Manter uma segunda cópia aqui só criaria duas versões
divergindo, então esta pasta é apenas o índice.

| Skill | Arquivo | O que faz |
|---|---|---|
| `newsletter` | [`.claude/skills/newsletter/SKILL.md`](../.claude/skills/newsletter/SKILL.md) | Monta uma newsletter ou informativo da Podi a partir de um briefing em `projects/_inbox/<slug>/` |

## Como usar

Dentro do repositório, digite o nome da skill com barra:

```
/newsletter 2026-09-cliente-podi-news
```

Ou peça em português — a skill é escolhida sozinha pela descrição.

## Em outra ferramenta de IA

Se usar Codex ou outro agente que não leia `.claude/skills/` automaticamente, aponte
para o arquivo `SKILL.md` da tabela acima junto com o `CLAUDE.md` da raiz.

## Criar uma skill nova

Skill nova é recurso oficial: só maintainer cria. Ver [`docs/governanca.md`](../docs/governanca.md).
