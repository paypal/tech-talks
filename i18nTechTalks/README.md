# Public Internationalization Tech-Talks from PayPal

#### List of Talks and Papers

* [Internationalization and Unicode Conferences](#internationalization-and-unicode-conferences)
  * [41st Internationalization and Unicode Conference](#41st-internationalization-and-unicode-conference)
    * [Extending Libphonenumber for Fun and Profit](#extending-libphonenumber-for-fun-and-profit)
    * [Enhancing Date, Time, Timezone Support in Globalize.js](#enhancing-date-time-timezone-support-in-globalizejs)
    * [What's NOT in a Name?](#whats-not-in-a-name)
  * [40th Internationalization and Unicode Conference](#40th-internationalization-and-unicode-conference)
    * [Lightning Talks -  Locale resolution at scale](#lightning-talks----locale-resolution-at-scale)
    * [The New PayPal Mobile App](#the-new-paypal-mobile-app)
    * [Unicode, CLDR, and KYC, KYB, and Money Laundering](#unicode-cldr-and-kyc-kyb-and-money-laundering)
  * [39th Internationalization and Unicode Conference](#39th-internationalization-and-unicode-conference)
    * [Multilingual Transliteration - Standards, Technology, and Issues](#multilingual-transliteration---standards-technology-and-issues)
    * [Griffin - PayPal Node.js API for i18n](#griffin---paypal-nodejs-api-for-i18n)
    * [Continuing Adventures Going Door-to-Door Around the World](#continuing-adventures-going-door-to-door-around-the-world)
  * [38th Internationalization and Unicode Conference](#38th-internationalization-and-unicode-conference)
    * [Using GPS to Track Your Position and Trajectory](#using-gps-to-track-your-position-and-trajectory)
    * [Address Standards, Formats, and Nightmares](#address-standards-formats-and-nightmares)
    * [Pseudo Localization in Action](#pseudo-localization-in-action)
* [IMUG- Internationalization and Multilingual Users Group](#imug--internationalization-and-multilingual-users-group)
    * [How PayPal launched a global app in 140  countries simultaneously](#how-paypal-launched-a-global-app-in-140-countries-simultaneously)
* [SF Globalization Meetup](#sf-globalization-meetup)
    * [Address Standards, Formats, and Nightmares](#address-standards-formats-and-nightmares-1)
    * [Internationalization Aspects of Money Laundering](#internationalization-aspects-of-money-laundering)


## Internationalization and Unicode Conferences

http://unicodeconference.org/

---

---

### 38th Internationalization and Unicode Conference

*November 3-5, 2014, Santa Clara, CA, USA*

[Conference Site](http://unicodeconference.org/iuc38/Program.pdf)

---

#### Using GPS to Track Your Position and Trajectory

*Erwin Hom*<br/>
Internationalization Engineer, PayPal Inc.

*Michael McKenna*<br/>
Globalization Engineering Leader, PayPal, Inc.

Presentation: [PDF File](./IUC-38/iuc-38-gps.pdf)

So, suppose you've been asked to create a software application that can be easily released globally, where do you begin?

How do you track the process of the global-readiness of your application?
Whether you're creating an application for a few locales or a few dozen, you'll need some kind of system to measure its progress and success.

At PayPal, we've developed a Globalization roadmap for our development teams to follow and a system to track and grade the maturity of our products.
In this talk, we'll present the Globalization Maturity Model (GMM) which divides i18n capabilities into groups providing a roadmap of i18n support to be developed. We'll also present the Globalization Product Scorecard (GPS) which can be used to track and grade the maturity of global-readiness in your products. The GPS at PayPal is composed of three measures: the level of i18n maturity according to the GMM, a globalization quality score, and a global product management score.

---

####  Address Standards, Formats, and Nightmares

*Erwin Hom*<br/>
Internationalization Engineer, PayPal Inc.

*Aarti Ashok*<br/>
Product Architect, Globalization Technology, PayPal, Inc.

Presentation: [PDF File](./IUC-38/S7-2-IUC-38-PostalAddress_Hom_Ashok.pdf)

If your application deals with addresses for multiple countries, this talk highlights the challenges in supporting address in an internationalized application. In this talk, we present:

- Variations of Address Formats
  - Complex Address Format in UK, Brazil, Japan, and others.
  - Street Complement component in the Indian Address Format
  - Reading an Address as a Native versus reading it as a Non-Native (for example, English speaker)
  - Providing for local and international formats to help in cross-border trade
- Handing address formats in the UI - address entry forms
- Handling address data in the app (This is an opportunity to present the Canonical Format, Locale Neutral Format)
- Devising an XML layout syntax based off CLDR and LDML to put name and address layout meta data in a machine-readable form

---

#### Pseudo Localization in Action

*Xiang Xu*<br/>
Senior Globalization Developer, PayPal Inc.

*Erwin Hom*<br/>
Internationalization Engineer, PayPal Inc.

*Michael McKenna*<br/>
Globalization Engineering Leader, PayPal, Inc.

Presentation: [PDF File](./IUC-38/S13-3-IUC-38-PseudoLocinAction_Xu_Hom_McKenna.pdf)

Pseudo localization is an effective way to detect i18n/l10n issues, the effective use of pseudo localization can mean huge savings for a company. A well designed flexible pseudo localization tool is critical. At PayPal, we use pseudo localization to help us process multiple content types (XML-based content, Java properties, mobile resource files, etc.) with various pseudo localization patterns on multiple platforms. In addition to supporting classic pseudo localization practices such as dynamic text expansion and readability of resulting text, it also supports pseudo patterns that are custom made for Asian languages as well as RTL languages. With this tool, it is easy to add support for future content types and more pseudo localization patterns, as well as integrating Machine Translation.

In this talk, we present challenges and success of our pseudo-localization tool, the kind of issues that are detected by the tool, as well as the use of it as an education tool to engineering and UI/content designers. We discuss the documented increase in quality since integrating the tool with development, design, and CI processes.

---

---

### 39th Internationalization and Unicode Conference

*October 26-28, 2015, Santa Clara, CA, USA*

[Conference Site](http://unicodeconference.org/iuc39/program-details.pdf)

---

#### Multilingual Transliteration - Standards, Technology, and Issues

*Michael McKenna*<br/>
I18n Product Owner, PayPal, Inc.

Presentation: [PDF File](./IUC-39/IUC39-McKenna-Transliteration.pdf)

In the expanding European Union, a majority of people speak at least two languages. In the United States, English is becoming a second language to a larger and larger segment of the population. Even so, official documents, phone books, bibliographic records, and other digital repositories may need to present native language source information (e.g., Russian or Greek) in a transliterated form to allow it to be interpreted by someone who does not speak or read that language. This paper presents a survey of issues confronting the language engineer along with solutions and available technologies. We look at historical standards and contexts in which the standards become useless. We then look at early work funded by the Directorate General for Research of the European Union, then on to solutions provided by Java and software libraries. We finish by taking a look at some commercial universal names databases and the technology behind them.

---

#### Griffin - PayPal Node.js API for i18n

*Michael McKenna*<br/>
I18n Product Owner, PayPal, Inc.

*Reza Payami*<br/>
Internationalization Engineer, PayPal, Inc

Presentation: [PDF File](./IUC-39/IUC-39-Griffin_McKenna_Payami.pdf)

In late 2013, PayPal made a corporate decision to migrate to Node.js. However, Node.js had very little or broken internationalization support, mostly inherited from client-side JavaScript which relied on the underlying operating system for i18n support. Initially, Node.js did not have the metadata or features needed to come even close to what PayPal needed to support markets in over 200 countries, plus appropriate English and local language formatting for every region.

This talk discusses the effort the PayPal Internationalization Technology Team went through to investigate all known Open Source options, decide on an appropriate infrastructure to build upon, then customization of CLDR and other data to fit in to that infrastructure to finally enable Node.js products to support validation, normalization, display, and html and semantic markup of dates, times, numbers, currencies, phone, postal address, and personal names in 200+ countries and 27 languages. Included are methods used to reduce the memory footprint, the decisions made to use regional territory containment and choice of English locales to use for fallback in the many countries where CLDR does not have an appropriate English locale defined.

As a finale, we demonstrate the Griffin Reference App created to allow content owners to view formats according to locale, and encourage just-in-time learning by providing a pre-populated Node.js playground, similar to W3School's "Try it Yourself" JavaScript playground app.

---

#### Continuing Adventures Going Door-to-Door Around the World

*Erwin Hom*<br/>
Internationalization Engineer, PayPal, Inc.

*Michael McKenna*<br/>
I18n Product Owner, PayPal, Inc.

Presentation: [PDF File](./IUC-39/S12-T2-Hom-McKenna.pdf)

Supporting Postal Addresses.

If your application deals with postal addresses for multiple countries, this talk highlights the challenges (and solutions) in supporting them in an internationalized application.

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

---

---

### 40th Internationalization and Unicode Conference

*November 1-3, 2016, Santa Clara, CA, USA*

[Conference Site](http://unicodeconference.org/iuc40/Conference_Program.pdf)

---

#### Lightning Talks -  Locale resolution at scale 

 *Manikandan Ramalingam Kandaswamy* <br/>
Member of Technical Staff – I18N – PayPal, Inc

Presentation: [PDF File](./IUC-40/LT-Kandaswamy.pdf)

This lightning talk takes a look at the concept, building blocks, and sample locale resolution logic needed to resolve locale for users depending on 

* Browser settings
* Cookie
* Session cookie
* IP address/Geo location
* URL parameter
* URL domain
* User profile
* Configured default locale

---

#### The New PayPal Mobile App

*Lucas Welti*<br/>
Globalization Architect, PayPal, Inc

Presentation: [PDF File](./IUC-40/S10T1-Welti.pdf)

These days most of commerce is done online with mobile becoming the key player.

The previous PayPal Mobile frameworks did not support some of the unique PayPal requirements such as providing English for all Markets and supporting the locale language in some specific countries.

It was important for us to ensure that customers had a consistent experience across all devices from web to smart phone, and for that reason a lot of the Dates, Name, Address, Currency Metadata that is shared between our web applications and Mobile Apps, have only ONE source of truth.

This talk explains how PayPal was able to launch their new Mobile App for iOS and Android and make it available for 145 markets. This was done using new platforms and processes to make it easier to localize and customize. From Design to Development, the Globalization Team was involved from Day 1, providing Internationalization support, Globalization Q&A, reviewing Content and delivering translations.

---

#### Unicode, CLDR, and KYC, KYB, and Money Laundering

*Mike McKenna*<br/>
I18n Product Owner, PayPal, Inc.

Presentation: [PDF File](./IUC-40/S12T3-McKenna.pdf)

In today's world, when money is passed from one party to another, someone else is watching that transaction and must decide if it is legal or suspicious. Every legal money institution is required to "Know Your Customer" - known in the industry as "KYC", and "Know Your Business" (KYB). This is to reduce risk, reduce money laundering, and for regulatory requirements, to comply with local and international governments.

In this session, you get a quick overview of KYC, KYB, Risk and Compliance, then we delve into the internationalization aspects and how Unicode and CLDR help. Topics to be shared:

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

---

---

### 41st Internationalization and Unicode Conference

*October 16-18, 2017, Santa Clara, CA, USA*

[Conference Site](http://unicodeconference.com/iuc41/index.htm)

#### Extending Libphonenumber for Fun and Profit

*Daniel Bruhn*<br/>
i18n Engineer

Presentation: [PDF File](./IUC-41/S4T3-Bruhn.pdf)

Gitub *[fullstack-phone](https://github.com/paypal/fullstack-phone)*

Google’s [libphonenumber library](https://github.com/googlei18n/libphonenumber) is the de-facto industry standard for processing international phone numbers, providing support for formatting, validating, and normalizing phone numbers in 250+ regions. However, the default phone metadata is quite heavy. Various custom packages have reduced the code & metadata footprint by:

* Simplifying the API and pre-compiling with Closure ([grantila/awesome-phonenumber](https://github.com/grantila/awesome-phonenumber))
* Providing individually compiled code+metadata bundles for each region ([leodido/i18n.phonenumbers.js](https://github.com/leodido/i18n.phonenumbers.js/blob/master/README.md), [nathanhammond/libphonenumber](https://github.com/nathanhammond/libphonenumber))
* Rewriting the entire library without Closure and providing the option to hot load metadata for groups of regions ([halt-hammerzeit/libphonenumber-js](https://devhub.io/repos/halt-hammerzeit-libphonenumber-js))

For my use case, I needed:
* The official libphonenumber code (not a pure JS re-write)
* A static code base that doesn’t change for different regions
* Hot loadable metadata bundles for individual regions

And so, I implemented yet another custom JS libphonenumber package. In this talk I present this package and discuss some of the interesting challenges in producing a customized version of libphonenumber.

#### Enhancing Date, Time, Timezone Support in Globalize.js

*Manikandan Ramalingam Kandaswamy*<br/>
i18n Engineer

Presentation: [PDF File](./IUC-41/S7T2-Kandaswamy.pdf)<br/>
Github: *[globalize.js](https://github.com/globalizejs/globalize/commit/7eda86cc549a4d0c8d176b696ae7b6834d36fc96)*

Is [Globalize.js](https://github.com/globalizejs) on its way to becoming the ICU of the Javascript world? Let’s find out. Globalize.js has been adopted as the internationalization library of choice in Javascript by organizations ranging from Twitter, PayPal, IBM to many startups. Globalize.js has been key in providing i18n features including date, time, number, message formats, plurals, units and relative time. Now, with the latest enhancements, Globalize.js also supports complex date, time and timezone transformations. The library supports IANA and CLDR standards with a tiny footprint one-fifth the size for code and data compared to similar libraries like moment.js. This talk covers these enhancements and how you can use Globalize for your i18n needs.

#### What's NOT in a Name?

*Mike McKenna*<br/>
i18n Architect

Presentation: [PDF File](./IUC-41/S12T2-McKenna.pdf)

When conducting financial transactions, the regulations of many countries and international treaties dictate that to help with anti-money laundering (AML) and combating the financing of terrorism (CFT), business relations with anonymous clients or clients using fake names is prohibited. So as part of the due diligence to comply in a global marketplace, applications need to have confidence that a name entered has a high probability of being authentic, and are able to quickly detect if a name may be gibberish, fake, or incomplete. This presentation explores the multi-regional and multilingual aspects of detecting what is *not* in a name.

There are established natural language processing (NLP) techniques to create probabilities of character sequences for determining the likelihood that a word or phrase is written in a specific language. Names are text, but not all text are names. This talk explores

* Standard NLP - using probability theory with 2-character Markov chains
* Sourcing and using regional census and names databases to train good patterns
* Examples of fake, gibberish and incomplete names in English
* Why English positive and negative patterns do not apply across languages and regions
* Using CLDR keyboard maps and regional honorifics to train gibberish detection patterns
* Negative probability of mixed script names

---

---

## IMUG- Internationalization and Multilingual Users Group

SF Bay Area

[IMUG Site](http://imug.org/)

---

#### How PayPal launched a global app in 140+ countries simultaneously

*September 15, 2016*

[IMUG Page for this session]((http://imug.org/events/imug-2016-events.htm#paypal))

*Lucas Welti*

Presentation: [PDF File](./IMUG/ImugPayPal-Sep-2016.pdf)

These days most commerce happens online, and mobile has become a key player. This talk explains how PayPal was able to launch the new PayPal Mobile app for iOS and Android simultaneously in more than 140 markets.

This was done using new platforms and process to make it easier to localize and customize. From design to development, the PayPal globalization team has been involved since day 1, providing internationalization support and QA, reviewing content, and delivering translations. 

---

---

## SF Globalization Meetup

[Meetup Site](https://www.meetup.com/sf-globalization/)

---

#### Address Standards, Formats, and Nightmares

*March 2, 2015*

[Meetup page for this session](https://www.meetup.com/sf-globalization/events/214065882/)

*Mike McKenna*

*Erwin Hom*

If your application deals with addresses for multiple countries, this talk highlights the challenges in supporting address in an internationalized application. In this talk, we present:

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

---

#### Internationalization Aspects of Money Laundering

*May 10, 2017, San Francisco*

[Meetup page for this session](https://www.meetup.com/sf-globalization/events/237082980/)

*Mike McKenna*

Presentation: [PDF File](./SF-G11n/SF-G11n-2017-05-McKenna-i18n_Money_Laundering.pdf)

In today's world, when money is passed from one party to another, someone else is watching that transaction and must decide if it is legal or suspicious. Every legal money institution is required to "Know Your Customer" - known in the industry as "KYC", and "Know Your Business" (KYB). This is to reduce risk, reduce money laundering, and for regulatory requirements, to comply with local and international governments. 

In this talk, Mike gave a quick overview of KYC, KYB, Risk and Compliance, then delve into some of the internationalization aspects of detecting money laundering and terrorist funding.
