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
error('ENTER YOUR CODE HERE (╯°□°)╯︵ ┻━┻')

%% Do 1 more iteration to get optimal deterministic policy
optimalDeterministicPolicy = zeros(nS,nA);
error('ENTER YOUR CODE HERE (╯°□°)╯︵ ┻━┻')

end