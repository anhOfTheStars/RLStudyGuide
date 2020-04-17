function gw = createSimpleGW()
% gw = createSimpleGW() creates gridworld in example 4.1 of 
% Reinforcement Learning, An Introduction - Sutton and Barto

% 4 by 4 grid world. 
% action that take agent off the grid leave its location unchanged
% reward is -1 on all transitions until the terminal state is reached
% 2 terminal states "[1,1]", "[4,4]"

gw = createGridWorld(4,4);
% set up initial state
gw.CurrentState = "[2,2]";
% set up terminal state
gw.TerminalStates = ["[1,1]" "[4,4]"];
% number of states
nS = numel(gw.States);
% number of possible actions
nA = numel(gw.Actions);

% cannot move from terminal states
gw.T(state2idx(gw,gw.TerminalStates),:,:) = 0;

% set rewards transitions (-1 for all state, action, next state)
gw.R = repmat(-1*ones(nS),[1 1 nA]);
end