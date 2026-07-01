function b(s){document.querySelectorAll(".tdsversion").forEach(t=>{t.textContent=s})}function u(s){return s.map(e=>`
        <div class="update-item mb-3">
            <h5>${e.version} <small class="text-muted">${e.date}</small></h5>
            <ul class="ps-3">
                ${e.changes.map(t=>`<li>${t}</li>`).join("")}
                <li>Various changes</li>
            </ul>
        </div>
    `).join("")}function g(){fetch("/updatelog.json").then(s=>s.json()).then(s=>{const e=document.getElementById("update-log-content"),t=document.getElementById("landing-update-log"),n=u(s);e&&(e.innerHTML=n),t&&(t.innerHTML=u(s))}).catch(s=>{console.error("Error loading update log:",s);const e='<div class="alert alert-danger">Failed to load update log.</div>',t=document.getElementById("update-log-content"),n=document.getElementById("landing-update-log");t&&(t.innerHTML=e),n&&(n.innerHTML=e)})}function w(){fetch("/announcements.json").then(s=>{if(!s.ok)throw new Error(`Failed to load announcements: ${s.status}`);return s.json()}).then(s=>{const e=document.getElementById("announcements-list");e&&(e.innerHTML="",s.forEach(t=>{const n=document.createElement("li");n.className="list-group-item bg-dark text-light border-secondary",n.innerHTML=`
          <div class="d-flex w-100 justify-content-between">
            <h5 class="mb-1">${t.title}</h5>
            <small class="text-muted">${t.date}</small>
          </div>
          <p class="mb-1">${t.description}</p>
          <a href="${t.link}" target="_blank" class="btn btn-sm btn-outline-info mt-2">
            <i class="bi bi-arrow-right me-2"></i>Read Full Post
          </a>
        `,e.appendChild(n)}))}).catch(s=>{console.error("Error loading announcements:",s);const e=document.getElementById("announcements-list");e&&(e.innerHTML=`
          <div class="alert alert-danger">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            Failed to load announcements. Please try again later.
          </div>
        `)})}const i={owner:"Paradoxum-Wikis",name:"TDS-Stats-Editor"};class p{constructor(){this.repoOwner=i.owner,this.repoName=i.name,this.commitLimit=20,this.modalContainer=null}async init(){this.modalContainer=document.getElementById("update-log-content");const e=window.location.pathname.includes("/db/");this.modalContainer&&this.fetchCommits(),e||g();const t=document.getElementById("discord-modal"),n=document.getElementById("aboutSectionUpdates");if(t&&n){const a=()=>{this.modalContainer&&this.fetchCommits()};t.addEventListener("shown.bs.modal",a),n.addEventListener("click",a)}}async fetchCommits(){if(this.modalContainer)try{const e=await fetch(`https://api.github.com/repos/${this.repoOwner}/${this.repoName}/commits?per_page=${this.commitLimit}`,{headers:{}});if(!e.ok)throw new Error(`GitHub API error: ${e.status}`);const t=await e.json();this.displayCommits(t)}catch(e){console.error("Failed to fetch commits:",e),this.showError("Couldn't fetch GitHub updates. Please try again later.",this.modalContainer)}}getBadgeStyle(e){switch(e?.toLowerCase()){case"feat":return{class:"bg-success",label:"Feature"};case"fix":return{class:"bg-danger",label:"Fix"};case"docs":return{class:"bg-info",label:"Documentation"};case"style":return{class:"bg-primary",label:"Style"};case"refactor":return{class:"bg-warning text-dark",label:"Refactor"};case"perf":return{class:"bg-purple",label:"Performance"};case"test":return{class:"bg-dark",label:"Test"};case"chore":return{class:"bg-secondary",label:"Chore"};case"build":return{class:"bg-crimson",label:"Build"};default:return{class:"bg-secondary",label:e||"Update"}}}formatDate(e){return e?new Date(e).toLocaleDateString("en-US",{year:"numeric",month:"short",day:"numeric"}):""}displayCommits(e){if(!this.modalContainer||!e?.length){this.modalContainer.innerHTML='<p class="text-center">No commits available.</p>';return}let t='<div class="list-group">';e.forEach(n=>{const a=this.formatDate(n.commit.author.date);let l=n.commit.message,c="",r="",o=l;const h=/^(\w+)(?:\(([^)]+)\))?: (.+)/,d=l.match(h);d&&([,c,r,o]=d,o=o.split(`
`)[0]);const m=this.getBadgeStyle(c,!0);t+=`
                <div class="list-group-item bg-dark text-white border-secondary">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">
                            <span class="badge ${m.class} me-1">${m.label}</span>
                            ${r?`<span class="text-muted">(${r})</span> `:""}
                            ${o}
                        </h5>
                    </div>
                    <p class="mb-1 text-muted">by ${n.commit.author.name}</p>
                    <div class="d-flex w-100 justify-content-between">
                        <small>
                            <a href="${n.html_url}" target="_blank" class="text-info">
                                <i class="bi bi-github me-1"></i>View details
                            </a>
                        </small>
                        <small class="text-muted">${a}</small>
                    </div>
                </div>`}),t+="</div>",this.modalContainer.innerHTML=t}showError(e,t){t&&(t.innerHTML=`
            <div class="alert alert-danger" role="alert">${e}</div>`)}}class f{constructor(){this.version="",this.commitHash="",this.repoOwner=i.owner,this.repoName=i.name}async init(){try{await Promise.all([this.loadVersionFromUpdateLog(),this.fetchLatestCommit()]),this.updateVersionElements()}catch(e){console.error("Failed to get version display:",e),this.commitHash="dev"}}async loadVersionFromUpdateLog(){try{const e=await fetch("/updatelog.json");if(!e.ok)throw new Error("Failed to load updatelog.json");const t=await e.json();this.version=t[0]?.version||""}catch(e){console.warn("Failed to load version from updatelog:",e),this.version=""}return this.version}async fetchLatestCommit(){try{const e=await fetch(`https://api.github.com/repos/${this.repoOwner}/${this.repoName}/commits?per_page=1`);if(!e.ok)throw new Error(`GitHub API error: ${e.status}`);const t=await e.json();this.commitHash=t[0]?.sha.substring(0,7)||"dev"}catch(e){console.warn("Failed to fetch commit info:",e),this.commitHash="dev"}return this.commitHash}updateVersionElements(){document.querySelectorAll(".version-full").forEach(e=>{e.textContent=`${this.version} (${this.commitHash})`}),window.TDSVersion&&document.querySelectorAll(".tdsversion").forEach(e=>{e.textContent=window.TDSVersion})}}document.addEventListener("DOMContentLoaded",()=>{new p().init();const e=new f;e.init();const t=document.getElementById("settings-modal");t&&t.addEventListener("shown.bs.modal",()=>{e.updateVersionElements()})});export{p as U,w as a,g as l,b as s};
