% Task 2

% Task 2.1 - Data Preperation
X = gen_kmeansdata(10749829);

N = size(X,1);
M = mean(X);
S = std(X);

histogram(X)

% Task 2.2 - K Means
% for K = [3, 4, 5]
%     [idx,C,sumd]=kmeans(X,K);
%     [silh,h] = silhouette(X,idx,'sqEuclidean');
%     title(['Number of clussters = ' int2str(K)]);
%     xlabel 'Silhouette Value '
%     ylabel 'Cluster'
%     mean_silh=mean(silh);
% end

K = 3;
[idx,C,sumd]=kmeans(X,K);
[silh,h] = silhouette(X,idx,'sqEuclidean');
title(['Number of clussters = ' int2str(K)]);
xlabel 'Silhouette Value '
ylabel 'Cluster'
mean_silh=mean(silh);

figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
hold on
plot(X(idx==3,1),X(idx==3,2),'g.','MarkerSize',12)

plot(C(:,1),C(:,2),'kx', 'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Centroids', 'Location','NW')
title 'Cluster Assignments and Centroids'
hold off


