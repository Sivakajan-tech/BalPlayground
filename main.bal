import ballerina/http;
import ballerina/io;

function updateBookAvailable(string book_id, boolean available = true){
    boolean _check = false;
    foreach Book _book in books {
        if(_book.id == book_id) {
            _book.available = available;
            _check = true;
        }
    }
    if(!_check) {
        io:println("Error: Book not found");
    }
}

function borrow(string book_id, string member_id) {
    string dateBorrowed = "2019-03-01";
    if(!books.get(book_id).available) {
        io:println("Error: Book already taken. Not available ATM");
        return;
    }
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
        }
    }
    if(!_check) {
        io:println("Error: Book not found");
    }
    io:println("Book returned successfully");

    updateBookAvailable(book_id);

    addReview(book_id= book_id, member_id = member_id, rating = rating, comment = comment);
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

service / on new http:Listener(9090) {

    resource function get books() returns Book[] {
        return books.toArray();
    }

    resource function post books(Book book) returns Book {
        books.add(book);
        return book;
    }

    resource function get members() returns Member[] {
        return members.toArray();
    }

    resource function post members(Member member) returns Member {
        members.add(member);
        return member;
    }

    resource function get borrowings() returns Borrwing[] {
        return borrowings.toArray();
    }

    resource function get reviews() returns Review[] {
        return reviews.toArray();
    }
}

 public function main(){
        // Assumption
        // 1. A member can borrow book without return previous books.

        // Test cases.
        // No - 1 =====================================================
        // Member 2 returns book 3
        bookReturn(borrow_id = "borrowing_3",rating = 5,comment = "One of my favourite book.");  // Update both books and borrowings tables.
        addReview(book_id = "book_3", member_id = "member_2", rating = 10, comment = "Nice protoganist"); // Add more review to a single book return

        // No - 2 =====================================================
        // Member 1 borrows book 3
        borrow(book_id = "book_4", member_id = "member_1"); // Update both books and borrowings tables.
        // Member 1 borrows book 5
        borrow(book_id = "book_5", member_id = "member_1"); // Book 5 is not availbale

        // No - 3 =====================================================

    }
