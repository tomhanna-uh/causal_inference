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



nags_dag2 <- dagify(ap ~ incentives
                    incentives ~ isupporters + elites
                    # isupporters ~ nags,
                    labels = c("ap" = "Autocracy Promotion", 
                               "incentives" = "Incentives on Leader",
                               "isupporters" = "Ideological\n Supporters",
                               "elites" = "Regime Elites",
                               "rivals" = "Rivals",
                               "other" = "Other Incentives\n and\n Constraints",
                               "norms" = "Personal Norms"),
                    exposure = "isupporters" + "elites",
                    outcome = "nags") 


ggdag(nags_dag2, text = FALSE, label_col = "red", stylized = TRUE ,use_labels = "label")+ theme_dag_blank()



ap_dag <- dagify(ap ~ leaders,
                         leaders ~ incentives,
                         incentives ~ rivalelites + isupporters,
                         labels = c("ap" = "Autocracy Promotion", 
                                    "leaders" = "Regime Leaders",
                                    "rivalelites" = "Rival\n Elites",
                                    "incentives" = "Incentives\n on\n Leaders",
                                    "unhealthy" = "Unhealthy\n Lifestyle",
                                    "isupporters" = "Ideological\n Supporters"),
                         latent = "incentives",
                         exposure = "isupporters",
                         outcome = "ap")

ggdag(ap_dag, text = FALSE, label_col = "blue", stylized = TRUE , use_labels = "label")+ theme_dag_blank()



ap_dag2 <- dagify(ap ~ leaders,
                 leaders ~ incentives,
                 incentives ~ rivalelites + isupporters,
                 labels = c("ap" = "Autocracy Promotion", 
                            "leaders" = "Regime Leaders",
                            "rivalelites" = "Rival\n Elites",
                            "incentives" = "Incentives\n on\n Leaders",
                            "unhealthy" = "Unhealthy\n Lifestyle",
                            "isupporters" = "Ideological\n Supporters"),
                 latent = "incentives",
                 exposure = "isupporters",
                 outcome = "ap")

ggdag(ap_dag2, text = FALSE, label_col = "blue", stylized = TRUE , use_labels = "label")+ theme_dag_blank()

