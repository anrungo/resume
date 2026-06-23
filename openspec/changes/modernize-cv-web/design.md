# Design: modernize-cv-web

## Decisão central: arquitetura híbrida

Mantemos o pipeline R/pagedown só para o **artefato imprimível (PDF)** e
construímos um **front-end web estático novo** como o site visitável. O PDF
continua sendo "o documento"; a landing passa a ser "a experiência".

```
docs/  (raiz do GitHub Pages)
├── index.html        ← NOVO: landing Clean Professional (HTML escrito à mão)
├── assets/
│   ├── style.css     ← NOVO: sistema de design
│   └── photo.*       ← foto (usar avatar atual ou imagem dedicada)
├── rungo_cv.pdf      ← gerado pelo pipeline R (botão "Baixar CV")
├── cv.html           ← versão pagedown completa (link "ver versão completa")
├── index.Rmd         ← re-apontado: knit → cv.html + rungo_cv.pdf (NÃO index.html)
├── cv_printing_functions.r, dd_cv.css, custom.css   ← mantidos (alimentam o PDF)
└── .nojekyll         ← NOVO: impede o Jekyll de processar o site
```

### Por que não sobrescrever `index.html` com o pagedown
Hoje `index.Rmd` knita para `docs/index.html`. Se mantivéssemos isso, todo
rebuild apagaria a landing nova. Solução: o build do pagedown passa a gerar
`cv.html` + `rungo_cv.pdf`; `index.html` é a landing escrita à mão e versionada.

## Sistema de design (Clean Professional)

| Token            | Valor                                            |
|------------------|--------------------------------------------------|
| Acento           | `#16617a` (teal já usado no CV)                  |
| Acento secundário| `#23a0ab` (já presente no custom.css)            |
| Texto            | `#1f2933` / corpo `#444`                          |
| Fundo            | branco + cinza-claro `#f7fbff` para seções       |
| Tipografia       | sans limpa (system-ui / Inter), pesos 400–600    |
| Layout           | mobile-first, largura máx. ~960px, muito espaço  |
| Interação        | hover sutil em itens da timeline e cards; nav sticky |
| Dark mode        | opcional (nice-to-have, não bloqueante)          |

## Estrutura da página

1. **Nav sticky** — nome/iniciais à esquerda; âncoras (Sobre, Experiência,
   Skills, Contato) + botão "Baixar PDF".
2. **Hero** — foto redonda, título "Monitoria, Avaliação & Pesquisa de Dados",
   gancho: *"Uso IA generativa e automação para transformar dados de campo em
   decisões — mais rápido e com menos erro."* CTAs: *Falar comigo* / *Baixar CV (PDF)*.
3. **Experiência** — timeline vertical (ano ● título — org, 1–2 linhas de impacto).
4. **Projetos / Consultorias** — grid responsivo de cards (título, tags, ano/resultado).
5. **Skills** — agrupadas:
   - **AI & Automação** (1º): LLMs / IA generativa, Prompt engineering,
     Automação no-code, Machine Learning.
   - Dados: R, Python, SPSS.
   - Coleta de campo: ODK, Kobo Collect.
   - Dev & Ferramentas: Git, GitHub, Markdown, HTML/CSS.
6. **Contato** — email, GitHub, Twitter, sinal "disponível para consultorias".
7. **Rodapé** — "PDF feito com R + pagedown · código no GitHub".

## Tradeoffs assumidos

- **Duas fontes de conteúdo.** A landing é escrita à mão; o PDF vem do Google
  Sheet. Para o volume atual do CV é gerenciável. Evolução futura possível:
  `index.html` ler o mesmo Sheet via JS (fora de escopo agora).
- **Skills no PDF são hardcoded** no `index.Rmd` (linhas ~97–111), não vêm do
  Sheet. Logo, "AI & Automação" é adicionado nos dois lugares manualmente.
- **HTML estático puro vs framework.** Optamos por HTML+CSS sem build step:
  zero toolchain, deploy trivial no GitHub Pages, fácil de manter.

## Deploy

- GitHub Pages já serve `docs/` no branch `master`. Nenhuma migração.
- Adicionar `.nojekyll` para evitar processamento Jekyll.
- Verificação: `https://anrungo.github.io/resume/` carrega a landing nova como
  página inicial; botão "Baixar CV" aponta para `rungo_cv.pdf`.
