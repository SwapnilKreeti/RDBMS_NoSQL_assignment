### 1.Determine the highest normal form of this relation scheme. The relation scheme student Performance (StudentName, CourseNo, EnrollmentNo, Grade) hasthe following functional dependencies: StudentName, courseNo → grade EnrollmentNo, courseNo → grade StudentName →EnrollmentNo EnrollmentNo →StudentName
#### Answer: 
* Let’s assume StudentName, courseNo, EnrollmentNo, grade as a,b,c,d respectively.
* Therefore the relation seems:ab->d, cb->d, a->c, c->a. 
* Thus there are two Candidate keys, ab and cb. 
* Now we can see ab->d and cb->d satisfy the condition of BCNF as LHS is superkey in both the relations. 
* But, a->c and c->a, doesn’t satisfy the conditions of BCNF. 
* Hence we check for 3NF for these two Functional Dependencies.
* As c and a on RHS of both the Functional Dependencies are prime attributes, they satisfy the conditions of 3NF. 
* Hence the highest normal form is 3NF.

### 2.Suppose you are given a relation R= (A, B, C, D, E ) with the following functional dependencies:{CE →D, D→B, C →A} a. Find all candidate keys. 
#### Answer:
* We can see that only the attributes C and E are present only on LHS. 
* C alone cannot determine all the other attributes.Thus, C → C 
* E alone cannot determine all the other attributes.Thus, E → E 
* C and E together can form a candidate key. 
* CE → ABCDE.Hence, CE is the only candidate key for the given relation R.

### b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).
#### Answer: 
* The relation R satisfies the first normal form since it consists of atomic values, and there are no repeating groups or nested structures 
* It does not satify the condition, all the non prime attributes should be dependent on candidate keys. Thus it is not in 2NF
* Hence, the best normsl form is 1NF

### c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a new relation, decompose and re-compute the keys and the normal forms they satisfy. 
#### Answer: 
* R can be Decomposed into R1=(A,C) and R2=(B,C,D,E). R1 is in BCNF, R2 is in 2NF.
* Now, R2 can be decomposed into, R21=(C,D,E) and R22=(B,D). Both relations are in BCNF

### 3.You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F): F ={ABC → D, ABD→E,CD→F,CDF →B,BF →D} a. Find all keys of R based on these functional dependencies.
#### Answer: 
* Candidate keys are: {A,B,C} and {A,C,D} 

### b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers.
#### Answer: 
* It is not in BCNF.ABD → E and ABD is not a superkey. 
* It is not in 3NF.ABD → E, and ABD is not a superkey and E is not prime attribute.

### 4.Write the advantages and disadvantages of normalization. 
#### Answer:  
* i.Advantages are as follows- Data Consistency: Normalization helps maintain data consistency by minimizing redundancy and eliminating data anomalies such as update, insert, and delete anomalies. This ensures that data remains accurate and up-to-date.
* Efficient Data Storage: Normalization reduces data duplication by organizing data into multiple smaller tables. This leads to efficient storage utilization, as each piece of information is stored only once. It helps optimize database storage and improves overall system performance.
* Improved Data Integrity: By eliminating redundancy and maintaining relationships through normalization, data integrity is improved. Changes made to data are automatically reflected in all relevant places, reducing the risk of inconsistencies or conflicting information.  
* ii. Disadvantages are as follows- Increased Complexity: Normalization can increase the complexity of queries involving multiple tables. As data is spread across different tables, more complex joins are often required to retrieve desired information. This can affect query performance and increase the development and maintenance complexity of the database. 
* Performance Overhead: In highly normalized databases, multiple joins are required to retrieve related data, which can impact query performance, especially for complex queries or large datasets. Denormalization may be necessary in certain scenarios to improve performance at the expense of some redundancy.

### 5.Determine the decomposition. Consider the schema R = (S T U V) and the dependencies S → T, T → U, U → V, and V → S. Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅ .
#### Answer: 
* R1∩R2 ≠ Ø shows there is common attribute in R1 and R2. 
* If we decompose it like R1(S, T, U) and R2(U, V) then we can say that decomposition is lossless. 
* Because common attribute is U and LHS of every Functional dependencies are candidate key. 
* Thus it is in 2NF and 3NF also.
