package com.bisa.health.shop.model;

import javax.persistence.*;

import org.hibernate.validator.constraints.NotBlank;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="s_news_inlink")
public class NewsInLink implements Serializable {
	
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;

    private String inner_chain_text_CN; //内链中文文本
    private String inner_chain_text_EN; //内链英文文本
    private String inner_chain_text_HK; //内链繁体文本
    private String inner_chain_url; //内链路径
    private Date create_time;     //创建时间

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    @NotBlank(message=SysErrorCode.RequestFormat)
    @Column(name = "inner_chain_url")
    public String getInner_chain_url() {
        return inner_chain_url;
    }

    public void setInner_chain_url(String inner_chain_url) {
        this.inner_chain_url = inner_chain_url;
    }
    
    @Column(name = "inner_chain_text_CN")
    public String getInner_chain_text_CN() {
        return inner_chain_text_CN;
    }

	public void setInner_chain_text_CN(String inner_chain_text_CN) {
        this.inner_chain_text_CN = inner_chain_text_CN;
    }
	
    @Column(name = "inner_chain_text_EN")
    public String getInner_chain_text_EN() {
        return inner_chain_text_EN;
    }

    public void setInner_chain_text_EN(String inner_chain_text_EN) {
        this.inner_chain_text_EN = inner_chain_text_EN;
    }
    @Column(name = "inner_chain_text_HK")
    public String getInner_chain_text_HK() {
        return inner_chain_text_HK;
    }

    public void setInner_chain_text_HK(String inner_chain_text_HK) {
        this.inner_chain_text_HK = inner_chain_text_HK;
    }
	@JsonSerialize(using = CustomDateSerializer.class)
    @Column(name="create_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
    public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

    public NewsInLink() {
    }

	@Override
	public String toString() {
		return "NewsInLink [id=" + id + ", inner_chain_text_CN=" + inner_chain_text_CN + ", inner_chain_text_EN="
				+ inner_chain_text_EN + ", inner_chain_text_HK=" + inner_chain_text_HK + ", inner_chain_url="
				+ inner_chain_url + ", create_time=" + create_time + "]";
	}

  
   
}
