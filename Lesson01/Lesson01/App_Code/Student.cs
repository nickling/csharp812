using System;

// Define the delegate that represents the event.
public delegate void PriceChangedEventHandler();

// Need to go to Properties --> Build Action --> ?Compile" Not "Content" <-------------

// Important:  The following Products class file should be placed in a 
// new App_Code folder and depending on if you use a Code-Behind or Single 
// Page option you must set the file’s Build Action property. For the Single 
// file web pages set the Build Action to “Content”, but for web pages using 
// the Code-Behind option you use the “Compile.”  Also, after you change this 
// you may have to close and reopen Visual Studio before intellisense will work!
public class Student
{
    public string Name { get; set; }
    public string Email { get; set; }
    public string ImageUrl { get; set; }
    // Define the event.
    public event PriceChangedEventHandler PriceChanged;

    public string GetHtml()
    {
        string htmlString;
        htmlString = "<h3>Student Name: " + Name + "</h3><br>";
        htmlString += "<h3>Email: " + Email+ "</h3><br>";
        htmlString += "<img src='" + ImageUrl + "' />";
        return htmlString;
    }

    public Student(string name, string email)
    {
        Name = name;
        Email = email;
    }

    public Student(string name, string email, string imageUrl)
    {
        Name = name;
        Email = email;
        ImageUrl = imageUrl;
    }
}
