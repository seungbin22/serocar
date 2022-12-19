package com.kosta.serocar.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfig {
	// @Bean : bean 생성을 위한 어노테이션 : 외부라이브러리를 통해 bean 생성하고자 할 때 사용하는 어노테이션
//	 리턴하는 객체가 bean으로 등록된다 
//@Component : 개발자가 작성한 클래스를 bean으로 등록할 때 사용 
	@Bean
	public UrlBasedViewResolver tilesViewResolver() {
		UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		String[] defs = { "WEB-INF/tiles/tiles-config.xml" };
		tilesConfigurer.setDefinitions(defs);
		return tilesConfigurer;
	}

}