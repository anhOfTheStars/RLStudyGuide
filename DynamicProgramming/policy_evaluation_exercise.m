close all; clear; clc

%% Set up GridWorld environment Sutton-Barto 4.1
gw = createSimpleGW();
% number of states
nS = numel(gw.States);
% number of possible actions
nA = numel(gw.Actions);

%% Random policy to be evaluate
random_policy = 0.25*ones(nS,nA); % from each state, take all possible action equally (accept "" action)
discount_factor = 1;
tol = 1e-3;
nIteration = 200;

%% Policy Evaluation
[vTable,fcnCount] = policy_evaluation(random_policy, gw, discount_factor, nIteration, tol);
% display State value function
vTable = reshape(vTable,sqrt(nS),[]);
fprintf('Value Evaluation converged after %d iterations;\n',fcnCount);
disp(vTable)

function [vTable,fcnCount] = policy_evaluation(policy, env, discount_factor, nIteration, tol)
% [vTable,fcnCount] = policy_evaluation_gw(policy, env, gamma, nIteration, tol) evaluate a policy on an MDP environment
% nS, nA: number of states, actions
%
% Inputs:
%   - policy: nS-by-nA matrix, each element stores the probability of taking
%     an action from a given state
%   - env: grid world environment
%   - discount_factor: discount factor (aka gamma)
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
fcnCount = 1;

%% Begin Iteration
error('ENTER YOUR CODE HERE (╯°□°)╯︵ ┻━┻')
end