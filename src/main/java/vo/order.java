package vo;

public class order {
	private Integer O_id;
	private Integer P_id;
	private Integer price;
	private Integer qty;
	private String P_name;
	private Integer O_amount;
	public order(Integer O_id,Integer P_id,Integer price,Integer qty,String P_name,Integer O_amount) {
		this.O_id=O_id;
		this.P_id=P_id;
		this.price=price;
		this.qty=qty;
		this.P_name=P_name;
		this.O_amount=O_amount;
	}
	public String getP_name() {
		return P_name;
	}
	public void setP_name(String p_name) {
		P_name = p_name;
	}
	public Integer getO_amount() {
		return O_amount;
	}
	public void setO_amount(Integer o_amount) {
		O_amount = o_amount;
	}
	public order() {
		super();
	}
	public Integer getO_id() {
		return O_id;
	}
	public void setO_id(Integer o_id) {
		O_id = o_id;
	}
	public Integer getP_id() {
		return P_id;
	}
	public void setP_id(Integer p_id) {
		P_id = p_id;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
}

