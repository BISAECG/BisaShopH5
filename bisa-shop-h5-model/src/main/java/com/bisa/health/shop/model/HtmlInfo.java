package com.bisa.health.shop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import com.bisa.health.common.utils.RegexConstants;

import java.io.Serializable;
import java.util.Date;

/**
 * 网页信息
 */
@Entity
@Table(name = "s_html_info")
public class HtmlInfo implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	@NotNull(message="html_keyWord_CN cannot be empty")
    private String html_keyWord_CN; //网页关键字-中文
	
	@NotNull(message="html_keyWord_HK cannot be empty")
    private String html_keyWord_HK; //网页关键字-繁体
	
	@NotNull(message="html_keyWord_US cannot be empty")
    private String html_keyWord_US; //网页关键字-英文
	
	@NotNull(message="html_description_CN cannot be empty")
    private String html_description_CN;//网页描述
	
	@NotNull(message="html_description_HK cannot be empty")
    private String html_description_HK;//网页描述
	
	@NotNull(message="html_description_US cannot be empty")
    private String html_description_US;//网页描述
	
	@NotNull(message="html_title_CN cannot be empty")
    private String html_title_CN;//网页标题
	
	@NotNull(message="html_title_HK cannot be empty")
    private String html_title_HK;//网页标题
	
	@NotNull(message="html_title_US cannot be empty")
    private String html_title_US;//网页标题
	
	@NotNull(message="column_name_CN cannot be empty")
    private String column_name_CN;//网页导航栏名称
	
	@NotNull(message="column_name_HK cannot be empty")
    private String column_name_HK;//网页导航栏名称
	
	@NotNull(message="column_name_US cannot be empty")
    private String column_name_US;//网页导航栏名称
	
	@Max(value=10,message="order_id cannot be empty")
    private int order_id;//网页排序
	
	@Range(min=0,max=1,message="type cannot be empty")
	private int type;
	
	@NotNull(message="name cannot be empty")
    private String name;
	
    private Date update_time;//修改时间
    
    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHtml_keyWord_CN() {
        return html_keyWord_CN;
    }

    public void setHtml_keyWord_CN(String html_keyWord_CN) {
        this.html_keyWord_CN = html_keyWord_CN;
    }

    public String getHtml_keyWord_HK() {
        return html_keyWord_HK;
    }

    public void setHtml_keyWord_HK(String html_keyWord_HK) {
        this.html_keyWord_HK = html_keyWord_HK;
    }

    public String getHtml_keyWord_US() {
        return html_keyWord_US;
    }

    public void setHtml_keyWord_US(String html_keyWord_US) {
        this.html_keyWord_US = html_keyWord_US;
    }

    public String getHtml_description_CN() {
        return html_description_CN;
    }

    public void setHtml_description_CN(String html_description_CN) {
        this.html_description_CN = html_description_CN;
    }

    public String getHtml_description_HK() {
        return html_description_HK;
    }

    public void setHtml_description_HK(String html_description_HK) {
        this.html_description_HK = html_description_HK;
    }

    public String getHtml_description_US() {
        return html_description_US;
    }

    public void setHtml_description_US(String html_description_US) {
        this.html_description_US = html_description_US;
    }

    public String getHtml_title_CN() {
        return html_title_CN;
    }

    public void setHtml_title_CN(String html_title_CN) {
        this.html_title_CN = html_title_CN;
    }

    public String getHtml_title_HK() {
        return html_title_HK;
    }

    public void setHtml_title_HK(String html_title_HK) {
        this.html_title_HK = html_title_HK;
    }

    public String getHtml_title_US() {
        return html_title_US;
    }

    public void setHtml_title_US(String html_title_US) {
        this.html_title_US = html_title_US;
    }
    @Column(name="update_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP")
    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    
    public String getColumn_name_CN() {
        return column_name_CN;
    }

    public void setColumn_name_CN(String column_name_CN) {
        this.column_name_CN = column_name_CN;
    }

    public String getColumn_name_HK() {
        return column_name_HK;
    }

    public void setColumn_name_HK(String column_name_HK) {
        this.column_name_HK = column_name_HK;
    }

    public String getColumn_name_US() {
        return column_name_US;
    }

    public void setColumn_name_US(String column_name_US) {
        this.column_name_US = column_name_US;
    }
    
  

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public HtmlInfo() {
    }


	public HtmlInfo(Integer id, String html_keyWord_CN, String html_keyWord_HK, String html_keyWord_US,
			String html_description_CN, String html_description_HK, String html_description_US, String html_title_CN,
			String html_title_HK, String html_title_US, String column_name_CN, String column_name_HK,
			String column_name_US, int order_id, int type, String name, Date update_time) {
		super();
		this.id = id;
		this.html_keyWord_CN = html_keyWord_CN;
		this.html_keyWord_HK = html_keyWord_HK;
		this.html_keyWord_US = html_keyWord_US;
		this.html_description_CN = html_description_CN;
		this.html_description_HK = html_description_HK;
		this.html_description_US = html_description_US;
		this.html_title_CN = html_title_CN;
		this.html_title_HK = html_title_HK;
		this.html_title_US = html_title_US;
		this.column_name_CN = column_name_CN;
		this.column_name_HK = column_name_HK;
		this.column_name_US = column_name_US;
		this.order_id = order_id;
		this.type = type;
		this.name = name;
		this.update_time = update_time;
	}

	@Override
	public String toString() {
		return "HtmlInfo [id=" + id + ", html_keyWord_CN=" + html_keyWord_CN + ", html_keyWord_HK=" + html_keyWord_HK
				+ ", html_keyWord_US=" + html_keyWord_US + ", html_description_CN=" + html_description_CN
				+ ", html_description_HK=" + html_description_HK + ", html_description_US=" + html_description_US
				+ ", html_title_CN=" + html_title_CN + ", html_title_HK=" + html_title_HK + ", html_title_US="
				+ html_title_US + ", column_name_CN=" + column_name_CN + ", column_name_HK=" + column_name_HK
				+ ", column_name_US=" + column_name_US + ", order_id=" + order_id + ", name=" + name + ", update_time="
				+ update_time + "]";
	}
	
	public void toHtmlInfo(HtmlInfo info){
		this.setColumn_name_CN(info.getColumn_name_CN());
		this.setColumn_name_HK(info.getColumn_name_HK());
		this.setColumn_name_US(info.getColumn_name_US());
		this.setHtml_description_CN(info.getHtml_description_CN());
		this.setHtml_description_HK(info.getHtml_description_HK());
		this.setHtml_description_US(info.getHtml_description_US());
		this.setHtml_keyWord_CN(info.getHtml_keyWord_CN());
		this.setHtml_keyWord_HK(info.getHtml_keyWord_HK());
		this.setHtml_keyWord_US(info.getHtml_keyWord_US());
		this.setHtml_title_CN(info.getHtml_title_CN());
		this.setHtml_title_HK(info.getHtml_title_HK());
		this.setHtml_title_US(info.getHtml_title_US());
		this.setName(info.getName());
		this.setOrder_id(info.getOrder_id());
		this.setType(info.getType());
		this.setUpdate_time(new Date());
	}

}
