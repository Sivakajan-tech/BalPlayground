import ballerina/io;

function borrow(string book_id, string member_id) {
    string dateBorrowed = "2019-03-01";
    io:println(book_id);
    if(!books.get(book_id).available) {
        io:println("Error: Book already taken. Not available ATM");
        return;
    }
    io:println(books.get(book_id));
    updateBookAvailable(book_id,false);
    Borrwing borrowing = {
        id: "borrowing_" .'join((borrowings.length() + 1).toString()),
        memberId: member_id,
        bookId: book_id,
        dateBorrowed: dateBorrowed,
        dateReturned: ""
    };
    borrowings.add(borrowing);  
    io:println("Book borrowed successfully");
    io:println();
};

function bookReturn(string borrow_id, int rating, string comment) {
    string dateReturned = "2019-04-01";
    boolean _check = false;
    string book_id = "";
    string member_id = "";
    foreach Borrwing _borrow in borrowings {
        if(_borrow.id == borrow_id) {
            _borrow.dateReturned = dateReturned;
            book_id = _borrow.bookId;
            member_id = _borrow.memberId;
            _check = true;
            io:println("Details for "+borrow_id+" updated successfully");
        }
    }
    if(!_check) {
        io:println("Error: Book not found");
    }
    updateBookAvailable(book_id);

    addReview(book_id= book_id, member_id = member_id, rating = rating, comment = comment);
     io:println("Book returned successfully");
    io:println();
}

function addReview(string book_id, string member_id, int rating, string comment) {
    if rating==0 {
        io:println("Error: Rating cannot be 0");
        return;
    }
    Review review = {
        id: "review_" .'join((reviews.length() + 1).toString()),
        rating: rating,
        bookId: book_id,
        memberId: member_id,
        comment: comment
    };
    reviews.add(review);
    io:println("Review added successfully");
}