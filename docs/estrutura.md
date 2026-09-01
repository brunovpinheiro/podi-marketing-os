# Estrutura do repositório

Mapa comentado. Visão para quem usa está no [README](../README.md).

```
brand/                                   IDENTIDADE — camada mais alta
├── README.md                            Marca, cor, roxo de detalhe, contraste, as duas frentes
├── links-oficiais.md                    Link do app, URLs sociais, ativos fixos
├── photography/
│   ├── README.md                        O que é normativo no Style Lock, e o verde
│   ├── STYLE-LOCK-PODI.md               Direção fotográfica oficial — blocos copiados byte a byte
│   └── refs/                            As 5 referências que originaram o Style Lock
└── assets/
    ├── header/                          Logos Podi e Tacla Labs; logo-podi.svg é o vetor monocromático
    ├── icones/                          Ícones sociais — 4 redes × 3 variantes
    └── end-news-img.jpg                 Imagem fixa do fecho "Podi e você"

design-system/newsletter/                DESIGN SYSTEM do material "newsletter"
├── README.md                            O que é reutilizável e o que é só de e-mail
├── tokens.md                            Cor, tipografia, espaçamento, dark mode, imagens
├── components/                          18 blocos de HTML de e-mail + o botão VML
│   └── README.md                        Catálogo + regras do header do Podi News
└── guidelines/
    ├── email-compat.md                  Regras técnicas de HTML de e-mail
    ├── layout-ritmo.md                  Hierarquia, ritmo, limites de CTA e de seções
    ├── qa-checklist.md                  Checklist obrigatório antes de entregar
    └── refs/                            Referências visuais (leitura humana, não são ativos)

design-system/apresentacao/              DESIGN SYSTEM do material "apresentação"
├── README.md                            O que é reutilizável e o que é só de slide
├── tokens.md                            Cor, cor secundária, tipografia de projeção, imagens
├── slides/                              Os 16 tipos de slide + o shell `_slide.html`
│   └── README.md                        Catálogo + como escolher o tipo
└── guidelines/
    ├── canvas-16-9.md                   Canvas fixo 1920×1080, preview e export em PDF
    ├── uso-do-roxo.md                   Os 5 usos permitidos do #9934FF
    ├── layout-ritmo.md                  Hierarquia no slide, ritmo do deck, limites
    └── qa-checklist.md                  Checklist obrigatório antes de entregar

templates/newsletter/
└── base.html                            Shell canônico. NUNCA editar por campanha

templates/apresentacao/
└── base.html                            Shell do deck: tokens, canvas, escala e PDF

.claude/
├── skills/newsletter-podi/SKILL.md      Skill oficial — monta o e-mail
├── skills/apresentacao-podi/SKILL.md    Skill oficial — monta o deck 16:9
├── skills/foto-podi/SKILL.md            Skill oficial — escreve o prompt de foto de marca
└── launch.json                          Config do servidor de preview local

skills/README.md                         Índice das skills (elas moram em .claude/skills/)

examples/newsletter/                     ACERVO CURADO — só o maintainer grava
├── 2026-08-podi-atualizacoes-app/       Frente cliente — envio real
├── 2026-08-interno-podi-por-dentro/     Frente interno — demonstrativo (placeholders)
└── 2026-08-podi-news-eventos-julho/     Podi News — envio real

projects/
├── README.md                            Como preparar um envio
└── _inbox/<slug>/                       ENTRADA: briefing + imagens. Fora do Git

saida/<slug>/index.html                  SAÍDA: o material montado. Fora do Git
saida/<slug>/assets/                     Imagens do deck — o material precisa abrir sozinho

docs/
├── como-enviar-conteudo.md              Guia de quem escreve: documento e nome das imagens
├── governanca.md                        Quem altera o quê, como propor mudança
└── estrutura.md                         Este arquivo

scripts/check-atualizacao.sh             Verifica/atualiza a cópia local do padrão

CLAUDE.md                                Contexto global para agentes de IA
README.md                                Porta de entrada, linguagem não técnica
CHANGELOG.md                             Mudanças no padrão, com o porquê
```

## Por que assim

**Fotografia dentro de `brand/`.** Direção fotográfica é identidade, como a cor e o logo —
vale para e-mail, post e impresso. Não virou `design-system/photography/` porque a camada de
"como se constrói" seria uma skill de produção de imagem, que ainda não existe.

**`brand/` separado de `design-system/`.** A cor de marca e a regra de contraste valem para
qualquer material — e-mail, post, impresso. As regras de tabela e VML valem só para e-mail.
Misturar as duas faria todo material novo herdar limitação de Outlook.

**`design-system/<material>/`.** O segundo material chegou: `apresentacao/` nasceu ao lado
de `newsletter/`, sem herdar nada de e-mail. O que é comum aos dois — paleta, regras de
contraste, papéis tipográficos — continua em `brand/` ou repetido em cada `tokens.md` com o
valor certo para aquele suporte. `page` é o exemplo: `#EDF7F1` no e-mail, `#48DB84` no
slide, mesmo nome porque é o mesmo papel.

**Apresentação pode usar CSS moderno.** Flex, grid e `var()` são proibidos na newsletter por
causa do Outlook e obrigatórios na apresentação, que abre num navegador. Foi exatamente para
isso que as duas camadas ficaram separadas.

**Componentes fora de `templates/`.** Só existe **um** template (o shell). Os 18 blocos são
componentes do design system: se copiam para dentro do template, não são templates.

**`projects/` e `saida/` fora do Git.** O trabalho de cada pessoa é local. Ninguém
sobrescreve ninguém, e material bruto não infla o histórico do repositório.

**Skills com sufixo `-podi`.** A ferramenta de IA traz dezenas de comandos próprios. Sem o
sufixo, na hora de digitar não dá para saber qual comando é o padrão da marca.

**Skills em `.claude/skills/`.** É a pasta que o Claude Code descobre sozinho. Uma segunda
cópia em `skills/` criaria duas versões divergindo — por isso `skills/` é só o índice.
