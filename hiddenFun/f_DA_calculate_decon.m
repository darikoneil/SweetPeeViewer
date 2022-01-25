function f_DA_calculate_decon(app,value)
%% Documentation Conntents
% Darik O'Neil -1=25=22
% Functrion to rec decon

%% Function bitsd

v = value;
SAMPLES = app.ImData.MCMC{v};



% taken from plot_continouos samples
T = length(app.ImData.imParams.suite2p.AdcF(v,:));
N = length(SAMPLES.ns);
show_gamma = 1;
P = SAMPLES.params;
P.f = 1;
g = P.g(:);
p = min(length(g),2);
Dt = 1/P.f;                                     % length of time bin
if ~isfield(SAMPLES,'g');
    show_gamma = 0;
    SAMPLES.g = ones(N,1)*g';
end

if p == 1
    tau_1 = 0;
    tau_2 = -Dt/log(g);                         % continuous time constant
    G1 = speye(T);
    G2 = spdiags(ones(T,1)*[-g,1],[-1:0],T,T);
    ge = P.g.^((0:T-1)');     
elseif p == 2
    gr = roots([1,-g']);
    p1_continuous = log(min(gr))/Dt; 
    p2_continuous = log(max(gr))/Dt;
    tau_1 = -1/p1_continuous;                   %tau h - smaller (tau_d * tau_r)/(tau_d + tau_r)
    tau_2 = -1/p2_continuous;                   %tau decay - larger
    G1 = spdiags(ones(T,1)*[-min(gr),1],[-1:0],T,T);
    G2 = spdiags(ones(T,1)*[-max(gr),1],[-1:0],T,T);
    ge = G2\[1;zeros(T-1,1)];
else
    error('This order of the AR process is currently not supported');
end


if length(SAMPLES.Cb) == 2
    marg = 1;       % marginalized sampler
else
    marg = 0;       % full sampler
end

C_rec = zeros(N,T);
for rep = 1:N
    %trunc_spikes = ceil(SAMPLES.ss{rep}/Dt);
    tau = SAMPLES.g(rep,:);
    gr = exp(-1./tau);    
    ge = max(gr).^(0:T-1)';
    s_1 =   sparse(ceil(SAMPLES.ss{rep}/Dt),1,exp((SAMPLES.ss{rep} - Dt*ceil(SAMPLES.ss{rep}/Dt))/tau(1)),T,1);  
    s_2 =   sparse(ceil(SAMPLES.ss{rep}/Dt),1,exp((SAMPLES.ss{rep} - Dt*ceil(SAMPLES.ss{rep}/Dt))/tau(2)),T,1);  
    if gr(1) == 0
        G1 = sparse(1:T,1:T,Inf*ones(T,1)); G1sp = zeros(T,1);
    else
        G1 = spdiags(ones(T,1)*[-min(gr),1],[-1:0],T,T); G1sp = G1\s_1(:);
    end
    G2 = spdiags(ones(T,1)*[-max(gr),1],[-1:0],T,T);
    Gs = (-G1sp+ G2\s_2(:))/diff(gr);
    if marg
        %C_rec(rep,:) = SAMPLES.Cb(1) + SAMPLES.Am(rep)*filter(1,[1,-SAMPLES.g(rep,:)],full(s_)+[SAMPLES.Cin(:,1)',zeros(1,T-p)]);
        C_rec(rep,:) = SAMPLES.Cb(1) + SAMPLES.Am(rep)*Gs + (ge*SAMPLES.Cin(:,1));
    else
        %C_rec(rep,:) = SAMPLES.Cb(rep) + SAMPLES.Am(rep)*filter(1,[1,-SAMPLES.g(rep,:)],full(s_)+[SAMPLES.Cin(rep,:),zeros(1,T-p)]);
        C_rec(rep,:) = SAMPLES.Cb(rep) + SAMPLES.Am(rep)*Gs + (ge*SAMPLES.Cin(rep,:)');
    end
end

decon = mean(C_rec,1);

app.ImData.Decon(v,:)=decon;

end
