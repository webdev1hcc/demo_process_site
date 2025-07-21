"use_strict";

const cheerio = require('cheerio');
const fs = require('fs');

function register() {
  this.once('sitePublished', ({ contentCatalog }) => {
    contentCatalog.getComponents().forEach(({ versions }) => {
      versions.forEach(({ name: component, version, url }) => {
        const pages = contentCatalog
          .findBy({ component, version, family: 'page' });
        for (const page of pages) {
          //console.log(`path: ${page.out.path}`);
          let path = './build/site/' + page.out.path;
          const $ = cheerio.load(fs.readFileSync(path));
          let body = $(`body[class="article"]`);
          body.attr('class', 'article toc2 toc-right');
          let link = $(`link[href="./asciidoctor.css"]`);
          link.attr('href', '../../_/css/asciidoctor.css');
          fs.writeFile(path, $.html(), function(err) {
            if (err) {
              throw err;
            }
            console.log(`${path} saved`);
          });
        }
      });
    });
  });
}

module.exports = { register };
