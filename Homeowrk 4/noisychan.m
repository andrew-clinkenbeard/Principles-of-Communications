% noisychan.m generate 4-level data and add noise
m=1000;                          % length of data sequence
p=.01; s=2.2;                    % power of noise and signal
x2=pam(m,2,s);                    % 4-PAM input with power 1...
x4=pam(m,4,s);
x6=pam(m,6,s);
L=sqrt(1/5);                     % ...with amp levels L
n=sqrt(p)*randn(1,m);            % noise with power p
y2=x2+n;                           % output adds noise to data
y4=x4+n;
y6=x6+n;
qy2=quantalph(y2,[-3*L,-L,L,3*L]); % quantize to [-3*L,-L,L,3*L]
qy4=quantalph(y4,[-3*L,-L,L,3*L]);
qy6=quantalph(y6,[-3*L,-L,L,3*L]);
err2=sum(abs(sign(qy2'-x2)))/m;     % percent transmission errors
err4=sum(abs(sign(qy4'-x4)))/m;
err6=sum(abs(sign(qy6'-x6)))/m;


subplot(1,3,1)
plot([1:m],err2,'b.')
hold on
plot([1:m],y2,'r.')
hold off
subplot(1,3,2)
plot([1:m],err4,'b.')
hold on
plot([1:m],y4,'r.')
hold off
subplot(1,3,3)
plot([1:m],err6,'b.')
hold on
plot([1:m],y6,'r.')
hold off

%% loop to check for err of 2 and 6 equal to 0
% 
% for i=-100:.1:1000
%     m=1000;                          % length of data sequence
%     p=.01; s=i;                    % power of noise and signal
%     x2=pam(m,2,s);                    % 4-PAM input with power 1...
%     x6=pam(m,6,s);
%     L=sqrt(1/5);                     % ...with amp levels L
%     n=sqrt(p)*randn(1,m);            % noise with power p
%     y2=x2+n;                           % output adds noise to data
%     y6=x6+n;
%     qy2=quantalph(y2,[-3*L,-L,L,3*L]); % quantize to [-3*L,-L,L,3*L]
%     qy6=quantalph(y6,[-3*L,-L,L,3*L]);
%     err2=sum(abs(sign(qy2'-x2)))/m;   % percent transmission errors
%     err6=sum(abs(sign(qy6'-x6)))/m;
%     if (err2 == 0 || err6 == 0)
%         i
%         err2
%         err6
%     end
%     
% end
% 
