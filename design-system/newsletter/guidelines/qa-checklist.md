# QA — rodar antes de entregar qualquer e-mail

## Estrutura
- [ ] `<!DOCTYPE>` XHTML Transitional com `xmlns:v` e `xmlns:o`
- [ ] Bloco `<!--[if mso]>` com `PixelsPerInch` 96 e o override de `font-family: Arial !important`
- [ ] Preheader oculto é o primeiro elemento do `<body>`, com 60–90 caracteres
- [ ] Nenhum `<div>` fazendo papel de layout; só tabelas com `role="presentation"`
- [ ] Container 600px com ghost table MSO em volta
- [ ] Nenhum `margin` em elemento de layout (só em `<p>`/`<h*>` como reset)

## CSS
- [ ] Todo estilo visual está inline; o `<style>` só tem reset, media query e dark mode
- [ ] Zero `var()`, `calc()`, `flex`, `grid`, `position`, `float`, `rem`
- [ ] Nenhum texto abaixo de 15px (exceto legal 12px, eyebrow 12px e label de número 14px)
- [ ] Todo `<td>` com texto declara `font-family`, `font-size`, `line-height` e `color`

## Imagens
- [ ] Todas com `alt` descritivo, atributo `width` e `display:block;border:0`
- [ ] Todas em JPG/PNG (nada de WebP/SVG/AVIF) e exportadas em 2x
- [ ] URLs absolutas `https://`
- [ ] Teste com imagens bloqueadas: o e-mail continua compreensível e o CTA continua clicável

## Botões
- [ ] Todo CTA usa o par `<v:roundrect>` + `<a>` com `mso-hide:all`
- [ ] Largura do `roundrect` conferida contra o tamanho real do label
- [ ] Altura de toque ≥ 44px

## Responsivo
- [ ] Colunas lado a lado empilham em ≤600px
- [ ] Com a media query desativada, o layout ainda é legível
- [ ] Imagens não estouram o container em 320px de largura

## Dark mode
- [ ] Testado em Apple Mail dark e Outlook.com dark
- [ ] Logo legível sobre fundo escuro
- [ ] Nenhum texto escuro sobre fundo escuro

## Conteúdo e envio
- [ ] Subject ≤ 45 caracteres, sem emoji duplicado, sem CAPS
- [ ] Rodapé com `© <ano> - Podi App`, motivo do recebimento e descadastro
- [ ] Links de Política de Privacidade e Termos de Uso conforme `brand/links-oficiais.md`
- [ ] Todos os links testados e com `target="_blank"`
- [ ] HTML final < 100 KB (`wc -c`)
- [ ] Sem `<script>`, `<form>`, `<iframe>`, `<video>`
- [ ] Versão texto puro gerada (se a ferramenta de envio não gerar sozinha)
