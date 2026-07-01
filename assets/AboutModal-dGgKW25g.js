class p{constructor(t={}){this.options={modalId:t.modalId||"about-modal",title:t.title||"About Us",subtitle:t.subtitle||"Information about this tool",overviewText:t.overviewText||this.#t(),projectName:t.projectName||"TDS Statistics Editor",showUpdateLog:t.showUpdateLog!==!1,showCredits:t.showCredits!==!1,showDonations:t.showDonations!==!1,additionalTabs:t.additionalTabs||[],...t},this.modal=null,this.updateLogContainer=null,this.supporters=[],this.supportersLoaded=!1,this.init()}#t(){return`
      <p>
        The Statistics Editor (and thereby, the Database) is a
        website and project owned by the community of Tower
        Defense Simulator Wiki.
      </p>
      <p>
        The official Tower Defense Simulator Wiki is hosted by
        <img
          width="60px"
          class="theme-image"
          src="https://static.wikia.nocookie.net/6a181c72-e8bf-419b-b4db-18fd56a0eb60"
          data-light-src="https://upload.wikimedia.org/wikipedia/commons/c/ce/Fandom.svg"
          data-dark-src="https://static.wikia.nocookie.net/6a181c72-e8bf-419b-b4db-18fd56a0eb60"
          style="vertical-align: text-top"
          alt="Fandom"
          loading="lazy"
        />
        which manages and maintains the platform for the
        community. This website operates independently and is not
        directly affiliated with it.
      </p>
    `}init(){if(document.getElementById(this.options.modalId)){console.warn(`Modal with id "${this.options.modalId}" already exists`);return}const t=this.#n();document.body.insertAdjacentHTML("beforeend",t),this.modal=document.getElementById(this.options.modalId),this.options.showDonations&&this.#e(),this.options.showUpdateLog&&(this.updateLogContainer=this.modal.querySelector(`#${this.options.modalId}-updates-content`),this.#a()),this.#g(),this.#s(),window.bootstrap&&window.bootstrap.Tooltip&&[].slice.call(this.modal.querySelectorAll('[data-bs-tooltip="true"]')).forEach(e=>{new window.bootstrap.Tooltip(e)})}#s(){if(!this.modal)return;const s=document.body.classList.contains("light-mode");this.modal.querySelectorAll(".theme-image").forEach(e=>{s?e.dataset.lightSrc&&(e.src=e.dataset.lightSrc):e.dataset.darkSrc&&(e.src=e.dataset.darkSrc)})}#e(){if(document.getElementById("momo-qr-modal"))return;document.body.insertAdjacentHTML("beforeend",`
      <div
        class="modal fade"
        id="momo-qr-modal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="momo-qr-label"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content bg-dark text-white">
            <!-- Modal Header -->
            <div class="modal-header">
              <div class="d-flex align-items-center">
                <div class="toru-icon-container me-3">
                  <i class="bi bi-qr-code-scan fs-3"></i>
                </div>
                <div>
                  <h5 class="modal-title unisans mb-0" id="momo-qr-label">
                    Donate via MoMo
                  </h5>
                  <p class="text-muted small mb-0">
                    Scan QR code with MoMo app
                  </p>
                </div>
              </div>
              <button
                type="button"
                class="btn-close btn-close-white"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body text-center p-4 pb-0">
              <div class="mb-3">
                <img
                  src="https://bin.t7ru.link/a551f4de9d6d"
                  alt="MoMo QR Code"
                  class="img-fluid"
                  style="max-width: 300px; border-radius: 8px;"
                  loading="lazy"
                />
              </div>
              <p class="text-muted">
                Open the MoMo app on your phone, scan this QR code, and follow the prompts to complete your donation.
              </p>
              <div class="alert alert-info mt-3">
                <i class="bi bi-info-circle me-2"></i>
                MoMo is available for users in Vietnam only.
              </div>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
    `)}#a(){if(!this.modal||!this.updateLogContainer)return;const t=this.modal.querySelector(`#${this.options.modalId}-updates-tab`),s=()=>{this.updateLogContainer&&!this.updateLogContainer.dataset.loaded&&(this.#i(),this.updateLogContainer.dataset.loaded="true")};this.modal.addEventListener("shown.bs.modal",s),t&&t.addEventListener("click",s)}async#i(){if(!this.updateLogContainer)return;const t="Paradoxum-Wikis",s="TDS-Stats-Editor",e=20;try{const i=await fetch(`https://api.github.com/repos/${t}/${s}/commits?per_page=${e}`);if(!i.ok)throw new Error(`GitHub API error: ${i.status}`);const a=await i.json();this.#o(a)}catch(i){console.error("Failed to fetch commits:",i),this.#d("Couldn't fetch GitHub updates. Please try again later.")}}#o(t){if(!this.updateLogContainer)return;let s='<div class="list-group">';t.forEach(e=>{const i=e.commit.message,o=new Date(e.commit.author.date).toLocaleDateString("en-US",{year:"numeric",month:"short",day:"numeric"});e.sha.substring(0,7);const l=e.commit.author.name,d=e.html_url,{badge:n,extraBadge:r,cleanMessage:c}=this.#l(i);s+=`
        <div class="list-group-item bg-dark text-white border-secondary">
          <div class="d-flex w-100 justify-content-between">
            <h5 class="mb-1">
              ${n}
              ${r}
              ${c}
            </h5>
          </div>
          <p class="mb-1 text-muted">by ${l}</p>
          <div class="d-flex w-100 justify-content-between">
            <small>
              <a href="${d}" target="_blank" class="text-info">
                <i class="bi bi-github me-1"></i>View details
              </a>
            </small>
            <small class="text-muted">${o}</small>
          </div>
        </div>
      `}),s+="</div>",this.updateLogContainer.innerHTML=s}#l(t){const s=t.toLowerCase();let e="",i="",a=t.split(`
`)[0];if(s.startsWith("npm(")){const o=t.match(/npm\(([^)]+)\):\s*(.*)/);o?(e='<span class="badge bg-secondary me-1">npm</span>',i=`<span class="text-muted">(${o[1]})</span> `,a=o[2]):e='<span class="badge bg-secondary me-1">npm</span>'}else s.startsWith("feat:")||s.startsWith("feat(")?(e='<span class="badge bg-success me-1">Feature</span>',a=a.replace(/^feat(\([^)]*\))?:\s*/i,"")):s.startsWith("fix:")||s.startsWith("fix(")?(e='<span class="badge bg-danger me-1">Fix</span>',a=a.replace(/^fix(\([^)]*\))?:\s*/i,"")):s.startsWith("chore:")||s.startsWith("chore(")?(e='<span class="badge bg-secondary me-1">Chore</span>',a=a.replace(/^chore(\([^)]*\))?:\s*/i,"")):s.startsWith("docs:")||s.startsWith("docs(")?(e='<span class="badge bg-info me-1">Docs</span>',a=a.replace(/^docs(\([^)]*\))?:\s*/i,"")):s.startsWith("refactor:")||s.startsWith("refactor(")?(e='<span class="badge bg-warning me-1">Refactor</span>',a=a.replace(/^refactor(\([^)]*\))?:\s*/i,"")):s.startsWith("style:")||s.startsWith("style(")?(e='<span class="badge bg-info me-1">Style</span>',a=a.replace(/^style(\([^)]*\))?:\s*/i,"")):s.startsWith("test:")||s.startsWith("test(")?(e='<span class="badge bg-warning me-1">Test</span>',a=a.replace(/^test(\([^)]*\))?:\s*/i,"")):s.startsWith("perf:")||s.startsWith("perf(")?(e='<span class="badge bg-success me-1">Performance</span>',a=a.replace(/^perf(\([^)]*\))?:\s*/i,"")):s.startsWith("ci:")||s.startsWith("ci(")?(e='<span class="badge bg-info me-1">CI</span>',a=a.replace(/^ci(\([^)]*\))?:\s*/i,"")):s.startsWith("build:")||s.startsWith("build(")?(e='<span class="badge bg-secondary me-1">Build</span>',a=a.replace(/^build(\([^)]*\))?:\s*/i,"")):s.startsWith("merge pull request")||s.startsWith("merge branch")?e='<span class="badge bg-primary me-1">Merge</span>':s.includes("fix")||s.includes("bug")?e='<span class="badge bg-danger me-1">Fix</span>':s.includes("add")||s.includes("feature")?e='<span class="badge bg-success me-1">Feature</span>':s.includes("update")||s.includes("improve")?e='<span class="badge bg-primary me-1">Update</span>':s.includes("refactor")||s.includes("cleanup")?e='<span class="badge bg-warning me-1">Refactor</span>':s.includes("doc")?e='<span class="badge bg-info me-1">Docs</span>':e='<span class="badge bg-secondary me-1">Chore</span>';return{badge:e,extraBadge:i,cleanMessage:a}}#d(t){this.updateLogContainer&&(this.updateLogContainer.innerHTML=`
      <div class="alert alert-danger">
        <i class="bi bi-exclamation-triangle-fill me-2"></i>
        ${t}
      </div>
    `)}#n(){const t=this.#r(),s=this.#c();return`
      <div
        class="modal fade"
        id="${this.options.modalId}"
        tabindex="-1"
        role="dialog"
        aria-labelledby="${this.options.modalId}-label"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content bg-dark text-white">
            <!-- Modal Header -->
            <div class="modal-header">
              <div class="d-flex align-items-center">
                <div class="toru-icon-container me-3">
                  <i class="bi bi-info-circle-fill fs-3"></i>
                </div>
                <div>
                  <h5 class="modal-title unisans mb-0" id="${this.options.modalId}-label">
                    ${this.options.title}
                  </h5>
                  <p class="text-muted small mb-0">
                    ${this.options.subtitle}
                  </p>
                </div>
              </div>
              <button
                type="button"
                class="btn-close btn-close-white"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body p-0">
              ${t}
              ${s}
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
              ${this.#u()}
            </div>
          </div>
        </div>
      </div>
    `}#r(){const t=[];t.push({id:"supporters",title:"Supporters",icon:"bi-heart",active:!0}),t.push({id:"about",title:"About",icon:"bi-info-circle",active:!1}),this.options.showUpdateLog&&t.push({id:"updates",title:"Update Log",icon:"bi-journal-code"}),this.options.showCredits&&t.push({id:"credits",title:"Credits",icon:"bi-people-fill"});const e=[...t,...this.options.additionalTabs].map((i,a)=>`
      <li class="nav-item" role="presentation">
        <button
          class="nav-link ${a===0?"active":""} text-white"
          id="${this.options.modalId}-${i.id}-tab"
          data-bs-toggle="tab"
          data-bs-target="#${this.options.modalId}-${i.id}-content"
          type="button"
          role="tab"
          aria-controls="${this.options.modalId}-${i.id}-content"
          aria-selected="${a===0?"true":"false"}"
        >
          <i class="bi ${i.icon} me-2"></i>${i.title}
        </button>
      </li>
    `).join("");return`
      <ul class="nav nav-tabs nav-fill bg-darker" id="${this.options.modalId}-tabs" role="tablist">
        ${e}
      </ul>
    `}#c(){const t=[];t.push(this.#m()),t.push(this.#p()),this.options.showUpdateLog&&t.push(this.#b()),this.options.showCredits&&t.push(this.#h());const s=this.options.additionalTabs.map(e=>`
      <div
        class="tab-pane fade"
        id="${this.options.modalId}-${e.id}-content"
        role="tabpanel"
        aria-labelledby="${this.options.modalId}-${e.id}-tab"
      >
        ${e.content}
      </div>
    `).join("");return`
      <div class="tab-content p-3">
        ${t.join("")}
        ${s}
      </div>
    `}#m(){return`
      <div
        class="tab-pane fade show active"
        id="${this.options.modalId}-supporters-content"
        role="tabpanel"
        aria-labelledby="${this.options.modalId}-supporters-tab"
      >
        <div class="toru-section">
          <h6 class="toru-heading">
            <i class="bi bi-heart-fill me-2"></i>Our Supporters
          </h6>
          <div class="toru-options">
            <p class="text-center text-muted mb-3">
              Special thanks to our generous supporters who help keep this project running!
            </p>
            <div id="supporters-container">
              <div class="text-center">
                <div class="spinner-border spinner-border-sm text-secondary" role="status">
                  <span class="visually-hidden">Loading...</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        ${this.options.showDonations?`
          <div class="toru-section">
            <h6 class="toru-heading">
              <i class="bi bi-envelope-open-heart me-2"></i>Support Us
            </h6>
            <div class="toru-options">
              <p class="text-center">
                If you find this tool useful and would like to support its development, consider making a donation!
              </p>
              <div class="row g-3 mt-2">
                <div class="col-md-4">
                  <a
                    href="https://github.com/sponsors/Paradoxum-Wikis"
                    target="_blank"
                    class="btn btn-outline-light w-100 d-flex flex-column align-items-center p-3"
                  >
                    <i class="bi bi-github fs-3 mb-2"></i>
                    <span class="fw-bold">GitHub Sponsors</span>
                    <small class="text-muted mt-1">Get yourself a GitHub sponsor badge too!</small>
                  </a>
                </div>
                <div class="col-md-4">
                  <a
                    href="https://ko-fi.com/paradoxumwikis"
                    target="_blank"
                    class="btn btn-outline-light w-100 d-flex flex-column align-items-center p-3"
                  >
                    <i class="bi bi-cup-hot-fill fs-3 mb-2"></i>
                    <span class="fw-bold">Ko-fi</span>
                    <small class="text-muted mt-1">The most convenient way to support us!</small>
                  </a>
                </div>
                <div class="col-md-4">
                  <button
                    type="button"
                    class="btn btn-outline-light w-100 d-flex flex-column align-items-center p-3"
                    data-bs-toggle="modal"
                    data-bs-target="#momo-qr-modal"
                  >
                    <i class="bi bi-qr-code fs-3 mb-2"></i>
                    <span class="fw-bold">MoMo</span>
                    <small class="text-muted mt-1">Quyên góp qua ngân hàng nội địa!</small>
                  </button>
                </div>
              </div>
            </div>
          </div>
        `:""}
      </div>
    `}#p(){return`
      <div
        class="tab-pane fade"
        id="${this.options.modalId}-about-content"
        role="tabpanel"
        aria-labelledby="${this.options.modalId}-about-tab"
      >
        <div class="toru-section">
          <h6 class="toru-heading">
            <i class="bi bi-book me-2"></i>Overview
          </h6>
          <div class="toru-options">
            ${this.options.overviewText}
          </div>
        </div>

        <div class="toru-section">
          <div class="d-flex align-items-center justify-content-center">
            <a
              href="https://discord.gg/fBgQzudY3h"
              target="_blank"
              class="mx-3 text-decoration-none d-flex flex-column align-items-center"
            >
              <img
                style="width: 48px"
                class="zoomup type1"
                title="Join the Tower Defense Simulator Wiki Discord server!"
                data-bs-tooltip="true"
                data-bs-placement="bottom"
                src="https://static.wikia.nocookie.net/tower-defense-sim/images/4/4c/Discord-Symbol-Blurple.svg"
                alt="Discord Logo"
                loading="lazy"
              />
            </a>
            <a
              href="https://github.com/Paradoxum-Wikis/TDS-Stats-Editor"
              target="_blank"
              class="mx-3 text-decoration-none d-flex flex-column align-items-center"
            >
              <img
                style="width: 48px"
                class="zoomup theme-image"
                title="Contribute to the website's source code!"
                data-bs-tooltip="true"
                data-bs-placement="bottom"
                src="/htmlassets/github-mark-white.svg"
                data-light-src="/htmlassets/github-mark.svg"
                data-dark-src="/htmlassets/github-mark-white.svg"
                alt="GitHub Logo"
                loading="lazy"
              />
            </a>
            <a
              href="https://tds.fandom.com/wiki/Help:Statistics_Editor"
              target="_blank"
              class="mx-3 text-decoration-none d-flex flex-column align-items-center"
            >
              <img
                style="width: 48px"
                class="zoomup type1"
                title="Visit the dedicated help guide on the TDS Wiki!"
                data-bs-tooltip="true"
                data-bs-placement="bottom"
                src="/htmlassets/wikisquaredsmall.png"
                alt="TDS Wiki Logo"
                loading="lazy"
              />
            </a>
          </div>
        </div>
      </div>
    `}#b(){return`
      <div
        class="tab-pane fade overflow-auto"
        id="${this.options.modalId}-updates-content"
        role="tabpanel"
        aria-labelledby="${this.options.modalId}-updates-tab"
        style="max-height: 25rem"
      >
        <div class="d-flex justify-content-center">
          <div class="spinner-border text-secondary" role="status">
            <span class="visually-hidden">Loading...</span>
          </div>
        </div>
      </div>
    `}#h(){return`
      <div
        class="tab-pane fade"
        id="${this.options.modalId}-credits-content"
        role="tabpanel"
        aria-labelledby="${this.options.modalId}-credits-tab"
      >
        <div class="toru-section">
          <h6 class="toru-heading">
            <i class="bi bi-code-slash me-2"></i>Developers
          </h6>
          <div class="toru-options">
            <div class="row justify-content-center">
              <div class="col-md-4 mb-3">
                <div class="card bg-dark border-secondary h-100">
                  <div class="card-body text-center">
                    <img
                      src="https://avatars.githubusercontent.com/u/85133189"
                      alt="Developer"
                      class="rounded-circle mb-3 object-fit-cover"
                      style="width: 5rem"
                      loading="lazy"
                    />
                    <h6 class="card-title">megu-dev</h6>
                    <p class="card-text small text-muted">
                      Developer<br />(Tier Maker)
                    </p>
                    <a
                      href="https://github.com/megu-dev"
                      target="_blank"
                      class="btn btn-sm btn-outline-primary"
                    >
                      <i class="bi bi-github me-1"></i>GitHub
                    </a>
                  </div>
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <div class="card bg-dark border-secondary h-100">
                  <div class="card-body text-center">
                    <img
                      src="https://avatars.githubusercontent.com/u/57356716"
                      alt="Developer"
                      class="rounded-circle mb-3 object-fit-cover"
                      style="width: 5rem"
                      loading="lazy"
                    />
                    <h6 class="card-title">t7ru</h6>
                    <p class="card-text small text-muted">
                      Core Developer<br />(Entirety)
                    </p>
                    <a
                      href="https://github.com/t7ru"
                      target="_blank"
                      class="btn btn-sm btn-outline-primary"
                    >
                      <i class="bi bi-github me-1"></i>GitHub
                    </a>
                  </div>
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <div class="card bg-dark border-secondary h-100">
                  <div class="card-body text-center">
                    <img
                      src="https://avatars.githubusercontent.com/u/64506745"
                      alt="Developer"
                      class="rounded-circle mb-3 object-fit-cover"
                      style="width: 5rem"
                      loading="lazy"
                    />
                    <h6 class="card-title">SneakyWolfy</h6>
                    <p class="card-text small text-muted">
                      Original Developer<br />(Statistics Editor)
                    </p>
                    <a
                      href="https://github.com/SneakyWolfy"
                      target="_blank"
                      class="btn btn-sm btn-outline-primary"
                    >
                      <i class="bi bi-github me-1"></i>GitHub
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="toru-section">
          <h6 class="toru-heading">
            <i class="bi bi-stars me-2"></i>Acknowledgements
          </h6>
          <div class="toru-options">
            <p>
              Special thanks to all contributors to the project,
              Mentin123, the Tower Defense Simulator Wiki community, and
              the Tower Defense Simulator community for their support
              and feedback.
            </p>
          </div>
        </div>
      </div>
    `}#u(){return this.options.customFooter?this.options.customFooter:`
      <span class="text-muted small me-auto">Last updated for game version: <b class="tdsversion"></b></span>
      <button
        type="button"
        class="btn btn-secondary"
        data-bs-dismiss="modal"
      >
        Close
      </button>
    `}show(){this.modal&&window.bootstrap&&window.bootstrap.Modal&&new window.bootstrap.Modal(this.modal).show()}hide(){if(this.modal&&window.bootstrap&&window.bootstrap.Modal){const t=window.bootstrap.Modal.getInstance(this.modal);t&&t.hide()}}#g(){const t=async()=>{this.supportersLoaded||(await this.#f(),this.#v(),this.supportersLoaded=!0)};this.modal.addEventListener("shown.bs.modal",t)}async#f(){try{const t=await fetch("/supporters.json");t.ok&&(this.supporters=await t.json())}catch(t){console.error("Failed to load supporters:",t),this.supporters=[]}}#v(){const t=this.modal.querySelector("#supporters-container");t&&(t.innerHTML=this.#y())}#y(){return this.supporters.length===0?'<p class="text-center text-muted">Be the first to support us!</p>':this.supporters.map(t=>{const s=t.link?`<a href="${t.link}" target="_blank" class="text-decoration-none">`:"",e=t.link?"</a>":"",i=t.tier?`<span class="badge bg-warning text-dark mb-2">Tier ${t.tier}</span>`:"",a=t.message?`<p class="card-text small text-muted fst-italic mt-2 mb-0">"${t.message}"</p>`:"";return`
        <div class="card bg-dark border-secondary mb-3">
          <div class="card-body">
            <div class="d-flex align-items-center">
              ${s}
                <img
                  src="${t.avatar}"
                  alt="${t.name||"Supporter"}"
                  class="rounded-circle me-3"
                  style="width: 3.5rem; height: 3.5rem; object-fit: cover;"
                  loading="lazy"
                />
              ${e}
              <div class="flex-grow-1">
                ${s}
                  <h6 class="card-title mb-1">${t.name||"Anonymous Supporter"}</h6>
                ${e}
                ${i}
              </div>
            </div>
            ${a}
          </div>
        </div>
      `}).join("")}}export{p as A};
