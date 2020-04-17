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
[vTable,fcnCount] = policy_evaluation(randomPolicy, gw, discountFactor, nIteration, tol);

%% Display State value function
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
fcnCount = 1;

%% Begin Iteration
error('ENTER YOUR CODE HERE (╯°□°)╯︵ ┻━┻')
end