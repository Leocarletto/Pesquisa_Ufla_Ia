
library(readxl)
library(tidyverse)
library(forcats)

search_ai_statistics <- read_excel("pesquisa_sobre_ia_estatistica_ufla.xlsx")

View(search_ai_statistics)

projeto_pesquisa_estatistica <- data.frame(
  linguagem_p_programar = search_ai_statistics$`Qual é a principal linguagem de programação que você usa?`,
  ia_para_programar = search_ai_statistics$`Você usa Inteligência Artificial para programar? (Ex.: Auxílio na geração ou depuração de códigos)`,
  principal_ferramenta_ia = search_ai_statistics$`Qual é a principal ferramenta de Inteligência Artificial que você usa para programar?`,
  sente_falta_de_governanca_ia = search_ai_statistics$`Você sente falta de governança e regulamentação sobre o uso de Inteligência Artificial no ambiente acadêmico?`
)

projeto_pesquisa_estatistica <- projeto_pesquisa_estatistica |>
  transform(
    linguagem_p_programar        = as.factor(linguagem_p_programar),
    ia_para_programar            = as.factor(ia_para_programar),
    principal_ferramenta_ia      = as.factor(principal_ferramenta_ia),
    sente_falta_de_governanca_ia = as.factor(sente_falta_de_governanca_ia)
  )

summary(projeto_pesquisa_estatistica$principal_ferramenta_ia)


projeto_pesquisa_estatistica$principal_ferramenta_ia <-
  fct_recode(projeto_pesquisa_estatistica$principal_ferramenta_ia,
             "DeepSeek" = "Deepseek")
summary(projeto_pesquisa_estatistica$principal_ferramenta_ia)

saveRDS(projeto_pesquisa_estatistica, "projeto_pesquisa_estatistica.rds")

