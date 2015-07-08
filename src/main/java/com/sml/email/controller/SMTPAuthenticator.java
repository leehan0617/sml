package com.sml.email.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 
 * 작성자 : 이한빈
 * 작성일 : 2015 07 08
 * 클래스 설명 : 이메일 보내기위한 보조클래스 복붙임.
 *
 */
public class SMTPAuthenticator extends Authenticator {
 protected PasswordAuthentication getPasswordAuthentication() {
  String username = "sml.korea.kosta@gmail.com"; // gmail 사용자;
  String password = "zheldgkrltlfgek";  // 패스워드;
  return new PasswordAuthentication(username, password);
 }
}