# Global Agent Instructions

## Memory / Knowledge Graph

At the **start of every session**, always read the knowledge graph (`memory_read_graph` or `memory_search_nodes`) to recall context, decisions, and insights from previous sessions.

Throughout the session, **proactively store** the following in the knowledge graph:
- Important architectural decisions and rationale
- User preferences and conventions
- Key findings from codebase exploration
- Task context that may be relevant in future sessions
- Project-specific terminology or domain knowledge

Do not wait for the user to ask -- treat the knowledge graph as your persistent memory and use it continuously.

