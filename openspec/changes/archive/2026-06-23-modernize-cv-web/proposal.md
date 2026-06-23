# Proposta: modernize-cv-web

## Por quê

O CV atual é gerado por `datadrivencv` + `pagedown::html_resume` (R) e publicado
em GitHub Pages a partir de `docs/`. O resultado é, na prática, **um PDF
renderizado no browser**: largura fixa, paginado, layout de impressão. Funciona
bem como documento para baixar/imprimir, mas quando uma organização abre o link
ela não vê um "site" — vê um documento frio.

O objetivo é atrair organizações que querem contratar serviços de **Monitoria,
Avaliação e Pesquisa de Dados**, com diferencial em **IA & Automação**. Para
isso precisamos de uma **experiência web** (landing page), não de um documento.

## O que muda

Adotamos uma arquitetura **híbrida**, sem jogar fora o pipeline existente:

- **Nova landing "Clean Professional"** escrita à mão em `docs/index.html` +
  `docs/assets/style.css`, usando a cor de acento teal `#16617a` já existente.
  - Hero com foto, título de posicionamento e **gancho de IA & Automação**, com
    dois CTAs: *Falar comigo* e *Baixar CV (PDF)*.
  - Seções: timeline de Experiência, grid de Projetos/Consultorias, Skills
    agrupadas (**AI & Automação em 1º**), Contato. Mobile-first.
- **Pipeline R mantido apenas para gerar o PDF** (`rungo_cv.pdf`) e uma versão
  completa (`cv.html`). Ele deixa de produzir `index.html` para não sobrescrever
  a landing nova.
- O grupo **AI & Automação** é adicionado também no `index.Rmd` (que alimenta o
  PDF), mantendo site e PDF alinhados.
- **Deploy verificado** em `https://anrungo.github.io/resume/`, servindo a
  landing nova como página inicial. Adição de `.nojekyll`.

## Impacto

- Arquivos afetados em `docs/`: novo `index.html`, novo `assets/`, `.nojekyll`,
  re-apontamento do build do pagedown (`index.Rmd` / `export_cv.R`), edição da
  seção de skills no `index.Rmd`.
- URL pública inalterada (`anrungo.github.io/resume/`); muda apenas o conteúdo
  servido como página inicial.
- O PDF baixável continua sendo gerado pelo R a partir do Google Sheet.

## Não-objetivos (Non-goals)

- **Não** migramos host para Railway nem adicionamos domínio custom nesta etapa.
- **Não** automatizamos a landing para ler o Google Sheet via JS (conteúdo é
  escrito à mão por ora; ver tradeoff no design).
- **Não** mudamos as direções "Bold Editorial" ou "Data/Tech Dashboard" —
  a estética escolhida é Clean Professional.
- **Não** alteramos a fonte de dados do PDF (continua o Google Sheet).
