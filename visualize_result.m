function visualize_result(data, label, algo_name, ncut, k)
% plot graph of data

%% get global variables
global N
N = size(data, 1);

s1 = 'Algorithm: ';
s1 = strcat(s1, algo_name);
s2 = ' - NCut: ';
s2 = strcat(s2, num2str(ncut));
s = strcat(s1, s2);
s3 = ' - K: ';
s3 = strcat(s3, num2str(k));
s = strcat(s, s3)


%% visualize data: it's shape is ., and different colors used as per labels
for i=1:N
    switch label(i, 1)
        case 1
            plot(data(i,1), data(i,2), 'k.')
            hold on
        case 2
            plot(data(i,1), data(i,2), 'r.')
            hold on
        case 3
            plot(data(i,1), data(i,2), 'b.')
            hold on
        case 4
            plot(data(i,1), data(i,2), 'g.')
            hold on
        case 5
            plot(data(i,1), data(i,2), 'm.')
            hold on
        case 6
            plot(data(i,1), data(i,2), 'c.')
            hold on
        case 7
            plot(data(i,1), data(i,2), 'y.')
            hold on
        case 8
            plot(data(i,1), data(i,2),'--gs','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor',[0.78,0.082,0.522],'MarkerFaceColor',[0.78,0.082,0.522])
            hold on
        case 9
            plot(data(i,1), data(i,2),'--gs','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor',[1,0.498,0.314],'MarkerFaceColor',[1,0.498,0.314])
            hold on
        case 10
            plot(data(i,1), data(i,2),'--gs','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor',[0.498, 1.000, 0.831],'MarkerFaceColor',[0.498, 1.000, 0.831])
            hold on
        case 11
            plot(data(i,1), data(i,2),'--gs','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor',[0.282, 0.820, 0.800],'MarkerFaceColor',[0.282, 0.820, 0.800])
            hold on
        case 12
            plot(data(i,1), data(i,2),'--gs','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor',[0.957, 0.643, 0.376],'MarkerFaceColor',[0.957, 0.643, 0.376])
            hold on
        case 13
            plot(data(i,1), data(i,2),'--gs','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor',[1.000, 0.894, 0.882],'MarkerFaceColor',[1.000, 0.894, 0.882])
            hold on
        case 14
            plot(data(i,1), data(i,2),'--gs','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor',[0.000, 0.000, 0.502],'MarkerFaceColor',[0.000, 0.000, 0.502])
            hold on
        case 15
            plot(data(i,1), data(i,2),'--gs','LineWidth',1,'MarkerSize',2,'MarkerEdgeColor',[0.000, 0.545, 0.545],'MarkerFaceColor',[0.000, 0.545, 0.545])
            hold on
        
    end
end
title(s);
end

