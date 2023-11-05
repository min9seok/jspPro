package crawling;



import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Crawling {
   public static void main(String[] args) {
      /*
       * Document doc = Jsoup.connect("https://en.wikipedia.org/").get();
       * log(doc.title()); Elements newsHeadlines = doc.select("#mp-itn b a"); for
       * (Element headline : newsHeadlines) { log("%s\n\t%s", headline.attr("title"),
       * headline.absUrl("href")); }
       */
      
      //final String url = "https://greenjuice.pulmuone.com/forum/faq?category=FAQ_004";
      final String url = "https://greenjuice.pulmuone.com/forum/faq?category=FAQ_006";
        Connection conn = Jsoup.connect(url);
        
        String qno = "faq_006";
        String res = "";
        try {
            Document document = conn.get();
            Elements qElements = document.select(".faq-list .card-header h2 > button");
            Elements answerElements = document.select(".faq-list .faq-contents-area .card-body");
//            Elements imageUrlElements = document.getElementsByClass("swiper-lazy");
//            Elements titleElements = document.select("div.card-content > div.course_title");
              //Elements titleElements = document.select("p.hpm6os-7 .gfvPUU");
//            Elements priceElements = document.getElementsByClass("price");
            /* */
            for (int i = 0; i < qElements.size(); i++) {
               String q = qElements.get(i).text();
               String answer = answerElements.get(i).text();
               res += String.format("%s_%d,%s,\"%s\",\"%s\",\n", qno, i+1, qno, q, answer);
            
         }
            System.out.println(res);
            System.out.println();
            System.out.println();
           
//            for (int i = 0; i < answerElements.size(); i++) {
//               String title = answerElements.get(i).text();
//               System.out.println(title);
//            }
            
//            for (Element element : imageUrlElements) {
//                System.out.println(element.attr("src"));
//            }
//            
//            for (int i = 0; i < titleElements.size(); i++) {
//            String title = titleElements.get(i).text();
//            System.out.println(title);
//         }
//            
//            for (int i = 0; i < priceElements.size(); i++) {
//            String price = priceElements.get(i).text();
//            System.out.println(price);
//            
//         }
        } catch (IOException e) {
            e.printStackTrace();
        }
   }
}