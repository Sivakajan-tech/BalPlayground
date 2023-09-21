import ballerina/http;

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

    resource function post borrowings(string member_id,string book_id){
        borrow(book_id = book_id, member_id = member_id); // Update both books and borrowings tables.
    }
    resource function post borrowings/[string iso_code](string borrow_id, int rating, string comment){
         bookReturn(borrow_id = borrow_id,rating = rating,comment = comment);  // Update both books and borrowings tables.
    }

    resource function get reviews() returns Review[] {
        return reviews.toArray();
    }

    resource function post reviews(string book_id, string member_id, int rating, string comment){
        addReview(book_id= book_id, member_id = member_id, rating = rating, comment = comment);
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
        // We can manually borrow/ return books using POSTMAN/ CURL
        // POSTMAN

        // Borrow Book
        // POST http://localhost:9090/borrowings?member_id={member_id}&book_id={book_id} 

        // Return Book
        // POST http://localhost:9090/borrowings?borrow_id={borrowing_id}&rating={rating}&comment={comment}

        // Add Review
        // POST http://localhost:9090/reviews?book_id={book_id}&member_id={member_id}&rating={rating}&comment={comment}

    }
