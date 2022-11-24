clear; close all; clc;

%% Task 2.1 - Data Preperation
% Generating data
X = gen_kmeansdata(10749829);

% Reporting number of rows(N), mean(M), standard deviation(S) for each column
N = size(X,1);
M = mean(X);
S = std(X);

% Displaying histogram
histogram(X)

% Reporting covariance and correlation matrices (4x4)
cov_matrix = cov(X);
cor_matrix = corrcoef(X);

%% Task 2.2 - K Means
% Assigning empty array to append mean Silhouettes for K=3,4,5
mean_silh = [];

% Iterating to assign different cluster values
for K = [3, 4, 5]

    figure(K-1)
    
    % Seperating data into K clusters
    % idx - cluster indexes, C - centroids
    [idx, C, sumd] = kmeans(X, K);
    
    % Evaluating quality of cluster
    [silh, h] = silhouette(X, idx, 'sqEuclidean');

    % Plotting the Silhouette for different K   
    title(['Number of Clusters = ' int2str(K)]);
    xlabel 'Silhouette Value'
    ylabel 'Cluster'

    % For the optimum K, the mean Silhouette must be closer to 1
    mean_silh(end+1) = mean(silh);
    
end

% figure(5);
% plot(X(idx==1,1), X(idx==1,2), 'r.', 'MarkerSize', 8)
% hold on
% plot(X(idx==2,1), X(idx==2,2), 'g.', 'MarkerSize', 8)
% hold on
% plot(X(idx==3,1), X(idx==3,2), 'b.', 'MarkerSize', 8)
% hold on
% plot(X(idx==4,1), X(idx==4,2), 'c.', 'MarkerSize', 8)
% hold on
% plot(X(idx==5,1), X(idx==5,2), 'm.', 'MarkerSize', 8)
% 
% plot(C(:,1), C(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3) 
% legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Cluster 5', 'Centroids', 'Location', 'NW')
% title 'Clusters and Centroids'
% hold off


