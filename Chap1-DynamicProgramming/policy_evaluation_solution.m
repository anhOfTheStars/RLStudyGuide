close all; clear; clc

%% Set up GridWorld environment Sutton-Barto 4.1
gw = createSimpleGW();
% number of states
nS = numel(gw.States);
% number of possible actions
nA = numel(gw.Actions);

%% Random policy to be evaluate
% from each state, equally likely to take any action
randomPolicy = (1/nA)*ones(nS,nA);

%% Policy Evaluation
discountFactor = 1;
tol = 1e-3;
nIteration = 200;
[vTable,fcnCount] = policy_evaluation(random_policy, gw, discountFactor, nIteration, tol);
% display State value function
vTable = reshape(vTable,gw.GridSize);
fprintf('Value Evaluation converged after %d iterations;\n',fcnCount);
disp(vTable)

function [vTable,fcnCount] = policy_evaluation(policy, env, discountFactor, nIteration, tol)
% [vTable,fcnCount] = policy_evaluation_gw(policy, env, gamma, nIteration, tol) evaluate a policy on an MDP environment
% nS, nA: number of states, actions
%
% Inputs:
%   - policy: nS-by-nA matrix, each element stores the probability of taking
%     an action from a given state
%   - env: grid world environment
%   - discountFactor: discount factor (aka gamma)
%   - nIteration: maximum number of iteration before return
%   - tol: stop evaluation once value function change is less than tol for all
%     states
%
% Outputs: 
%   - vTable: state value function V(s), nS-by-1
%   - fcnCount: iteration counter

%% Set up useful variables
nS = numel(env.States);
nA = numel(env.Actions);

%% InitializationV(s) = 0
vTable = zeros(nS,1);
terminate = false;
fcnCount = 1;

%% Begin Iteration
while (~terminate) && (fcnCount < nIteration)
    delta = 0;
    for stateIdx = 1:nS
        tempStateValue = 0;        
        for actionIdx = 1:nA
            % pi(a|s)
            actionProbability = policy(stateIdx,actionIdx);
            
            % get transition probility p(s',r|s,a) and r from state transition
            transitionProb = env.T(stateIdx,:,actionIdx);
            reward = env.R(stateIdx,:,actionIdx)';
            
            % Bellman equation for state value function V(s) update
            tempStateValue = tempStateValue + ...
                actionProbability*(transitionProb*(reward + discountFactor*vTable));
        end
        
        % find how much change in V(s)
        delta = max(delta,(abs(tempStateValue - vTable(stateIdx))));
        
        % update V(s)
        vTable(stateIdx) = tempStateValue;
    end
    
    % terminate if change in V(s) is less than tolerance
    if delta < tol
        terminate = true;
    end
    
    % increment counter
    fcnCount = fcnCount + 1;
end
end