library(ggdag)
library(ggplot2)

nags_dag <- dagify(nags ~ incentives,
                         incentives ~ other + isupporters,
                         labels = c("nags" = "Support for NAGs", 
                                    "incentives" = "Incentives on Leader",
                                    "isupporters" = "Ideological\n Supporters",
                                    "elites" = "Regime Elites",
                                    "other" = "Other Incentives\n and\n Constraints",
                                    "norms" = "Personal Norms"),
                         exposure = "isupporters",
                         outcome = "nags") 

ggdag(nags_dag, text = FALSE, label_col = "red", stylized = TRUE ,use_labels = "label")+ theme_dag_blank()

ggdag_dseparated(nags_dag, controlling_for = c("other", "incentives"), 
                 text = FALSE, use_labels = "label", collider_lines = FALSE)


mnags_dag <- dagify(nags ~ norms,
                   # incentives ~ supporters + rivals + other,
                   labels = c("nags" = "Support for NAGs", 
                              "incentives" = "Incentives on Leader",
                              "isupporters" = "Ideological\n Supporters",
                              "elites" = "Regime Elites",
                              "rivals" = "Rivals",
                              "other" = "Other Incentives\n and\n Constraints",
                              "norms" = "Leader Personal Norms"),
                   exposure = "norms",
                   outcome = "nags") 

ggdag(mnags_dag, text = FALSE, label_col = "red", stylized = TRUE ,use_labels = "label")+ theme_dag_blank()



nags_dag2 <- dagify(nags ~ incentives,
                   incentives ~ isupporters,
                   isupporters ~ nags,
                   labels = c("nags" = "Support for NAGs", 
                              "incentives" = "Incentives on Leader",
                              "isupporters" = "Ideological\n Supporters",
                              "elites" = "Regime Elites",
                              "rivals" = "Rivals",
                              "other" = "Other Incentives\n and\n Constraints",
                              "norms" = "Personal Norms"),
                   exposure = "isupporters",
                   outcome = "nags") 


ggdag(nags_dag2, text = FALSE, label_col = "red", stylized = TRUE ,use_labels = "label")+ theme_dag_blank()

