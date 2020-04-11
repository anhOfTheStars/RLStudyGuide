# RLStudyGuide
How to Learn Reinforcement Learning: A Step-by-step Guide

| Algorithm     | Required Concepts | Learning Materials |
| ------------- | ------------- | ------------- |
| Dynamic Programming<br/>•	Policy Evaluation<br/>•	Policy Improvement<br/>• Value Iteration | • Markov Decision Process<br/>• Expected return<br/>• Discount factor<br/>• State, Observation<br/>• Action<br/>• Reward<br/>•	State value function V(s)<br/>•	State-action value function Q(s,a) | • [MATLAB Tech Talk][1] Part 1: What is RL?<br/>•	[MATLAB Tech Talk][1] Part 2: Understanding the Environment and Rewards<br/>• [RL Textbook][2] - Chapter 3+4: Finite MDP + Dynamic Programming<br/>•	[WildML][3] – Dynamic Programming exercises<br/>•	[David Silver’s Lecture][4] 1+2 |
| Temporal-Difference (TD) Learning<br/>•	Q-Learning<br/>• SARSA | • TD Error<br/>• On-policy vs off-policy<br/>•	Epsilon greedy  | • [RL Textbook][2] - Chapter 6: Temporal Difference Learning<br/>•	[WildML][3] – SARSA, Q-Learning exercises |
| Function Approximation (replace table with neural network)<br/>• Deep Q-Learning | RL<br/>•	Why tables cannot scale<br/>•	Relationship with supervised learning<br/>•	Replay memory<br/>•	Target network<br/>• Partially observable environment<br/>•	Frame stacking for ATARI game environment<br/>•	Typical DQN network<br/>•	Double Q Learning<br/><br/> Deep Learning<br/>•	Supervised Learning<br/>•	Feedforward network<br/>•	Convolution neural network | RL<br/>•	[David Silver’s Lecture][4] 6: Value function approximation<br/>•	[WildML][3] – Q-Learning with Linear Function Approximation<br/>•	[DeepMind DQN paper][5]<br/>•	[WildML][3] – Deep Q-Learning for Atari Games<br/>•	[Arthur Juliani’s series][7] Part 4 – Deep Q-Networks<br/>•	[Pytorch DQN Tutorial][6]<br/><br/>Deep Learning<br/> • [Deep Learning Specialization][8] Course 1+2 |
| Policy gradient<br/>•	REINFORCE (vanilla policy gradient)<br/>•	Actor Critic | •	Actor<br/>•	Critic<br/>•	Stochastic policy<br/>•	Statistics: distribution (focus on normal/Gaussian distribution), sample from a distribution, entropy, probability density function<br/>•	How to model discrete stochastic policy vs continuous stochastic policy<br/>•	Importance sampling<br/>•	KL divergence |•	[RL Textbook][2] – Chapter 13: Policy Gradient Methods<br/>•	[WildML][3] – Policy Gradient exercises<br/>•	[OpenAI Spinning Up][9] – Vanilla Policy Gradient<br/>•	[Deep RL Berkeley][10] – Policy Gradients + Actor-Critic Algorithms |
| Advanced Policy Gradient<br/>•	Deep Deterministic Policy Gradient (DDPG)<br/>•	Twin Delayed DDPG (TD3)<br/>•	Proximal Policy Optimization (PPO)<br/>•	Trust Region Policy Optimization (TRPO) | • Continuous action space<br/>•	Deterministic policy<br/>•	Deterministic policy gradient<br/> | •	[Deep RL Berkeley][10] – Advanced Policy Gradients<br/>•	Original papers <br/>•	[OpenAI Spinning Up][9] – PPO, TRPO, DDPG and TD3  |

[1]: https://www.mathworks.com/videos/series/reinforcement-learning.html
[2]: http://incompleteideas.net/book/RLbook2018.pdf
[3]: https://github.com/dennybritz/reinforcement-learning
[4]: https://www.davidsilver.uk/teaching/
[5]: https://storage.googleapis.com/deepmind-media/dqn/DQNNaturePaper.pdf
[6]: https://pytorch.org/tutorials/intermediate/reinforcement_q_learning.html
[7]: https://medium.com/@awjuliani
[8]: https://www.coursera.org/specializations/deep-learning
[9]: https://spinningup.openai.com/en/latest/spinningup/rl_intro.html
[10]: http://rail.eecs.berkeley.edu/deeprlcourse/
