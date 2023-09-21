import ballerina/io;

function updateBookAvailable(string book_id, boolean available = true){
    boolean _check = false;
    foreach Book _book in books {
        if(_book.id == book_id) {
            _book.available = available;
            _check = true;
            io:println("Details for "+book_id+" updated successfully");
        }
    }
    if(!_check) {
        io:println("Error: Book not found");
    }
}