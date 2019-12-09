package com.bisa.health.shop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import com.bisa.health.common.utils.RegexConstants;
import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;
import java.util.Date;

/**
 * 留言model
 */

@Entity
@Table(name = "s_guestbook")
public class Guestbook implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;                //	主键ID
    private String name;           //	24	姓名
    private String phone;          //	20	手机号/座机号
    private String mail;           //	50	邮箱
    private String title;          //	40	主题

    private int message_type;      //		留言类型（1-个人；2-企业；3-医院)
    private String message;        //		留言内容
    private Date c_time;   //	50	留言时间
    private int is_Reply;			//是否回复
    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    @NotBlank(message=SysErrorCode.RequestFormat)
    @Column(length = 24, nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @NotBlank(message=SysErrorCode.RequestFormat)
    @Column(length = 20, nullable = false)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    @Pattern(regexp=RegexConstants.REGEX_EMAIL,message=SysErrorCode.RequestFormat)
    @Column(length = 50, nullable = false)
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    @Column(length = 40)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    @Range(min=1,max=10,message=SysErrorCode.RequestFormat)
    public int getMessage_type() {
        return message_type;
    }

    public void setMessage_type(int message_type) {
        this.message_type = message_type;
    }

    @Column(columnDefinition="text")
    @NotBlank(message=SysErrorCode.RequestFormat)
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getIs_Reply() {
		return is_Reply;
	}
    
    public void setIs_Reply(int is_Reply) {
		this.is_Reply = is_Reply;
	}

	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="c_time",columnDefinition=" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getC_time() {
		return c_time;
	}

	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}

	@Override
	public String toString() {
		return "Guestbook [id=" + id + ", name=" + name + ", phone=" + phone + ", mail=" + mail + ", title=" + title
				+ ", message_type=" + message_type + ", message=" + message + ", c_time=" + c_time + ", is_Reply="
				+ is_Reply + "]";
	}

	
	

}
