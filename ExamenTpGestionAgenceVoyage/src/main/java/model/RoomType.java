package model;

public class RoomType {
	
	private int id;
	private String label;
	private int capacity;
	private int prix;

	
	public RoomType(int id, String label, int capacity, int prix) {
		super();
		this.id = id;
		this.label = label;
		this.capacity = capacity;
		this.prix = prix;
		
	}
	public RoomType() {
		
	}

	public RoomType(String label, int capacity, int prix) {
		this.label = label;
		this.capacity = capacity;
		this.prix = prix;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getPrix() {
		return prix;
	}

	public void setPrix(int prix) {
		this.prix = prix;
	}

	
	

}
