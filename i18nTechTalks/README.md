# Public Internationalization Tech-Talks from PayPal

## [Internationalization and Unicode Conference](http://unicodeconference.org/)

### [38th Internationalization and Unicode Conference](http://unicodeconference.org/iuc38/Program.pdf), November 3-5, 2014, Santa Clara, CA, USA

#### Using GPS to Track Your Position and Trajectory

*Erwin Hom*
Internationalization Engineer, PayPal Inc.

*Michael McKenna*
Globalization Engineering Leader, PayPal, Inc.

Presentation: [PDF File](./IUC-38/iuc-38-gps.pdf)

So, suppose you've been asked to create a software application that can be easily released globally, where do you begin?

How do you track the process of the global-readiness of your application?
Whether you're creating an application for a few locales or a few dozen, you'll need some kind of system to measure its progress and success.

At PayPal, we've developed a Globalization roadmap for our development teams to follow and a system to track and grade the maturity of our products.
In this talk, we'll present the Globalization Maturity Model (GMM) which divides i18n capabilities into groups providing a roadmap of i18n support to be developed. We'll also present the Globalization Product Scorecard (GPS) which can be used to track and grade the maturity of global-readiness in your products. The GPS at PayPal is composed of three measures: the level of i18n maturity according to the GMM, a globalization quality score, and a global product management score.



####  Address Standards, Formats, and Nightmares

*Erwin Hom*
Internationalization Engineer, PayPal Inc.

*Aarti Ashok*
Product Architect, Globalization Technology, PayPal, Inc.

Presentation: [PDF File](./IUC-38/S7-2-IUC-38-PostalAddress_Hom_Ashok.pdf)

If your application deals with addresses for multiple countries, this talk will highlight the challenges in supporting address in an internationalized application. In this talk, we'll present:

- Variations of Address Formats
  - Complex Address Format in UK, Brazil, Japan, and others.
  - Street Complement component in the Indian Address Format
  - Reading an Address as a Native versus reading it as a Non-Native (for example, English speaker)
  - Providing for local and international formats to help in cross-border trade
- Handing address formats in the UI - address entry forms
- Handling address data in the app (This is an opportunity to present the Canonical Format, Locale Neutral Format)
- Devising an XML layout syntax based off CLDR and LDML to put name and address layout meta data in a machine-readable form

#### Pseudo Localization in Action

*Xiang Xu*
Senior Globalization Developer, PayPal Inc.

*Erwin Hom*
Internationalization Engineer, PayPal Inc.

*Michael McKenna*
Globalization Engineering Leader, PayPal, Inc.

Presentation: [PDF File](./IUC-38/S13-3-IUC-38-PseudoLocinAction_Xu_Hom_McKenna.pdf)

Pseudo localization is an effective way to detect i18n/l10n issues, the effective use of pseudo localization can mean huge savings for a company. A well designed flexible pseudo localization tool is critical. At PayPal, we use pseudo localization to help us process multiple content types (XML-based content, Java properties, mobile resource files, etc.) with various pseudo localization patterns on multiple platforms. In addition to supporting classic pseudo localization practices such as dynamic text expansion and readability of resulting text, it also supports pseudo patterns that are custom made for Asian languages as well as RTL languages. With this tool, it is easy to add support for future content types and more pseudo localization patterns, as well as integrating Machine Translation.

In this talk, we will present challenges and success of our pseudo-localization tool, the kind of issues that are detected by the tool, as well as the use of it as an education tool to engineering and UI/content designers. We will discuss the documented increase in quality since integrating the tool with development, design, and CI processes.

### [39th Internationalization and Unicode Conference](http://unicodeconference.org/iuc39/program-details.pdf), October 26-28, 2015, Santa Clara, CA, USA

#### Multilingual Transliteration - Standards, Technology, and Issues

*Michael McKenna*
I18n Product Owner, PayPal, Inc.

Presentation: [PDF File](./IUC-39/IUC39-McKenna-Transliteration.pdf)

