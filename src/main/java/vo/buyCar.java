package vo;

public class buyCar {
	private int car_id;
	private int ID;
	private int P_id;
	private int price;
	private int qty;
	private String p_name;
	public buyCar(int car_id,int id,int p_id,int price,int qty,String p_name) {
		this.ID=id;
		this.P_id=p_id;
		this.price=price;
		this.qty=qty;
		this.p_name=p_name;
		this.car_id=car_id;
	}
	public int getCar_id() {
		return car_id;
	}
	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public buyCar() {
		super();
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getP_id() {
		return P_id;
	}
	public void setP_id(int p_id) {
		P_id = p_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
}
