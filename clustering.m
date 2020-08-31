load("mnist_train.mat");
k = 20;
digits = digits(:,1:4000);
[n, m] = size(digits);
z = digits(:,1:k);
group = zeros(1,m);
while(true)
    termination = true;
    for i = 1:m
        nearest_centroid = 0;
        nearest_dist = Inf;
        for j = 1:k
            diff = z(:,j) - digits(:,i);
            norm_sqr = diff' * diff;
            if(nearest_dist > norm_sqr)
                nearest_centroid = j;
                nearest_dist = norm_sqr;
            endif
        endfor
        group(1,i) = nearest_centroid;
    endfor
    old_cluster_sum = ones(1,k);
    new_cluster_sum = ones(1,k);
    for i = 1:k
        cluster = find(group == i);
        [q, p] = size(cluster);
        cluster_mean = zeros(n,1);
        for j = 1:p
            cluster_mean = cluster_mean + digits(:,cluster(1,j));
            new_cluster_sum(:,i) = new_cluster_sum(:,i) + ones(1,n)*digits(:,cluster(1,j));
        endfor
        cluster_mean = cluster_mean / p;
        z(:,i) = cluster_mean;
    endfor
    for i = 1:k
        if( new_cluster_sum(:,i) != old_cluster_sum(:,i) )
            termination == false;
            break;
        endif 
    endfor 
    termination
    if( termination == true)
        break;
    endif 
    old_cluster_sum = new_cluster_sum;
endwhile
for i = 1:k
    cluster = find( group == i);
    im = reshape(digits(:,cluster(1,1)), 28,28);
    subplot(5, 4, i), imshow(im);
endfor
