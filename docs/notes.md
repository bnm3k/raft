# Raft Lecture

- Goal: replicate a log of entries identically across a collection of servers.
- The log is then used to create a replicated state machine.
- steps:
  1. client sends command to server
  2. replicate command to other servers
  3. determine when it's safe to pass commands to the state-machine for
     execution.
- System makes progress as long as any majority of servers are up
- Failure model:
  - fail-stop: stop or pause (not Byzantine)
  - messages can be lost/delayed/arrive out of order

- Approaches to consensus:
  - Symmetric: leader-less, all servers have equal roles, clients can contact
    any server.
  - Asymmetric: leader-based, at any given time, one server is in charge, others
    accept its decisions. Clients communicate with the leader.
- Raft users leader-based approach:
  - normal apprach
  - leader changes
- Raft overview:
  1. leader election
  2. normal operation (basic log replication)
  3. Safety and consistency after leader changes
  4. Neutralizing old leaders
  5. Client interactions - implementing linearizable semantics
  6. Configuration: adding and removing nodes

- Server states:
  - Leader
  - Follower
  - Candidate

## Questions

- what happens after a server has voted and stored its vote to stable media
