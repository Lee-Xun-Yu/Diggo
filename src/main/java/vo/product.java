package vo;

public class product {
	private Integer P_id;
	private String P_name;
	private Integer P_price;
	private Integer P_qty;
	private String describe;
	
public product(Integer P_id,String P_name,Integer P_price,Integer P_qty,String describe){
	super();
	this.P_id=P_id;
	this.P_name=P_name;
	this.P_price=P_price;
	this.P_qty=P_qty;
	this.describe=describe;
}
public product() {
	super();
}
	public Integer getP_id() {
		return P_id;
	}
	public void setP_id(Integer p_id) {
		P_id = p_id;
	}
	public String getP_name() {
		return P_name;
	}
	public void setP_name(String p_name) {
		this.P_name = p_name;
	}
	public Integer getP_price() {
		return P_price;
	}
	public void setP_price(Integer p_price) {
		this.P_price = p_price;
	}
	public Integer getP_qty() {
		return P_qty;
	}
	public void setP_qty(Integer p_qty) {
		this.P_qty = p_qty;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
}
