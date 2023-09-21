type Member record {|
    readonly string id;
    string firstName;
    string lastName;
    string email;
    string nic;
|};

type Book record {|
    readonly string id;
    string title;
    string author;
    string isbn;
    boolean available = true;
|};

type Borrwing record {|
    readonly string id;
    string memberId;
    string bookId;
    string dateBorrowed;
    string dateReturned;    
|};

type Review record {|
    readonly string id;
    int rating;
    string bookId;
    string memberId;
    string comment;
|};