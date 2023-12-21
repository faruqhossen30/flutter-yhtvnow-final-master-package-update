import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as htmlDom;

class HtmlToIframe {
  String extractIframe(String htmlContent) {
    final document = htmlParser.parse(htmlContent);
    final iframeElements = document.getElementsByTagName('iframe');

    if (iframeElements.isNotEmpty) {
      return iframeElements.first.outerHtml; // Return the first <iframe> tag as a string
    }

    return ''; // Return an empty string if no <iframe> tags are found
  }

  String extractIframeSrc(String htmlContent) {
    final document = htmlParser.parse(htmlContent);
    final iframeElements = document.getElementsByTagName('iframe');

    if (iframeElements.isNotEmpty) {
      return iframeElements.first.attributes['src'] ?? ''; // Return the first <iframe> tag as a string
    }

    return ''; // Return an empty string if no <iframe> tags are found
  }

}
