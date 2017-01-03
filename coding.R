

#999=Missing

codeString = 
"Question 1-Age?
As is

Question 2-Sex?
Male=1
Female=2

Question 3-Grade?
9th Grade=1
10th Grade=2
11th Grade=3
12th Grade=4

Question 4-Religion?
Christian=1
Jewish=2
Muslim=3
Hindu=4
Buddhist=5
Other=6

Question 5-Ethnicity?
American Indian or Alaska Native=1
Asian=2
Black or African American=3
Hispanic or Latino=4
Native Hawaiian or Other Pacific Islander=5
White=6
Other=7

Question 6-Education level of parent(s)?
High school degree=1
Undergraduate degree=2
Graduate degree=3
Post graduate degree=4
Other=5
Two_year technical college=6

Question 7-Who do you live with?
Mother=1
Father=2
Both Parents=3

Question 8-Are you sexually active?
Yes=1
No=2
Do not wish to answer=3

Question 9-Do you use contraception?
Pill (for contraception)=1
Barrier methods (condoms/diaphragms)=2
Intrauterine device (IUD)=3
Other=4
Not applicable=5

Question 10-Have you seen a pediatrician in the past year?
Yes=1
No=2
I don't know=3

Question 11-Did they discuss vaccinations/immunization with you?
Yes=1
No=2
I don't know=3

Question 12-Which vaccine did they discuss?
Flu vaccine=1
Gardasil vaccine=2
I don't know=3
Meningococcal vaccine=4
No vaccines=5

Question 13-Did you take Health in school?
Yes=1
No=2
I don't know=3

Question 14-Did you learn about vaccination in health/biology class?
Yes=1
No=2
I don't know=3

Question 15-Which ones do you remember discussing?
Flu vaccine=1
Gardasil vaccine=2
I don't know=3
Meningococcal vaccine=4
Did not discuss any vaccines=5

Question 16-Did you learn about safe sex in your health class?
Yes=1
No=2
I don't know=3

Question 17-Do you know what the Human Papilloma Virus (HPV) is?
Don't know at all=1
May know=2
May know a little=3
Know a lot=4
Know everything=5

Question 18-Do you know that HPV is an STD (Sexually Transmitted Disease)?
Definitely not=1
I don't think so=2
I don't know=3
Maybe=4
Definitely yes=5

Question 19-Do you know the origin of cervical cancer?
Don't know at all=1
May know=2
May know a little=3
Know a lot=4
Know everything=5

Question 20-Do you know what a Pap test is?
Don't know at all=1
May know=2
May know a little=3
Know a lot=4
Know everything=5

Question 21-Do you know that HPV can cause abnormal Pap tests?
Definitely not=1
I don't think so=2
I don't know=3
Maybe=4
Definitely yes=5

Question 22-Do you think HPV causes cervical cancer?
Definitely not=1
I don't think so=2
I don't know=3
Maybe=4
Definitely yes=5



Question 23-What do you think of vaccination/immunization?
Very harmful=1
Somewhat harmful=2
I don't know=3
Somewhat helpful=4
Very helpful=5

Question 24-Have you received the HPV vaccine?
Definitely not=1
I don't think so=2
I don't know=3
Maybe=4
Definitely yes=5

Question 25-Why have you not received the vaccine?
I didn't know it existed=1
I have received the vaccine=2
I don't approve of vaccines=3
My parents don't approve of vaccines=4
Not sure/Other=5

Question 26-Have your parents/pediatrician ever recommended the vaccination against HPV?
Definitely not=1
I don't think so=2
I don't know=3
Maybe=4
Definitely yes=5

Question 27-FREE RESPONSE

Question 28-Do you know why boys receive the vaccine as well as girls?
Don't know at all=1
May know=2
May know a little=3
Know a lot=4
Know everything=5

Question 29-Would you be willing to be vaccinated against HPV?
Definitely not=1
I don't think so=2
I don't know=3
Maybe=4
Definitely yes=5

Question 30-FREE RESPONSE

Question 31-Were you previously aware of the existence of the HPV vaccine?
Definitely not=1
I don't think so=2
I don't know=3
Maybe=4
Definitely yes=5
"
survey$Age. = as.numeric(survey$Age.)
codes = strsplit(codeString, split="Question ")[[1]]
length(codes)
codes = codes[-(1:2)]
codeNums = sapply(strsplit(codes, split="-"), '[', 1)
columnNums = as.numeric(codeNums) + 1
qnames = sapply(strsplit(codes, split="-"), '[', -1)
qnames[which(sapply(qnames, length) == 2)]
surv_recoded = survey
for(columnNum in columnNums) {
  codeNum = columnNum - 2
  column = surv_recoded[[columnNum]]
  column = gsub("[:space:]+$", "", column, perl=FALSE)
  qnameSplit = strsplit(qnames[codeNum], split = '\n')[[1]]
  qname = qnameSplit[1]
  cat("qname: ", qname, "\n")
  qcodes = qnameSplit[-1]
  cat("qcodes: ", qcodes, " length ", length(qcodes), "\n")
  if(length(qcodes) <= 1) next
  qcodes = qcodes[qcodes!=""]
  splitCodes = strsplit(qcodes, split='=')
  print(splitCodes)
  for(nvalue in seq(along=splitCodes)) {
    cat("\t", splitCodes [[nvalue]], "\n" )
    value = gsub(" +$", "", splitCodes [[nvalue]] [2])
    column[ value  == column ] =
      splitCodes[[nvalue]][1]
  }
  surv_recoded[[columnNum]] = column
  
}