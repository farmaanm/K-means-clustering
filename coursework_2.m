clear; close all; clc;

%% Name: Mohamed Mohamed
% Plymouth Index: 10749829

%% Task 2.1 - Data Preperation
% Generating data
X = gen_kmeansdata(10749829);

% Reporting number of rows(N), mean(M), standard deviation(S) for each column
N = size(X,1);
M = mean(X);
S = std(X);

% Displaying histogram
histogram(X);

% Reporting covariance and correlation matrices (4x4)
cov_matrix = cov(X);
cor_matrix = corrcoef(X);

%% Task 2.2 - K Means
% Assigning empty array to append mean Silhouettes for K=3,4,5
mean_silh_array = [];

% Iterating to assign different cluster values
for K = [3, 4, 5]

    figure(K-1)
    
    % Seperating data into K clusters
    % idx - cluster indexes, C - centroids
    [idx, C, sum] = kmeans(X, K);
    
    % Evaluating quality of cluster
    [silh, h] = silhouette(X, idx, 'sqEuclidean');

    % Plotting the Silhouette for different K   
    title(['Number of Clusters = ' int2str(K)]);
    xlabel 'Silhouette Value'
    ylabel 'Cluster'

    % Appending the mean Silhoette to an array
    mean_silh = mean(silh);
    mean_silh_array(end+1) = mean_silh;

    % Plotting the Cluster and Centroids for K=5
    figure(K+2);

    plot(X(idx == 1, 1), X(idx == 1, 2), 'r.', 'MarkerSize', 9)
    hold on
    plot(X(idx == 2, 1), X(idx == 2, 2), 'g.', 'MarkerSize', 9)
    hold on
    plot(X(idx == 3, 1), X(idx == 3, 2), 'b.', 'MarkerSize', 9)
    hold on
    plot(X(idx == 4, 1), X(idx == 4, 2), 'm.', 'MarkerSize', 9)
    hold on
    plot(X(idx == 5, 1), X(idx == 5, 2), 'c.', 'MarkerSize', 9)
    
    plot(C(:, 1), C(:, 2), 'kx', 'MarkerSize', 10, 'LineWidth', 2) 
    
    if K == 3
        legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Centroids', 'Location', 'NW')
    elseif K == 4
        legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Centroids', 'Location', 'NW')
    elseif K == 5
        legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Cluster 5', 'Centroids', 'Location', 'NW')
    end

    title([int2str(K) ' Clusters and Centroids']);
    hold off

    disp(['K = ', num2str(K), '; The mean Silhouette measure = ', num2str(mean_silh)])

end

% Reporting best number of clusters
mean_silh_dict = dictionary(mean_silh_array, [3, 4, 5]);

% For the optimum K, the mean Silhouette must be closer to 1
max_mean_silh = max(mean_silh_array);
best_cluster = mean_silh_dict(max_mean_silh);
disp(['The best number of Clusters = ', num2str(best_cluster)]);


