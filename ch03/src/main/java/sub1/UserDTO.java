package sub1;

public class UserDTO {
	
	private String uid;
	private String name;
	private int    age;
	private String addr;
	
	public UserDTO(String uid, String name, int age, String addr) {
		this.uid = uid;
		this.name = name;
		this.age = age;
		this.addr = addr;
	}
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "UserDTO [uid=" + uid + ", name=" + name + ", age=" + age + ", addr=" + addr + "]";
	}
	
	
}
