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
public class Product
{
    public string Name { get; set; }

    // Define the event.
    public event PriceChangedEventHandler PriceChanged;

    private decimal price;
    public decimal Price
    {
        get
        {
            return price;
        }
        set
        {
            price = value;

            // Fire the event, provided there is at least one listener.
            if (PriceChanged != null) { PriceChanged(); }
        }
    }

    public string ImageUrl { get; set; }

    public string GetHtml()
    {
        string htmlString;
        htmlString = "<h1>" + Name + "</h1><br>";
        htmlString += "<h3>Costs: " + Price.ToString() + "</h3><br>";
        htmlString += "<img src='" + ImageUrl + "' />";
        return htmlString;
    }

    public Product(string name, decimal price)
    {
        Name = name;
        Price = price;
    }

    public Product(string name, decimal price, string imageUrl)
    {
        Name = name;
        Price = price;
        ImageUrl = imageUrl;
    }
}
