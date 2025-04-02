# Load required libraries
require("pheatmap") # If not installed
library(pheatmap)

# Generate a random dataset
set.seed(123)
data_matrix <- matrix(rnorm(100), nrow=10)  # 10 samples, 10 features
rownames(data_matrix) <- paste("Sample", 1:10)
colnames(data_matrix) <- paste("Feature", 1:10)

# Perform hierarchical clustering
dist_matrix <- dist(data_matrix)  # Distance matrix
hc <- hclust(dist_matrix, method = "complete")  # Hierarchical clustering
plot(hc, hang=-1)

clusters = cutree(hc, k=4)

# Generate heatmap with dendrogram
pheatmap(data_matrix, 
         clustering_distance_rows = "euclidean", 
         clustering_method = "complete",
         main = "Hierarchical Clustering with Heatmap")

#let's experiment with real data