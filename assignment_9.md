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

### 3. Perform a basic CRUD operation using redis.
#### Answer:
* Create (Set): To create or set a key-value pair in Redis, you can use the SET command. For example, to set a key "name" with the value "Swapnil" in Redis:
  ```SET name "Swapnil"```
* Read (Get): To retrieve the value associated with a key in Redis, you can use the GET command. For example, to retrieve the value of the "name" key:
```GET name```.
This will return the value "Swapnil".
* Update (Set): To update the value of an existing key in Redis, you can use the SET command again. Simply specify the key and the new value. For example, to update the value of the "name" key to "Das":
```SET name "Das"```.
* Delete (Del): To delete a key-value pair in Redis, you can use the DEL command. For example, to delete the "name" key:
```DEL name```. After executing this command, the "name" key and its associated value will be removed from Redis.
```
127.0.0.1:6379> SET name "Swapnil"
OK
127.0.0.1:6379> GET name
"Swapnil"
127.0.0.1:6379> SET name "Das"
OK
127.0.0.1:6379> GET name
"Das"
127.0.0.1:6379> DEL name
(integer) 1
127.0.0.1:6379>
```

### 4. Explain TTL command with an example.
#### Answer:
In Redis, the TTL (Time To Live) command is used to set an expiration time for a key. Once the TTL expires, the key is automatically deleted from Redis. This is useful for scenarios where you want certain data to have a limited lifespan or when you need to manage the memory footprint of your Redis instance.For Example:
* Set a key with a TTL:```SET mykey "Swapnil" EX 50```.This command sets the value "Swapnil" for the key "mykey" and specifies a TTL of 50 seconds (EX stands for expiration in seconds). After 50 seconds, the key "mykey" will be automatically deleted from Redis.
* Check the remaining time to live:```TTL mykey```.This command returns the remaining time to live for the key "mykey". If the key exists and has a TTL set, it will return the number of seconds remaining until the key expires. If the key does not exist or does not have a TTL, it will return -1. If the key exists but has no associated TTL (i.e., it will never expire), it will return -2.
* Extend the TTL of a key:```EXPIRE mykey 100```.This command extends the TTL of the key "mykey" to 100 seconds. If the key already has a TTL set, it will be updated with the new expiration time. If the key does not exist, this command has no effect.
* Remove the TTL of a key (make it persist forever):```PERSIST mykey```.This command removes the TTL of the key "mykey", making it persist forever. The key will no longer have an expiration time.
```
127.0.0.1:6379> SET mykey "Swapnil" EX 50
OK
127.0.0.1:6379> TTL mykey
(integer) 37
127.0.0.1:6379> EXPIRE mykey 100
(integer) 1
127.0.0.1:6379> TTL mykey
(integer) 88
127.0.0.1:6379> PERSIST mykey
(integer) 1
127.0.0.1:6379>
```
### Create a transaction in redis to perform the following operations.
### i.Create two keys in a single line and one key differently. (one value should be number)
#### Answer:
```
127.0.0.1:6379> mset firstname "Swapnil" lastname "Das"
OK
127.0.0.1:6379> set number 100
OK
127.0.0.1:6379>
```
### ii.Read any two value in a single line
#### Answer:
```
127.0.0.1:6379> mget firstname number
1) "Swapnil"
2) "100"
127.0.0.1:6379>
```
### iii.Increment the number value
#### Answer:
```
127.0.0.1:6379> incr number
(integer) 101
127.0.0.1:6379> get number
"101"
127.0.0.1:6379>
```
### iv.Expire any two keys after some time
#### Answer:
```
127.0.0.1:6379> expire firstname 50
(integer) 1
127.0.0.1:6379> expire number 50
(integer) 1
127.0.0.1:6379>
```


  
