table<Book> key(id) books = table [
    {id: "book_1", title: "The Complete Reference", author: "Herbert Schildt", isbn: "978-0071808552"},
    {id: "book_2", title: "Java: A Beginner's Guide", author: "Herbert Schildt", isbn: "978-0071809252"},
    {id: "book_3", title: "Java: The Complete Reference", author: "Herbert Schildt", isbn: "978-00718308523", available: false},
    {id: "book_4", title: "Lost Symbol", author: "Dan Brown", isbn: "978-007180911"},
    {id: "book_5", title: "Sherlock Holmes", author: "Sir. Arthurn Corn Doyle", isbn: "978-007180878", available: false},
    {id: "book_6", title: "The Davinc Code", author: "Dan Brown", isbn: "978-00718092556"},
    {id: "book_7", title: "The Lost World", author: "Sir. Arthurn Corn Doyle", isbn: "978-00718092556"},
    {id: "book_8", title: "The Adventures of Sherlock Holmes", author: "Sir. Arthurn Corn Doyle", isbn: "978-00718092556"},
    {id: "book_9", title: "The Return of Sherlock Holmes", author: "Sir. Arthurn Corn Doyle", isbn: "978-00718092556"},
    {id: "book_10", title: "The Hound of the Baskervilles", author: "Sir. Arthurn Corn Doyle", isbn: "978-00718092556"}
];

table<Member> key(id) members = table [
    {id: "member_1", firstName: "John", lastName: "Smith", email: "email@gmail.com", nic: "123456789V"},
    {id: "member_2", firstName: "Jane", lastName: "Smith", email: "email@gmail.com", nic: "123456789V"},
    {id: "member_3", firstName: "Fred", lastName: "Bloggs", email: "email@gmail.com", nic: "123456789V"},
    {id: "member_4", firstName: "Bobby", lastName: "Clark", email: "email@gmail.com", nic: "123456789V"},
    {id: "member_5", firstName: "Cassie", lastName: "Smith", email: "email@gmail.com", nic: "123456789V"}
];

table<Borrwing> key(id) borrowings = table[
    {id: "borrowing_1", memberId: "member_1", bookId: "book_1", dateBorrowed: "2019-01-01", dateReturned: "2019-01-01"},
    {id: "borrowing_2", memberId: "member_1", bookId: "book_2", dateBorrowed: "2019-01-01", dateReturned: "2019-01-01"},
    {id: "borrowing_3", memberId: "member_1", bookId: "book_7", dateBorrowed: "2019-01-01", dateReturned: "2019-01-01"},
    {id: "borrowing_4", memberId: "member_2", bookId: "book_3", dateBorrowed: "2019-01-01", dateReturned: ""},
    {id: "borrowing_5", memberId: "member_3", bookId: "book_4", dateBorrowed: "2019-01-01", dateReturned: "2019-01-01"},
    {id: "borrowing_6", memberId: "member_4", bookId: "book_5", dateBorrowed: "2019-01-01", dateReturned: ""},
    {id: "borrowing_7", memberId: "member_5", bookId: "book_6", dateBorrowed: "2019-01-01", dateReturned: "2019-01-01"},
    {id: "borrowing_8", memberId: "member_1", bookId: "book_5", dateBorrowed: "2018-11-01", dateReturned: "2018-11-01"},
    {id: "borrowing_9", memberId: "member_2", bookId: "book_2", dateBorrowed: "2019-11-01", dateReturned: ""}
];

table<Review> key(id) reviews = table[
    {id: "review_1", rating: 5, bookId: "book_1", memberId: "member_1", comment: "Great book"},
    {id: "review_2", rating: 4, bookId: "book_2", memberId: "member_1", comment: "Nice narration"},
    {id: "review_4", rating: 2, bookId: "book_4", memberId: "member_3", comment: "Best!!"},
    {id: "review_6", rating: 5, bookId: "book_5", memberId: "member_1", comment: "Nothing special"},
    {id: "review_7", rating: 4, bookId: "book_6", memberId: "member_5", comment: "I like it"}
];