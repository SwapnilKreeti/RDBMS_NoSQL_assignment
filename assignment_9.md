### 1. What are the main features of redis?
#### Answer:
* Data structures: Redis supports various data types like strings, lists, sets, hashes, and sorted sets, enabling complex data modeling.
* High performance: Being an in-memory database, Redis provides fast read and write operations, making it suitable for caching and real-time applications.
* Pub/Sub messaging: Redis supports Publish/Subscribe messaging, allowing for real-time communication between clients.
* Persistence options: Redis offers options for data persistence, enabling data durability and recovery after restarts.
* Advanced features: Redis includes features like transactions, Lua scripting, and atomic operations for efficient data manipulation.

### 2. Write down the limitations of redis?
#### Answer:
* Data size: Redis is limited by the amount of available memory and may not be suitable for handling extremely large datasets that cannot fit in memory.
* Durability: Although Redis offers persistence options, they introduce disk I/O and can impact performance. It is primarily designed for high-speed in-memory operations rather than durable storage.
* Complex queries: Redis lacks advanced querying capabilities found in traditional SQL databases, limiting complex data retrieval and analysis.
* Single-threaded: Redis operates as a single-threaded process, which can limit its ability to handle concurrent requests and may impact performance in certain scenarios.
* Scalability: While Redis provides options for sharding and clustering, scaling Redis horizontally across multiple nodes can introduce complexity compared to some other distributed database systems.