In the expanding European Union, a majority of people speak at least two languages. In the United States, English is becoming a second language to a larger and larger segment of the population. Even so, official documents, phone books, bibliographic records, and other digital repositories may need to present native language source information (e.g., Russian or Greek) in a transliterated form to allow it to be interpreted by someone who does not speak or read that language. This paper will present a survey of issues confronting the language engineer along with solutions and available technologies. We will look at historical standards and contexts in which the standards become useless. We will then look at early work funded by the Directorate General for Research of the European Union, then on to solutions provided by Java and software libraries. We'll finish by taking a look at some commercial universal names databases and the technology behind them.

#### Griffin - PayPal Node.js API for i18n

*Michael McKenna*
I18n Product Owner, PayPal, Inc.

*Reza Payami*
Internationalization Engineer, PayPal, Inc

Presentation: [PDF File](./IUC-39/IUC-39-Griffin_McKenna_Payami.pdf)

In late 2013, PayPal made a corporate decision to migrate to Node.js. However, Node.js had very little or broken internationalization support, mostly inherited from client-side JavaScript which relied on the underlying operating system for i18n support. Initially, Node.js did not have the metadata or features needed to come even close to what PayPal needed to support markets in over 200 countries, plus appropriate English and local language formatting for every region.

This talk will discuss the effort the PayPal Internationalization Technology Team went through to investigate all known Open Source options, decide on an appropriate infrastructure to build upon, then customization of CLDR and other data to fit in to that infrastructure to finally enable Node.js products to support validation, normalization, display, and html and semantic markup of dates, times, numbers, currencies, phone, postal address, and personal names in 200+ countries and 27 languages. Included will be methods used to reduce the memory footprint, the decisions made to use regional territory containment and choice of English locales to use for fallback in the many countries where CLDR does not have an appropriate English locale defined.

As a finale, we will demonstrate the Griffin Reference App created to allow content owners to view formats according to locale, and encourage just-in-time learning by providing a pre-populated Node.js playground, similar to W3School's "Try it Yourself" JavaScript playground app.

#### Continuing Adventures Going Door-to-Door Around the World

*Erwin Hom*
Internationalization Engineer, PayPal, Inc.

*Michael McKenna*
I18n Product Owner, PayPal, Inc.

Presentation: [PDF File](./IUC-39/S12-T2-Hom-McKenna.pdf)

Supporting Postal Addresses.

If your application deals with postal addresses for multiple countries, this talk will highlight the challenges (and solutions) in supporting them in an internationalized application.

In this talk, we'll present:

- Variations of Postal Address Formats
- PayPal, Inc. Complex Address Formats in UK, Brazil, Australia, Turkey, Japan, China, and others
- The Street Complement component in the Indian Address Format
- Reading an Address as a Native speaking user versus reading it as a Non-Native (for example, English versus Chinese readers)
- Providing for local and international formats to help in cross-border trade
- Dynamic handing of postal address and personal name formats in the UI - address entry forms
- How much do you translate for entry pull-downs?
- Validating address data in the app
- Devising an XML layout syntax based off the open source CLDR and LDML to put name and address layout meta data in a machine-readable form
- A look at open source JavaScript libraries for handling postal address scenarios.

This talk has been updated and improved based on community feedback, more involvement with the open source community, and experience actually working with customers on every continent.

### [40th Internationalization and Unicode Conference](http://unicodeconference.org/iuc40/Conference_Program.pdf), November 1-3, 2016, Santa Clara, CA, USA

#### Lightning Talks -  Locale resolution at scale 

 *Manikandan Ramalingam Kandaswamy* 
Member of Technical Staff – I18N – PayPal, Inc

Presentation: [PDF File](./IUC-40/LT-Kandaswamy.pdf)

This lightning talk takes a look at the concept, building blocks, and sample locale resolution logic needed to resolve locale for users depending on 

- Browser settings 
- Cookie 
- Session cookie 
- IP address/Geo location 
- URL parameter
- URL domai
- User profile 
- Configured default locale

#### The New PayPal Mobile App

*Lucas Welti*
Globalization Architect, PayPal, Inc

Presentation: [PDF File](./IUC-40/S10T1-Welti.pdf)

These days most of commerce is done online with mobile becoming the key player.

