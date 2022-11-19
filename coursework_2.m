clear; close all; clc;

%% Task 2.1 - Data Preperation
X = gen_kmeansdata(10749829);

% Reporting number of rows, mean, standard deviation for each column
N = size(X,1);
M = mean(X);
S = std(X);

% Reporting covariance and correlation matrices (4x4)
cov_matrix = cov(X);
cor_matrix = corrcoef(X);

% Displaying histogram
histogram(X)

%% Task 2.2 - K Means
for K = [3, 4, 5]
    figure(K-1)
    [idx,C,sumd] = kmeans(X,K);
    [silh,h] = silhouette(X, idx, 'sqEuclidean');
    title(['Number of Clusters = ' int2str(K)]);
    xlabel 'Silhouette Value '
    ylabel 'Cluster'
    mean_silh = mean(silh);
end

figure(5);
plot(X(idx==1,1), X(idx==1,2), 'r.', 'MarkerSize', 12)
hold on
plot(X(idx==2,1), X(idx==2,2), 'b.', 'MarkerSize', 12)
hold on
plot(X(idx==3,1), X(idx==3,2), 'g.', 'MarkerSize', 12)
hold on
plot(X(idx==4,1), X(idx==4,2), 'c.', 'MarkerSize', 12)
hold on
plot(X(idx==5,1), X(idx==5,2), 'm.', 'MarkerSize', 12)

plot(C(:,1), C(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3) 
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Cluster 5', 'Centroids', 'Location', 'NW')
title 'Clusters and Centroids'
hold off


