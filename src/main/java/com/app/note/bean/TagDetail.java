package com.app.note.bean;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Preksha
 */

/**
 * The persistent class for the tag_details database table.
 * 
 */
@Entity
@Table(name="tag_details")
public class TagDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tag_id")
	private Integer tagId;

	@Column(name="tag_name")
	private String tagName;

	@ManyToOne
	@JoinColumn(name="note_id")
	private NoteInfo noteInfo;

	@ManyToOne
	@JoinColumn(name="user_id")
	private UserDetail userDetail;

	public TagDetail() {
	}

	public Integer getTagId() {
		return this.tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return this.tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public NoteInfo getNoteInfo() {
		return this.noteInfo;
	}

	public void setNoteInfo(NoteInfo noteInfo) {
		this.noteInfo = noteInfo;
	}

	public UserDetail getUserDetail() {
		return this.userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

}