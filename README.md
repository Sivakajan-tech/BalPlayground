# BalPlayground
BalPlayground is a Simple CRUD application which doing the basic functionalities of Library Management System.

## Balerina
Ballerina is an open source, cloud-native programming language optimized for integration. It comes with a rich ecosystem of network protocols, data formats, and connectors, and allows you to edit and view source code textually or graphically as sequence diagrams and flowcharts. Ballerina also has built-in, easy, and efficient concurrency support with sequence diagrams and safety primitives. It was developed by WSO2 since 2016 and first released in February 2022.
For further details visit: https://ballerina.io

## Usage
To use BalPlayground, you'll need to have Ballerina installed on your machine. Once you have Ballerina installed, you can run the following commands to build and run the server:

## Run Locally
Clone the project
```bash
https://github.com/Sivakajan-tech/BalPlayground
```

Run the application
```bash
bal run BalPlayground
```

## Demo
Open Postman and send requests to `http://localhost:9090/{endpoint}`. Then you can play with the application.

## Endpoints
1. GET books => `http://localhost:9090/books`

2. GET members => `http://localhost:9090/members`

3. GET reviews => `http://localhost:9090/reviews`

4. POST borrow the books => `http://localhost:9090/borrowings?member_id={member_id}&book_id={book_id}`

5. POST return the books => `http://localhost:9090/borrowings?borrow_id={borrowing_id}&rating={rating}&comment={comment}`

6. POST add reviews to a book => `http://localhost:9090/reviews?book_id={book_id}&member_id={member_id}&rating={rating}&comment={comment}`

Enjoy the Balerina Envirnment:)
