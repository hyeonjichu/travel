package mul.camp.a.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mul.camp.a.dto.BbsParam;
import mul.camp.a.dto.boardDto;
import mul.camp.a.dto.commentDto;
import mul.camp.a.service.boardService;

@Controller
public class BoardController {

private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	boardService service;
	
	@RequestMapping(value = "MainPage.do", method = RequestMethod.GET)
	public String bbslist(Model model, BbsParam param) {
		logger.info("BbsController MainPage() " + new Date());
		
		List<boardDto> list = service.bbslist(param);
		model.addAttribute("MainPage", list);
		
		return "MainPage";
	}
	
	@RequestMapping(value = "board.do", method = RequestMethod.GET)
	public String board(Model model, BbsParam param) {
		logger.info("MainController board() " + new Date());
		
		if(param.getSpot() != null && !param.getSpot().equals("")) {
			if(param.getSpot().equals("seoul")) {
				param.setSpot("서울");
			}
			else if(param.getSpot().equals("gyeonggi")) {
				param.setSpot("경기도");
			}
			else if(param.getSpot().equals("gangwon")) {
				param.setSpot("강원도");
			}
			else if(param.getSpot().equals("chungcheong")) {
				param.setSpot("충청도");
			}
			else if(param.getSpot().equals("gyeongsang")) {
				param.setSpot("경상도");
			}
			else if(param.getSpot().equals("jeolla")) {
				param.setSpot("전라도");
			}
			else if(param.getSpot().equals("jeju")) {
				param.setSpot("제주도");
			}
			model.addAttribute("spot", param.getSpot());
		}else {
			model.addAttribute("spot","");
		}
		List<boardDto> list = service.bbslist(param);
		model.addAttribute("bbslist", list);
		
		return "board";
	}
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
	public String detail(Model model, int idx) {
		logger.info("MainController detail() " + new Date());
		
		boardDto dto = service.detail(idx);
		model.addAttribute("detail", dto);
		
		List<commentDto> list = service.commentlist(idx);
		model.addAttribute("commentlist", list);
		
		return "detail";
	}
	
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String write() {
		logger.info("MainController write() " + new Date());
		
		return "write";
	}
	
	@RequestMapping(value = "writeAf.do", method = RequestMethod.POST)
	public String writeAf(Model model, boardDto dto) {
		logger.info("MainController writeAf() " + new Date());
		System.out.println(dto.toString());
		
		int chk = service.boardInsert(dto);
		System.out.println("chk====="+chk);
		
		if(chk == 0) {
			return "write";
		}else {
			return "redirect:/board.do";
		}
	}
	
	@RequestMapping(value="boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(Model model, int idx) {
		logger.info("MainController boardUpdate() " + new Date());
		
		boardDto dto = service.detail(idx);
		model.addAttribute("detail", dto);
		
		return "update";
	}
	
	@RequestMapping(value="boardDel.do", method = RequestMethod.GET)
	public String boardDel(int idx) {
		logger.info("MainController boardDel() " + new Date());
		
		int chk = service.del(idx);
		System.out.println(chk);
		if(chk == 1) {
			return "redirect:/board.do";
		}
		return "redirect:/detail.do";
	}
	
	@RequestMapping(value="boardUpdateAf.do", method = RequestMethod.POST)
	public String boardUpdateAf(boardDto dto) {
		logger.info("MainController boardUpdateAf() " + new Date());
		System.out.println(dto.toString());
		int chk = service.update(dto);
		if(chk == 1) {
			return "redirect:/board.do";
		}else {
			return "redirect:/boardUpdate.do";
		}
		
	}
	
	@RequestMapping(value="commentWrite.do", method = RequestMethod.GET)
	public String commentWrite(commentDto dto) {
		logger.info("MainController commentWrite() " + new Date());
		System.out.println(dto.toString());
		
		int chk = service.commentWrite(dto);
		System.out.println(chk);
		if(chk == 1) {
			return "redirect:/detail.do?idx="+dto.getBidx();
		}else {
			return "redirect:/board.do";
		}
	}
	
	@RequestMapping(value="commentDel.do", method=RequestMethod.GET)
	public String commentDel(commentDto dto) {
		logger.info("MainController commentDel() " + new Date());
		int chk = service.commentDel(dto);
		if(chk == 1) {
			return "redirect:/detail.do?idx="+dto.getBidx();
		}else {
			return "redirect:/board.do";
		}
	}
	
	
}
