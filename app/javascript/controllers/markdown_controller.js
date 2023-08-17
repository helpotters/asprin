import { Controller } from "@hotwired/stimulus";

import { Marked } from 'marked';
import * as DOMPurify from 'dompurify';
import { markedEmoji } from "marked-emoji";
import { Octokit } from "@octokit/rest";
import {markedHighlight} from "marked-highlight";
import hljs from 'highlight.js';


export default class extends Controller {
  static targets = ["input", "previewArea", "textarea"];
  connect(){

    this.emojis = null; // Initialize emojis cache
    this.initialize();
  }

  initialize() {
    this.showTab(0);
    console.log("Continuing");
    this.renderPreview();
  }
  async fetchEmojis() {
    if (!this.emojis) {
      const octokit = new Octokit();
      const { data: emojis } = await octokit.rest.emojis.get();
      this.emojis = emojis; // Cache the fetched emojis
    }
  }
  async renderPreview() {
    await this.fetchEmojis(); // Fetch or use cached emojis

    const marked = new Marked(
      markedHighlight({
        langPrefix: '!bg-transparent hljs language-',
        highlight(code, lang) {
          const language = hljs.getLanguage(lang) ? lang : 'plaintext';
          return hljs.highlight(code, { language }).value;
        }
      })
    )
    marked.setOptions({
      highlight: function(code, lang) {
        return hljs.highlight(lang, code).value;
      }
    });

    const options = {
      emojis: this.emojis, // Use cached emojis
      unicode: false,
    };

    marked.use(markedEmoji(options));

    const markdownInput = this.textareaTarget.value;
    const renderedHTML = DOMPurify.sanitize(marked.parse(markdownInput));
    this.previewAreaTarget.innerHTML = renderedHTML;
  }
}
