close all; clear; clc

%% Set up GridWorld environment Sutton-Barto 4.1
gw = createSimpleGW();
% number of states
nS = numel(gw.States);
% number of possible actions
nA = numel(gw.Actions);

%% Value Iteration
discount_factor = 1;
tol = 1e-3;
nIteration = 200;
[vTable, optimalDeterministicPolicy, fcnCount] = value_iteration(gw, discount_factor, nIteration, tol);

%% Display State value function
vTable = reshape(vTable,gw.GridSize);
fprintf('Value Iteration converged after %d iterations;\n',fcnCount);
disp(vTable)

function [vTable, optimalDeterministicPolicy, fcnCount] = value_iteration(env, discountFactor, nIteration, tol)
% [vTable,optimalDeterministicPolicy,fcnCount] = value_iteration(env, gamma, nIteration, tol) 
% evaluate a policy on an MDP environment with Value Iteration algorithm
% nS, nA: number of states, actions
%
% Inputs:
%   - env: grid world environment
%   - discountFactor: discount factor (aka gamma)
%   - nIteration: maximum number of iteration before return
%   - tol: stop evaluation once value function change is less than tol for 
%     all states
%
% Outputs: 
%   - vTable:                     state value function V(s), nS-by-1
%   - optimalDeterministicPolicy: nS-by-nA probability matrix 1 for best 
%     action at a given state, 0 otherwise
%   - fcnCount:                   iteration counter

%% Set up useful variables
nS = numel(env.States);
nA = numel(env.Actions);

%% Initialization V
vTable = zeros(nS,1);
terminate = false;
fcnCount = 1;

%% Begin iteration
while(~terminate) && (fcnCount < nIteration)
    vTableTemp = zeros(nS,1);
    % For each state s
    for stateIdx = 1:nS
        stateValueTemp = zeros(nA,1);
        for actionIdx = 1:nA
            % get reward, transition probility from traversing state transition       
            transitionProb = env.T(stateIdx,:,actionIdx);
            reward         = env.R(stateIdx,:,actionIdx)';            
            
            % Bellman equation for state value function (individual action)
            stateValueTemp(actionIdx) = transitionProb*(reward + discountFactor*vTable);
        end
        % Choose best value
        vTableTemp(stateIdx) = max(stateValueTemp);
    end
    
    % terminate if change in V(s) is less than tolerance
    if sum(abs(vTableTemp(:)-vTable(:))) < tol
        terminate = true;
    end
    
    % update for next iteration
    vTable = vTableTemp;
    fcnCount = fcnCount + 1;
end

%% Do 1 more iteration to get optimal deterministic policy
optimalDeterministicPolicy = zeros(nS,nA);
for stateIdx = 1:nS
    stateValueTemp = zeros(nA,1);
    for actionIdx = 1:nA
        % get reward, transition probility from traversing state transition
        transitionProb = env.T(stateIdx,:,actionIdx);
        reward = env.R(stateIdx,:,actionIdx)';
        
        % Bellman equation for state value function (individual action)
        stateValueTemp(actionIdx) = transitionProb*(reward + discountFactor*vTable);
    end
    
    % set the best action probability to 1
    [~,bestActionIdx] = max(stateValueTemp);
    optimalDeterministicPolicy(stateIdx,bestActionIdx) = 1;
end

end