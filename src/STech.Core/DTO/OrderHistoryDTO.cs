namespace STech.Core.DTO;

public class OrderHistoryDTO
{
    public int OrderID { get; set; }
    public int OrderStatus { get; set; }
    public string Note { get; set; }
    public string ModifiedOn { get; set; }
}

public class OrderHistoryRequestDTO
{
    public int OrderID { get; set; }
    public int OrderStatus { get; set; }
    public string Note { get; set; }
}
