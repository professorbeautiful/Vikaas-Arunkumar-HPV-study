library(xlsx)
survey = read.xlsx(file = "SURVEY TABLE.xlsx", sheetIndex = 1, stringsAsFactors=FALSE)
survey = survey[ , -(1:8)]
survey = survey[ -1, ]
names(survey)
# Did PCP discuss vaccinations/immunization with you?
PCPdiscussColumns = 17:(17+4)
names(survey)[PCPdiscussColumns] = paste0("PCP.", names(survey)[PCPdiscussColumns])
"Flu vaccine	Gardasil vaccine	Meningococcal vaccine	I don’t know	No vaccines"
# Did they (health class) discuss vaccinations/immunization with you?
healthclassdiscussColumns = 24:(24+4)
names(survey)[healthclassdiscussColumns] = paste0("class.", names(survey)[healthclassdiscussColumns])

dump("survey", file = "survey.dmp")
