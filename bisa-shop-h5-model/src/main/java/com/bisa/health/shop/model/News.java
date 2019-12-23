package com.bisa.health.shop.model;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;
import java.util.Date;

/**
 * 新闻model
 */
@Entity
@Table(name = "s_news")
public class News  implements Serializable{

    private static final long serialVersionUID = 8489060357520626852L;
    private int id;
    
    
    private String news_num; //新闻编码
    
    @NotBlank(message=SysErrorCode.RequestFormat)
    private String news_title;  //新闻标题
	
    @NotBlank(message=SysErrorCode.RequestFormat)
    private String news_subhead;    //副标题
	
    private int read_quantity;    //阅读量
	
    @NotBlank(message=SysErrorCode.RequestFormat)
    private String news_content;//新闻内容
	
    private String img_url;//新闻封面图
    
    private Date release_time; //发布日期
    
    private String author;  //作者
    
    private String news_classify_num;//新闻类型
	
    @NotBlank(message=SysErrorCode.RequestFormat)
    private String html_keyWord;//关键词
	
    @NotBlank(message=SysErrorCode.RequestFormat)
    private String news_describe;//新闻描述
    
    @Range(max=2,message=SysErrorCode.RequestFormat)
    private int news_roofPlacement;//新闻置顶，0不置顶，1置顶
    
    @NotBlank(message=SysErrorCode.RequestFormat)
    private String html_description;//网站描述
	
    @NotBlank(message=SysErrorCode.RequestFormat)
    private String html_title;//网站标题
	
    @NotBlank(message=SysErrorCode.RequestFormat)
    private String language;
    
    @Range(min=0,max=1,message=SysErrorCode.RequestFormat)
    private int is_pc;//是否是移动端
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
	@JsonSerialize(using = CustomDateSerializer.class)
    @Column(name="release_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
    public Date getRelease_time() {
        return release_time;
    }

    public void setRelease_time(Date release_time) {
        this.release_time = release_time;
    }
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }
    public String getNews_title() {
        return news_title;
    }

    public void setNews_title(String news_title) {
        this.news_title = news_title;
    }
    public int getRead_quantity() {
        return read_quantity;
    }

    public void setRead_quantity(int read_quantity) {
        this.read_quantity = read_quantity;
    }
	@Column(columnDefinition="text")
    public String getNews_content() {
        return news_content;
    }

    public void setNews_content(String news_content) {
        this.news_content = news_content;
    }
    @Column(name = "news_subhead")
    public String getNews_subhead() {
        return news_subhead;
    }

    public void setNews_subhead(String news_subhead) {
        this.news_subhead = news_subhead;
    }
    @Column(name = "news_num")
    public String getNews_num() {
        return news_num;
    }

    public void setNews_num(String news_num) {
        this.news_num = news_num;
    }
    public String getNews_classify_num() {
        return news_classify_num;
    }

    public void setNews_classify_num(String news_classify_num) {
        this.news_classify_num = news_classify_num;
    }
    public String getNews_describe() {
        return news_describe;
    }
	public void setNews_describe(String news_describe) {
        this.news_describe = news_describe;
    }
    public String getHtml_keyWord() {
		return html_keyWord;
	}

	public void setHtml_keyWord(String html_keyWord) {
		this.html_keyWord = html_keyWord;
	}
	@Column(length=16)
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

    public int getNews_roofPlacement() {
        return news_roofPlacement;
    }

    public void setNews_roofPlacement(int news_roofPlacement) {
        this.news_roofPlacement = news_roofPlacement;
    }
    public String getHtml_description() {
        return html_description;
    }

    public void setHtml_description(String html_description) {
        this.html_description = html_description;
    }
    public String getHtml_title() {
        return html_title;
    }

    public void setHtml_title(String html_title) {
        this.html_title = html_title;
    }

    
    public int getIs_pc() {
		return is_pc;
	}

	public void setIs_pc(int is_pc) {
		this.is_pc = is_pc;
	}

	public News() {
        super();
    }


	
	public News(int id, String news_num, String news_title, String news_subhead, int read_quantity, String news_content,
			String img_url, Date release_time, String author, String news_classify_num, String html_keyWord,
			String news_describe, int news_roofPlacement, String html_description, String html_title, String language,
			int is_pc) {
		super();
		this.id = id;
		this.news_num = news_num;
		this.news_title = news_title;
		this.news_subhead = news_subhead;
		this.read_quantity = read_quantity;
		this.news_content = news_content;
		this.img_url = img_url;
		this.release_time = release_time;
		this.author = author;
		this.news_classify_num = news_classify_num;
		this.html_keyWord = html_keyWord;
		this.news_describe = news_describe;
		this.news_roofPlacement = news_roofPlacement;
		this.html_description = html_description;
		this.html_title = html_title;
		this.language = language;
		this.is_pc = is_pc;
	}

	
	@Override
	public String toString() {
		return "News [id=" + id + ", news_num=" + news_num + ", news_title=" + news_title + ", news_subhead="
				+ news_subhead + ", read_quantity=" + read_quantity + ", news_content=" + news_content + ", img_url="
				+ img_url + ", release_time=" + release_time + ", author=" + author + ", news_classify_num="
				+ news_classify_num + ", html_keyWord=" + html_keyWord + ", news_describe=" + news_describe
				+ ", news_roofPlacement=" + news_roofPlacement + ", html_description=" + html_description
				+ ", html_title=" + html_title + ", language=" + language + ", is_pc=" + is_pc + "]";
	}

	public void toNews(News news){
		this.setAuthor(news.getAuthor());
		this.setHtml_description(news.getHtml_description());
		this.setHtml_keyWord(news.getHtml_keyWord());
		this.setHtml_title(news.getHtml_title());
		this.setImg_url(news.getImg_url());
		this.setLanguage(news.getLanguage());
		this.setNews_classify_num(news.getNews_classify_num());
		this.setNews_content(news.getNews_content());
		this.setNews_describe(news.getNews_describe());
		this.setNews_num(news.getNews_num());
		this.setNews_roofPlacement(news.getNews_roofPlacement());
		this.setNews_subhead(news.getNews_subhead());
		this.setNews_title(news.getHtml_title());
		this.setRead_quantity(news.getRead_quantity());
		this.setIs_pc(news.is_pc);
	}

   
}
