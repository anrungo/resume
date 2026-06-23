# Spec delta: cv-website

## ADDED Requirements

### Requirement: Landing page como página inicial
O site SHALL servir uma landing page web (não um documento paginado de
impressão) como página inicial em `docs/index.html`, publicada em
`https://anrungo.github.io/resume/`.

#### Scenario: Visitante abre a URL pública
- **WHEN** um visitante abre `https://anrungo.github.io/resume/`
- **THEN** vê a landing "Clean Professional" responsiva (não o layout paginado do pagedown)
- **AND** o conteúdo se adapta a telas mobile, tablet e desktop

#### Scenario: Rebuild do PDF não afeta a landing
- **WHEN** o pipeline R/pagedown é re-executado
- **THEN** ele gera `cv.html` e `rungo_cv.pdf`
- **AND** NÃO sobrescreve `docs/index.html`

### Requirement: Hero com posicionamento e CTAs
A landing SHALL apresentar um hero com foto, título de posicionamento
(Monitoria, Avaliação & Pesquisa de Dados), um gancho mencionando IA &
Automação, e dois CTAs.

#### Scenario: Visitante quer agir
- **WHEN** o visitante vê o hero
- **THEN** há um CTA "Falar comigo" que leva ao contato/email
- **AND** há um CTA "Baixar CV (PDF)" que aponta para `rungo_cv.pdf`

### Requirement: Skills com AI & Automação em destaque
A landing SHALL exibir as skills agrupadas, com o grupo "AI & Automação" como
o primeiro grupo, contendo LLMs/IA generativa, prompt engineering, automação
no-code e Machine Learning.

#### Scenario: Organização avalia diferencial técnico
- **WHEN** o visitante chega à seção Skills
- **THEN** o primeiro grupo visível é "AI & Automação"
- **AND** os demais grupos (Dados, Coleta de campo, Dev & Ferramentas) aparecem em seguida

### Requirement: PDF baixável a partir dos dados existentes
O sistema SHALL continuar gerando `rungo_cv.pdf` via pipeline R a partir do
Google Sheet, e o grupo "AI & Automação" SHALL ser refletido também no PDF.

#### Scenario: Visitante baixa o CV completo
- **WHEN** o visitante clica em "Baixar CV (PDF)"
- **THEN** recebe `rungo_cv.pdf` gerado pelo pipeline R
- **AND** o PDF inclui a seção de skills com "AI & Automação"

### Requirement: Deploy estático em GitHub Pages
O site SHALL ser publicado por GitHub Pages a partir de `docs/`, com
`.nojekyll` para evitar processamento Jekyll, sem migração de host.

#### Scenario: Publicação após push
- **WHEN** as mudanças em `docs/` são enviadas para `master`
- **THEN** o GitHub Pages serve a landing nova em `https://anrungo.github.io/resume/`
- **AND** os assets em `docs/assets/` carregam corretamente
