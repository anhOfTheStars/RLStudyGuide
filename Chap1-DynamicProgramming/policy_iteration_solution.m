close all; clear; clc

%% Set up GridWorld environment Sutton-Barto 4.1
gw = createSimpleGW();
% number of states
nS = numel(gw.States);
% number of possible actions
nA = numel(gw.Actions);

%% Policy Iteration
discountFactor = 1;
tol = 1e-3;
nIteration = 200;
[vTable, optimalDeterministicPolicy, fcnCount] = policy_iteration(gw, discountFactor, nIteration, tol);
% display State value function
vTable = reshape(vTable,gw.GridSize);
fprintf('Policy Iteration converged after %d iterations;\n',fcnCount);
disp(vTable)

%% Local Functions
function [vTable, optimalDeterministicPolicy, fcnCount] = policy_iteration(env, discountFactor, nIteration, tol)
% [vTable,optimalDeterministicPolicy,fcnCount] = value_iteration(env, discountFactor, nIteration, tol) 
% evaluate a policy on an MDP environment with Policy Iteration algorithm
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

%% Initialization V, policy
vTableTemp = zeros(nS,1);
optimalDeterministicPolicy = ones(nS,nA)/nA;
policyStable = false;
fcnCount = 1;

%% Begin iteration
while ~policyStable && (fcnCount < nIteration)
    
    %% Policy Evaluation
    vTable = policy_evaluation(optimalDeterministicPolicy, env, discountFactor, nIteration, tol);    
    
    %% Policy Improvement
    newPolicy = zeros(nS,nA);
    
    % for each state s
    for stateIdx = 1:nS
        vTableTempPerState = zeros(nA,1);
        for actionIdx = 1:nA
            % get reward, transition probility from traversing state transition       
            transitionProb = env.T(stateIdx,:,actionIdx);
            reward         = env.R(stateIdx,:,actionIdx)';
            
            % Bellman equation for state value function (individual action)
            vTableTempPerState(actionIdx) = transitionProb*(reward + discountFactor*vTable);
        end
        
        % Choose optimal deterministic action
        [vTableTemp(stateIdx),bestAction] = max(vTableTempPerState);
        newPolicy(stateIdx,bestAction) = 1;
    end
    
    % if policy does not change after a iteration, terminate
    if isequal(newPolicy, optimalDeterministicPolicy)
        policyStable = true;
        vTable = vTableTemp;
    end
    
    % update for next iteration
    optimalDeterministicPolicy = newPolicy;
    fcnCount = fcnCount + 1;
end

end

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