import 'package:alhafidh/states/models/faq_model.dart';
import 'package:alhafidh/states/models/page_model.dart';
import 'package:alhafidh/states/services/section.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

class SectionController extends GetxController {
  //get media obj
  PageModel? mediaCenter;

  //get about us obj
  PageModel? aboutUs;

  //get about us obj
  PageModel? warranty;

  //get about us obj
  PageModel? faq;
  var faqList = <Faq>[].obs;

  //for media center
  RxBool mediaCenterLoading = true.obs;
  RxBool aboutUsLoading = true.obs;
  RxBool warrantyLoading = true.obs;
  RxBool faqLoading = true.obs;

  //for media page
  void getMediaCenter() async {
    mediaCenterLoading.value = true;
    try {
      var response = await SectionService.getMediaCenter();
      PageModel p = PageModel.fromJson(response);
      mediaCenter = p;
      // images.value = p.asset;
      // print('get media response =>');
      //  print(mediaCenter!.page.bodyHtml.toString());
    } finally {
      mediaCenterLoading.value = false;
    }
  }

  //for about us page
  void getAboutUs() async {
    aboutUsLoading.value = true;
    try {
      var response = await SectionService.getAboutUs();
      PageModel p = PageModel.fromJson(response);
      aboutUs = p;
      // images.value = p.asset;
      // print('get media response =>');
      //  print(mediaCenter!.page.bodyHtml.toString());
    } finally {
      aboutUsLoading.value = false;
    }
  }

  //for about us page
  void getWarrantyServices({required String id}) async {
    warrantyLoading.value = true;
    try {
      var response = await SectionService.getWarranty(id: id);
      PageModel p = PageModel.fromJson(response);
      warranty = p;
      // images.value = p.asset;
      // print('get media response =>');
      //  print(mediaCenter!.page.bodyHtml.toString());
    } finally {
      warrantyLoading.value = false;
    }
  }

  //for about us page
  void getFaq({required String id}) async {
    faqLoading.value = true;
    try {
      var htmla = '''
            <ul>
<li><strong>What is ALHAFIDH.com ?</strong>
<p>Your one stop solution for all electronics &amp; home appliances needs brought to you by ALHAFIDH Market. Whether you are looking for the best deals or the latest electronics and home appliances in Iraq with the best brands, our intuitive site brings convenience tailored to your needs right to your fingertips.</p>
</li>
<li><strong>Do you have a showroom where we can see the products ?</strong>
<p>We encourage you to visit one of our showrooms and witness a great shopping experience. In fact, you can visit Our Showrooms page and see what our stores have to offer from products such as TV, air conditioners, and other home appliances. Find a showroom near you. Also you can visit the nearest authorized dealer to you, to find the dealers list and locations please contact 80006686.</p>
</li>
<li><strong>Which payment methods can I use?</strong>
<p>Cash on delivery is the preferred way of payment, however we gladly accept VISA and MasterCard for all our Orders. We, unfortunately, do not accept credit cards directly over the phone.</p>
</li>
<li><strong>How does the warranty work?</strong>
<p>The warranty starts from the date of invoice and it is varying as per the product brand and manufacturer policy. However, all brands have genuine warranty.</p>
</li>
<li><strong>How do I place an order?</strong>
<p>Placing an order on Alhafidh.com is easy. Just follow these simple steps: <br>1. Choose your product you would like to purchase and select the quantity after checking the stock status as it should indicated "Available" <br>2. Click on the green colored "Add to Cart" button. <br>3. Check your shopping cart and make sure all the items you would like to purchase are in the cart. <br>4. Select your delivery method. <br>5. Then click on the orange "Proceed to checkout" button and follow the prompts. <br>If you are still having trouble, please contact one of our friendly team members so we can guide you through the process.</p>
</li>
<li><strong>Why do I need to register an account with ALHAFIDH.com ?</strong>
<p>You need to be a registered alhafidh.com user to be able to buy, plus registration helps you by Contacting you whenever needed. To ensure a safe online shopping experience. You will get all the updates on latest products, promotions and special offers.</p>
</li>
<li><strong>How do I create an ALHAFIDH.com account ?</strong>
<p>Simply click on the register link at the top of the page, follow the onscreen instructions and in less than seconds you will be officially a member of ALHAFIDH Market online.</p>
</li>
<li><strong>What Shipping Methods are Available ?</strong>
<p>ALHAFIDH use its own delivery vehicles fleet to reach you wherever you are inside Iraq.</p>
</li>
<li><strong>How Long Will it Take To Get My Package ?</strong>
<p>Standard delivery time is 48 hours from the time of placing the order. You will be receiving a call to confirm the delivery time whiten 24 hours from the time of placing the order.</p>
</li>
<li><strong>Do I Need an Account To Place Order ?</strong>
<p>You do not need to create an account to place the order, just use Buy Now button to fill up your delivery details without creating any account.</p>
</li>
</ul>
      ''';
//something

      String resultfaq = htmla.replaceAll("\n", "");
      var document1 = parse(resultfaq);
      var faqTList = document1.querySelectorAll("ul > li ");

      print('test Li Faq');
      print(faqTList);
      faqList.clear();
      for (dom.Element faq in faqTList) {
        print('test faq');
        faqList.add(Faq(
            title: faq.getElementsByTagName('strong')[0].text,
            subtitle: faq.getElementsByTagName('p')[0].text,
            visible: false));
        print(faq.getElementsByTagName('strong')[0].text);
        print(faq.getElementsByTagName('p')[0].text);
      }
      print('test faq l');
      print(faqList.length.toString());

      var response = await SectionService.getFaq(id: id);
      PageModel p = PageModel.fromJson(response);
      faq = p;

      // images.value = p.asset;
      // print('get media response =>');
      //  print(mediaCenter!.page.bodyHtml.toString());
    } finally {
      faqLoading.value = false;
    }
  }
}
