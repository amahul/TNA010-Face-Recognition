function [person, expression] = qr_classify(z_hat, B, H)

min_diff = inf;
person = -1;
expression = -1;

for e = 1:10
    
    B_e = double(B(:,e,:));
    
    [Q, R] = qr(B_e, 0);

    alpha = R\(Q'*z_hat); % inv(R)*Q'*z_hat    
    
    a = double(alpha);
   
    for p = 1:10  
        no = norm(a-H(p,:)');

        if no < min_diff
            min_diff = no;
            person = p;
            expression = e;
        end               
    end
end
