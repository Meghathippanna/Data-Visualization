library(tidyr)
library(ggplot2)
data(iris)
View(iris)

long_iris=gather(iris,parameter,measure,Sepal.Length:Petal.Width,factor_key=TRUE)
View(long_iris)

base_graph=ggplot(long_iris,aes(x=Species, y=measure))+
  labs(x="Species", y="Length in cm", title="Variation in Petal and Sepal of Iris species")+
  theme_bw()+
  facet_grid(~parameter)+
  aes(fill=Species)
print(base_graph)

graph2=base_graph+geom_violin()
print(graph2)

final_graph=base_graph+geom_violin(color="black", fill= "Pink")+
  geom_boxplot(width=0.1, color="black", alpha=0.5)+
  theme(axis.text.x = element_text(colour = "brown", size = 15, angle = 90, hjust = 0.5, vjust = 0.5),
        axis.text.y = element_text(colour = "grey20", size = 15),
        text = element_text(size = 20))
print(final_graph)

graph1=base_graph+geom_boxplot()
print(graph1)
