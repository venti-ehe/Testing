/* BuildLab.Master.js - behaviour shared by every page that uses BuildLab.Master
   (scroll progress bar, reveal-on-scroll, card glow, cursor glow, active-nav scrolling). */
(() => {
  const meter = document.querySelector('.scroll-meter');
  const updateMeter = () => {
    if (!meter) return;
    const h = document.documentElement;
    const max = h.scrollHeight - h.clientHeight;
    meter.style.width = (max > 0 ? (h.scrollTop / max) * 100 : 0) + '%';
  };
  addEventListener('scroll', updateMeter, {passive:true}); updateMeter();

  const io = new IntersectionObserver(entries => {
    entries.forEach(e => { if(e.isIntersecting){ e.target.classList.add('in'); io.unobserve(e.target); } });
  }, {threshold:.12});
  document.querySelectorAll('.reveal').forEach(el => io.observe(el));

  document.querySelectorAll('.card').forEach(card => {
    card.addEventListener('pointermove', e => {
      const r = card.getBoundingClientRect();
      card.style.setProperty('--mx', ((e.clientX-r.left)/r.width*100)+'%');
      card.style.setProperty('--my', ((e.clientY-r.top)/r.height*100)+'%');
    });
  });

  const glow = document.createElement('div'); glow.className='cursor-glow'; document.body.appendChild(glow);
  addEventListener('pointermove', e => { glow.style.left=e.clientX+'px'; glow.style.top=e.clientY+'px'; }, {passive:true});

  document.querySelectorAll('a[href^="#"]').forEach(a => a.addEventListener('click', e => {
    const el = document.querySelector(a.getAttribute('href')); if(el){e.preventDefault(); el.scrollIntoView({behavior:'smooth',block:'start'});}
  }));


  const activeNav = document.querySelector('.progress-nav a.active');
  if (activeNav) setTimeout(() => activeNav.scrollIntoView({behavior:'smooth', inline:'center', block:'nearest'}), 120);

  document.querySelectorAll('.lab-visual').forEach(stage => {
    stage.addEventListener('pointermove', e => {
      const r = stage.getBoundingClientRect();
      const x = (e.clientX-r.left)/r.width-.5, y=(e.clientY-r.top)/r.height-.5;
      stage.style.setProperty('--tiltX', (-y*2.2)+'deg');
      stage.style.setProperty('--tiltY', (x*2.2)+'deg');
    });
  });
})();
