package com.poly.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.poly.constant.NamedStored;

import java.util.List;


/**
 * The persistent class for the user database table.
 * 
 */
@NamedStoredProcedureQueries({
	@NamedStoredProcedureQuery(name = NamedStored.FIND_USERS_LIKED_VIDEO_BY_VIDEO_HREF,
				procedureName = "sp_selectUsersLikedVideoByVideoHref",
				resultClasses = {User.class},
				parameters = @StoredProcedureParameter(name = NamedStored.PARAMETER_FIND_USERS_LIKED_VIDEO_BY_VIDEO_HREF, type = String.class))
})
@Entity
@Table(name = "`user`")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String email;

	private boolean isActive;

	private boolean isAdmin;

	private String password;

	private String username;

	//bi-directional many-to-one association to History
	@OneToMany(mappedBy="user")
	private List<History> histories;

	public User() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getIsActive() {
		return this.isActive;
	}

	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}

	public boolean getIsAdmin() {
		return this.isAdmin;
	}

	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<History> getHistories() {
		return this.histories;
	}

	public void setHistories(List<History> histories) {
		this.histories = histories;
	}

	public History addHistory(History history) {
		getHistories().add(history);
		history.setUser(this);

		return history;
	}

	public History removeHistory(History history) {
		getHistories().remove(history);
		history.setUser(null);

		return history;
	}

}