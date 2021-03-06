package entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;



@Entity
public class Activity {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	
	@Column(name = "exp")
	@Min(1)
	@Max(5)
	private int experenice;

	@ManyToOne()
	@JoinColumn(name = "user_id")
	private User user;

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getExperenice() {
		return experenice;
	}

	public void setExperenice(int experenice) {
		this.experenice = experenice;
	}

	public int getId() {
		return id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	

	@Override
	public String toString() {
		return "Activity [id=" + id + ", name=" + name + ", experenice=" + experenice + "]";
	}

}