The previous PayPal Mobile frameworks did not support some of the unique PayPal requirements such as providing English for all Markets and supporting the locale language in some specific countries.

It was important for us to ensure that customers had a consistent experience across all devices from web to smart phone, and for that reason a lot of the Dates, Name, Address, Currency Metadata that is shared between our web applications and Mobile Apps, have only ONE source of truth.

This talk will explain how PayPal was able to launch their new Mobile App for iOS and Android and make it available for 145 markets. This was done using new platforms and processes to make it easier to localize and customize. From Design to Development, the Globalization Team was involved from Day 1, providing Internationalization support, Globalization Q&A, reviewing Content and delivering translations.

#### Unicode, CLDR, and KYC, KYB, and Money Laundering

*Mike McKenna*
I18n Product Owner, PayPal, Inc.

Presentation: [PDF File](./IUC-40/S12T3-McKenna.pdf)

In today's world, when money is passed from one party to another, someone else is watching that transaction and must decide if it is legal or suspicious. Every legal money institution is required to "Know Your Customer" - known in the industry as "KYC", and "Know Your Business" (KYB). This is to reduce risk, reduce money laundering, and for regulatory requirements, to comply with local and international governments.

In this session, you will get a quick overview of KYC, KYB, Risk and Compliance, then we will delve into the internationalization aspects and how Unicode and CLDR help. Topics to be shared:

- What is KYC, KYB?
- Risk and Compliance - the what and why
- Anti-Money Laundering
- What are Designated Individuals
- User information and onboarding to applications
- What is unique for KYC and KYB from country to country
- What's in a name? Legal names and login IDs around the world
- How to use CLDR to reduce Risk in user information
- How Unicode helps to reduce Risk in user sign-up
- How International Components for Unicode (ICU) helps with AML and finding Designated Individuals

## [IMUG](http://imug.org/) - Internationalization and Multilingual Users Group, SF Bay Area

[How PayPal launched a global app in 140+ countries simultaneously](http://imug.org/events/imug-2016-events.htm#paypal), September 15, 2016

*Lucas Welti*

Presentation: [PPT File](./IMUG/ImugPayPal.pptx)

These days most commerce happens online, and mobile has become a key player. This talk will explain how PayPal was able to launch the new PayPal Mobile app for iOS and Android simultaneously in more than 140 markets.

This was done using new platforms and process to make it easier to localize and customize. From design to development, the PayPal globalization team has been involved since day 1, providing internationalization support and QA, reviewing content, and delivering translations. 

## [SF Globalization Meetup](https://www.meetup.com/sf-globalization/)

#### [Address Standards, Formats, and Nightmares](https://www.meetup.com/sf-globalization/events/214065882/), March 2, 2015

*Mike McKenna*

*Erwin Hom*

If your application deals with addresses for multiple countries, this talk will highlight the challenges in supporting address in an internationalized application. In this talk, we’ll present:

• Variations of address formats

> → Complex address format in UK, Brazil, Japan, and others
>
> → Street complement component in the Indian address format
>
> → Reading an address as a native versus reading it as a non-native (for example, English speaker)
>
> → Providing for local and international formats to help in cross-border trade

• Handling address formats in the UI - address entry forms

• Handling address data in the app (this is an opportunity to present the canonical format, locale neutral format)

• Devising an XML layout syntax based off CLDR and LDML to put name and address layout meta data in a machine-readable form

#### [Internationalization Aspects of Money Laundering](https://www.meetup.com/sf-globalization/events/237082980/), May 10, 2017, San Francisco

*Mike McKenna*

Presentation: [PDF File](./SF-G11n/SF-G11n-2017-05-McKenna-i18n_Money Laundering.pdf)

In today's world, when money is passed from one party to another, someone else is watching that transaction and must decide if it is legal or suspicious. Every legal money institution is required to "Know Your Customer" - known in the industry as "KYC", and "Know Your Business" (KYB). This is to reduce risk, reduce money laundering, and for regulatory requirements, to comply with local and international governments. 

In this talk, Mike will give a quick overview of KYC, KYB, Risk and Compliance, then delve into some of the internationalization aspects of detecting money laundering and terrorist funding. 