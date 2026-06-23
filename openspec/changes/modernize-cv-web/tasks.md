# Tasks: modernize-cv-web

## 1. Sistema de design
- [x] 1.1 Criar `docs/assets/style.css` com tokens (cores teal, tipografia,
      espaçamento, layout mobile-first)
- [x] 1.2 Adicionar a foto em `docs/assets/` (reusar avatar atual ou imagem dedicada)

## 2. Landing page (`docs/index.html`)
- [x] 2.1 Estrutura base + nav sticky com âncoras e botão "Baixar PDF"
- [x] 2.2 Hero: foto, título de posicionamento, gancho de IA & Automação, 2 CTAs
- [x] 2.3 Seção Experiência (timeline vertical)
- [x] 2.4 Seção Projetos / Consultorias (grid de cards)
- [x] 2.5 Seção Skills agrupada, com **AI & Automação em 1º**
- [x] 2.6 Seção Contato + rodapé
- [x] 2.7 Responsividade (mobile/tablet/desktop) e estados de hover

## 3. Pipeline R / PDF
- [x] 3.1 Re-apontar o build do pagedown para gerar `cv.html` + `rungo_cv.pdf`
      (não sobrescrever `index.html`) — `index.Rmd`→`cv.Rmd`, `export_cv.R` ajustado
- [x] 3.2 Adicionar grupo "AI & Automação" na seção de skills do `cv.Rmd`
- [ ] 3.3 Regerar e conferir o `rungo_cv.pdf` — BLOQUEADO: R não disponível nesta
      máquina; rodar `source("docs/export_cv.R")` no RStudio. PDF atual segue válido.

## 4. Deploy & verificação
- [x] 4.1 Adicionar `docs/.nojekyll`
- [ ] 4.2 Commit + push; confirmar GitHub Pages servindo `docs/` (aguarda OK p/ push)
- [ ] 4.3 Verificar `https://anrungo.github.io/resume/` (landing nova como home)
- [ ] 4.4 Verificar botão "Baixar CV" → `rungo_cv.pdf` e links de contato

## 5. Conteúdo (confirmar com o usuário antes de fixar)
- [x] 5.1 Ferramenta no-code definida: **n8n** (landing e Rmd atualizados)
- [x] 5.2 Texto final do gancho do hero e do título de posicionamento (provisório, OK)
- [x] 5.3 Lista de experiências/projetos a exibir na landing (curado do Google Sheet)
