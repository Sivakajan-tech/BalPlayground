import ballerina/http;
import ballerina/io;

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

    resource function post borrowings(string member_id,string book_id) returns Borrwing{
        string dateBorrowed = "2019-03-01";
        Borrwing borrowing = {
            id: "borrowing_" .'join((borrowings.length() + 1).toString()),
            memberId: member_id,
            bookId: book_id,
            dateBorrowed: dateBorrowed,
            dateReturned: ""
        };   
        borrow(book_id, member_id);
        return borrowing;     
    }

    resource function get reviews() returns Review[] {
        return reviews.toArray();
    }

    resource function post reviews(string book_id, string member_id, int rating, string comment) returns Review {
        Review review = {
            id: "review_" .'join((reviews.length() + 1).toString()),
            rating: rating,
            bookId: book_id,
            memberId: member_id,
            comment: comment
        };
        reviews.add(review);
        io:println("Review added successfully");
        return review;
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
        // http://localhost:9090/borrowings?member_id=member_5&book_id=book_10

    }
