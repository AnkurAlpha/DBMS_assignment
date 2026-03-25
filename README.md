# DBMS assingmet

## Docker commands

Start container:

```bash
docker-compose up -d --build
```

or

```bash
docker compose up -d --build
```

Open Mongo shell:

```bash
docker exec -it mongodb_dbms_da2 mongosh
```

---

# PART 1 — EMPLOYEE DATABASE

## 1. Show all databases

```javascript
show dbs
```

## 2. Create/use database `employee_45`

```javascript
use employee_45
```

## 3. Create collection `employee_45`

```javascript
db.createCollection("employee_45")
```

## 4. Insert records

### insertOne

```javascript
db.employee_45.insertOne({
  id: 101,
  name: "Anil",
  age: 28,
  deptname: "Maths",
  city: "Chennai",
  salary: 30000
})
```

### insertMany

```javascript
db.employee_45.insertMany([
  { id: 102, name: "Banu", age: 35, deptname: "Physics", city: "Coimbatore", salary: 45000 },
  { id: 103, name: "Charan", age: 42, deptname: "Maths", city: "Madurai", salary: 60000 },
  { id: 104, name: "Divya", age: 31, deptname: "Chemistry", city: "Chennai", salary: 25000 },
  { id: 105, name: "Eswar", age: 39, deptname: "Biology", city: "Salem", salary: 52000 },
  { id: 106, name: "Farah", age: 45, deptname: "Maths", city: "Trichy", salary: 58000 }
])
```

## 5. Show all documents

```javascript
db.employee_45.find()
```

## 6. Show all documents in pretty JSON format

```javascript
db.employee_45.find().pretty()
```

## 7. Display employees in Maths department

```javascript
db.employee_45.find({ deptname: "Maths" })
```

## 8. Display employee whose ID is 102

```javascript
db.employee_45.find({ id: 102 })
```

## 9. Display employees not belonging to Chennai

```javascript
db.employee_45.find({ city: { $ne: "Chennai" } })
```

## 10. Display employees whose salary is between 25000 and 60000

```javascript
db.employee_45.find({ salary: { $gte: 25000, $lte: 60000 } })
```

## 11. Update salary with 500 bonus for all employees

```javascript
db.employee_45.updateMany(
  {},
  { $inc: { salary: 500 } }
)
```

To display updated result:

```javascript
db.employee_45.find()
```

## 12. Display only name and id for all employees

```javascript
db.employee_45.find({}, { _id: 0, name: 1, id: 1 })
```

## 13. Display employees whose age is less than 40

```javascript
db.employee_45.find({ age: { $lt: 40 } })
```

## 14. Display employee details in ascending order of age

```javascript
db.employee_45.find().sort({ age: 1 })
```

## 15. Display employee details in descending order of age

```javascript
db.employee_45.find().sort({ age: -1 })
```

## 16. Display number of records in collection

```javascript
db.employee_45.countDocuments()
```

## 17. Display distinct department names

```javascript
db.employee_45.distinct("deptname")
```

## 18. Update city of employee whose ID is 102 and display

```javascript
db.employee_45.updateOne(
  { id: 102 },
  { $set: { city: "Bangalore" } }
)
```

Then display:

```javascript
db.employee_45.find({ id: 102 })
```

## 19. Display maximum salary of employee

```javascript
db.employee_45.find().sort({ salary: -1 }).limit(1)
```

## 20. Display employees based on department along with average salary

```javascript
db.employee_45.aggregate([
  {
    $group: {
      _id: "$deptname",
      averageSalary: { $avg: "$salary" },
      employees: { $push: "$name" }
    }
  }
])
```

---

# PART 2 — PRODUCT SALE DATABASE

## 21. Create/use database `productsale_45`

```javascript
use productsale_45
```

## 22. Create collection `orderdetails_45`

```javascript
db.createCollection("orderdetails_45")
```

Insert records:

```javascript
db.orderdetails_45.insertMany([
  {
    custname: "Ravi",
    aadhar: "123456789012",
    age: 29,
    orderId: 1001,
    productname: "Laptop",
    city: "Chennai",
    price: 55000
  },
  {
    custname: "Meena",
    aadhar: "234567890123",
    age: 34,
    orderId: 1002,
    productname: "Mobile",
    city: "Madurai",
    price: 20000
  },
  {
    custname: "Kiran",
    aadhar: "345678901234",
    age: 26,
    orderId: 1003,
    productname: "Tablet",
    city: "Salem",
    price: 18000
  },
  {
    custname: "Priya",
    aadhar: "456789012345",
    age: 31,
    orderId: 1004,
    productname: "Watch",
    city: "Trichy",
    price: 7000
  }
])
```

## 23. Display the collection

```javascript
db.orderdetails_45.find().pretty()
```

## 24. Create unique index on `orderId` as `ORDERNO` and show indexes

```javascript
db.orderdetails_45.createIndex(
  { orderId: 1 },
  { name: "ORDERNO", unique: true }
)
```

Show indexes:

```javascript
db.orderdetails_45.getIndexes()
```

## 25. Create index on `aadhar` and display

```javascript
db.orderdetails_45.createIndex(
  { aadhar: 1 },
  { name: "AADHAR_INDEX" }
)
```

Display:

```javascript
db.orderdetails_45.getIndexes()
```

## 26. Display all indexes of collection

```javascript
db.orderdetails_45.getIndexes()
```

## 27. Drop index `ORDERNO` and display

```javascript
db.orderdetails_45.dropIndex("ORDERNO")
```

Then:

```javascript
db.orderdetails_45.getIndexes()
db.orderdetails_45.find().pretty()
```

## 28. Drop all indexes and display

```javascript
db.orderdetails_45.dropIndexes()
```

Then:

```javascript
db.orderdetails_45.getIndexes()
```

## 29. Sort collection in descending order based on orderId and display

```javascript
db.orderdetails_45.find().sort({ orderId: -1 }).pretty()
```

## 30. Get indexes and display collection

```javascript
db.orderdetails_45.getIndexes()
db.orderdetails_45.find().pretty()
```

---

## Terminal commands to run the docker

```bash
docker-compose up -d --build
docker exec -it mongodb_dbms_da2 mongosh
```
