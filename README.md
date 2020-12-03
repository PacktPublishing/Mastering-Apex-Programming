# Mastering Apex Programming

<a href="https://www.packtpub.com/business-other/mastering-apex-programming?utm_source=github&utm_medium=repository&utm_campaign=9781800200920"><img src="https://static.packt-cdn.com/products/9781800200920/cover/smaller" alt="Mastering Apex Programming" height="256px" align="right"></a>

This is the code repository for [Mastering Apex Programming](https://www.packtpub.com/business-other/mastering-apex-programming?utm_source=github&utm_medium=repository&utm_campaign=9781800200920), published by Packt.

**A developer’s guide to learning advanced techniques and best practices for building robust Salesforce applications**

## What is this book about?
As applications built on the Salesforce platform are now a key part of many organizations, developers are shifting focus to Apex, which is Salesforce.com’s proprietary programming language for developing code processes to run on Salesforce servers. As a Salesforce developer, it is important to understand the range of tools at your disposal, how and when to use them, and best practices for working with Apex. Mastering Apex Programming will help you explore the advanced features of Apex programming and guide you in delivering robust solutions that scale. 

This book covers the following exciting features:
* Understand common coding mistakes in Apex and how to avoid them using best practices
* Find out how to debug a Salesforce Apex application effectively
* Explore different asynchronous Apex options and their common use cases
* Discover tips to work effectively with platform events
* Develop custom Apex REST services to allow inbound integrations
* Build complex logic and processes on the Salesforce platform

If you feel this book is for you, get your [copy](https://www.amazon.com/dp/1800200927) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" 
alt="https://www.packtpub.com/" border="5" /></a>

## Errata

* Page 17: The following code block present on this page is incorrect:
```
for(Account acc : Trigger.new) {
  Integration_Settings__c setting = Integration_Settings__c. getInstance();
  User apiUser = [SELECT Id FROM User WHERE Username = setting.Api_Username__c];
  if(acc.OwnerId = apiuser.Id) {
    break;
  }
  //do something otherwise
}
```
The correct code block is as follows:
```
Integration_Settings__c setting = Integration_Settings__c. getInstance();
User apiUser = [SELECT Id FROM User WHERE Username = setting.Api_Username__c];
for(Account acc : Trigger.new) {
  if(acc.OwnerId = apiuser.Id) {
    break;
  }
//do something otherwise
}
```
## Instructions and Navigations
All of the code is organized into folders. For example, Chapter02.

The code will look like the following:
```
public class Person {
    public String name;
}

Person paul;
```

**Following is what you need for this book:**
This book is for Salesforce developers who are interested in mastering Apex programming skills. You’ll also find this book helpful if you’re an experienced Java or C# developer looking to switch to Apex programming for developing apps on the Salesforce platform. Basic Apex programming knowledge is essential to understand the concepts covered.

With the following software and hardware list you can run all code files present in the book (Chapter 1-16).
### Software and Hardware List
| Chapter | Software required | OS required |
| -------- | ------------------------------------ | ----------------------------------- |
| 1-16 | Salesforce, VS Code | Windows, Mac OS X, and Linux (Any) |

We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://static.packt-cdn.com/downloads/9781800200920_ColorImages.pdf).

### Related products
* Hands-On Low-Code Application Development with Salesforce [[Packt]](https://www.packtpub.com/product/hands-on-low-code-application-development-with-salesforce/9781800209770?utm_source=github&utm_medium=repository&utm_campaign=9781800209770) [[Amazon]](https://www.amazon.com/dp/1800209770)

* Salesforce Platform App Builder Certification Guide [[Packt]](https://www.packtpub.com/product/salesforce-platform-app-builder-certification-guide/9781800206434?utm_source=github&utm_medium=repository&utm_campaign=9781800206434) [[Amazon]](https://www.amazon.com/dp/1800206437)

## Get to Know the Author
**Paul Battisson**
is a seven-time Salesforce MVP and has been a speaker at numerous global Salesforce events, including Dreamforce, London’s Calling, and India Dreamin. He has been working with the Salesforce platform for over 11 years in a mix of both product development and consulting roles. Paul now helps lead a UK-based consulting partner, as well as blogs, has a YouTube channel, and leads a Salesforce Developer Group.
