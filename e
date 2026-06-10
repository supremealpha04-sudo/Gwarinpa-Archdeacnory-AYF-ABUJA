<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
  <title>Gwarimpa Archdeaconry | AYF Conference 2026</title>
  <meta name="theme-color" content="#0A2E73">
  <meta name="description" content="Official Conference Registration for AYF Gwarimpa Archdeaconry - If God Be For Us">
  
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
  <!-- QR Code Library -->
  <script src="https://cdn.jsdelivr.net/npm/qrcodejs@1.0.0/qrcode.min.js"></script>
  <!-- HTML5 QR Scanner -->
  <script src="https://unpkg.com/html5-qrcode@2.3.8/html5-qrcode.min.js"></script>
  <!-- Supabase -->
  <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
  
  <style>
    * { font-family: 'Inter', system-ui, -apple-system, sans-serif; }
    .glass-card {
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(12px);
      border: 1px solid rgba(212, 175, 55, 0.3);
      border-radius: 1.5rem;
      transition: all 0.3s ease;
    }
    .dark .glass-card {
      background: rgba(10, 46, 115, 0.75);
      border-color: rgba(212, 175, 55, 0.5);
    }
    .glass-card:hover { transform: translateY(-2px); box-shadow: 0 12px 24px rgba(0,0,0,0.1); }
    .bottom-nav-active { color: #D4AF37; border-bottom: 2px solid #D4AF37; }
    @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
    @keyframes slideIn { from { transform: translateX(100%); } to { transform: translateX(0); } }
    .animate-fadeIn { animation: fadeIn 0.3s ease-out; }
    .animate-slideIn { animation: slideIn 0.3s ease-out; }
    .notification-badge {
      position: absolute; top: -5px; right: -5px; background: #ef4444; color: white;
      border-radius: 50%; width: 18px; height: 18px; font-size: 10px;
      display: flex; align-items: center; justify-content: center;
    }
    .loader {
      border: 3px solid #f3f3f3; border-top: 3px solid #D4AF37;
      border-radius: 50%; width: 40px; height: 40px; animation: spin 1s linear infinite;
    }
    @keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
    .modern-toast {
      position: fixed; bottom: 80px; left: 50%; transform: translateX(-50%);
      background: #1f2937; color: white; padding: 12px 24px; border-radius: 50px;
      z-index: 1000; animation: slideIn 0.3s ease-out; box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }
    .post-card { transition: all 0.2s ease; }
    .post-card:hover { transform: translateY(-2px); }
    .countdown-timer { font-family: 'Courier New', monospace; font-weight: bold; }
    input:focus, select:focus, textarea:focus { outline: none; ring: 2px solid #D4AF37; }
  </style>
  
  <script>
    tailwind.config = {
      darkMode: 'class',
      theme: {
        extend: { colors: { royal: '#0A2E73', gold: '#D4AF37' } }
      }
    }
  </script>
</head>
<body class="bg-gray-100 dark:bg-gray-900 text-gray-800 dark:text-white transition-all">

<div id="root" class="relative">
  <!-- Header -->
  <header class="sticky top-0 z-30 bg-white/80 dark:bg-gray-800/80 backdrop-blur-md border-b border-gold/20 shadow-sm">
    <div class="flex justify-between items-center px-4 py-3 max-w-7xl mx-auto">
      <div class="flex items-center gap-2">
        <i class="fas fa-church text-royal dark:text-gold text-2xl"></i>
        <div><h1 class="font-bold text-lg">AYF Gwarimpa</h1><p class="text-xs text-gold">Archdeaconry Conference 2026</p></div>
      </div>
      <div class="flex gap-3">
        <button id="darkModeToggle" class="text-royal dark:text-gold text-xl"><i class="fas fa-moon"></i></button>
        <button id="notificationsBtn" class="text-royal dark:text-gold text-xl relative"><i class="fas fa-bell"></i><span id="notificationCount" class="notification-badge hidden">0</span></button>
        <div class="relative">
          <button id="profileMenuBtn" class="text-royal dark:text-gold text-xl"><i class="fas fa-user-circle"></i></button>
          <div id="profileDropdown" class="hidden absolute right-0 mt-2 w-48 glass-card shadow-lg z-50">
            <a href="#" id="settingsLink" class="block px-4 py-2 hover:bg-gold/20"><i class="fas fa-cog"></i> Profile Settings</a>
            <a href="#" id="termsLink" class="block px-4 py-2 hover:bg-gold/20"><i class="fas fa-file-contract"></i> Terms & Conditions</a>
            <a href="#" id="privacyLink" class="block px-4 py-2 hover:bg-gold/20"><i class="fas fa-shield-alt"></i> Privacy Policy</a>
            <hr class="my-1 border-gold/30">
            <button id="logoutBtnDropdown" class="w-full text-left px-4 py-2 text-red-500 hover:bg-red-50 dark:hover:bg-red-900/30"><i class="fas fa-sign-out-alt"></i> Logout</button>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <main id="appContainer" class="max-w-7xl mx-auto px-4 py-6"><div class="flex justify-center items-center min-h-[60vh]"><div class="loader"></div></div></main>

  <!-- Bottom Navigation -->
  <nav class="fixed bottom-0 left-0 right-0 bg-white/90 dark:bg-gray-800/90 backdrop-blur-md border-t border-gold/30 z-40 lg:hidden">
    <div class="flex justify-around py-2">
      <button data-nav="home" class="nav-btn flex flex-col items-center text-gray-500 dark:text-gray-400 text-xs"><i class="fas fa-home text-xl"></i><span>Home</span></button>
      <button data-nav="conference" class="nav-btn flex flex-col items-center text-gray-500 dark:text-gray-400 text-xs"><i class="fas fa-calendar-alt text-xl"></i><span>Conference</span></button>
      <button data-nav="resources" class="nav-btn flex flex-col items-center text-gray-500 dark:text-gray-400 text-xs"><i class="fas fa-folder-open text-xl"></i><span>Resources</span></button>
      <button data-nav="community" class="nav-btn flex flex-col items-center text-gray-500 dark:text-gray-400 text-xs"><i class="fas fa-users text-xl"></i><span>Community</span></button>
      <button data-nav="profile" class="nav-btn flex flex-col items-center text-gray-500 dark:text-gray-400 text-xs"><i class="fas fa-user-circle text-xl"></i><span>Profile</span></button>
      <button data-nav="admin" class="admin-only-nav nav-btn flex flex-col items-center text-gray-500 dark:text-gray-400 text-xs hidden"><i class="fas fa-shield-alt text-xl"></i><span>Admin</span></button>
    </div>
  </nav>
</div>

<script>
// =====================================================
// SUPABASE INITIALIZATION
// =====================================================
const SUPABASE_URL = 'https://haxebhwcudkclyxsjaqx.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhheGViaHdjdWRrY2x5eHNqYXF4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODExMDcyMjksImV4cCI6MjA5NjY4MzIyOX0.Iwu6NPRvnJtnfL4D_N2slvKOUidQ1UdLbUPG-4QCuM4';
const supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// =====================================================
// GLOBAL STATE
// =====================================================
const AppState = {
  currentUser: null, currentProfile: null, currentView: 'home',
  darkMode: localStorage.getItem('darkMode') === 'true',
  realtimeSubscriptions: [], analyticsChart: null
};

// =====================================================
// HELPER FUNCTIONS
// =====================================================
function showToast(message, type = 'success') {
  const toast = document.createElement('div');
  toast.className = `modern-toast ${type === 'error' ? 'bg-red-500' : 'bg-green-500'}`;
  toast.innerHTML = `<i class="fas ${type === 'error' ? 'fa-exclamation-circle' : 'fa-check-circle'} mr-2"></i>${message}`;
  document.body.appendChild(toast);
  setTimeout(() => toast.remove(), 3000);
}

function applyDarkMode() {
  if (AppState.darkMode) document.documentElement.classList.add('dark');
  else document.documentElement.classList.remove('dark');
  localStorage.setItem('darkMode', AppState.darkMode);
}
applyDarkMode();

async function checkUserPermissions(requiredRole) {
  if (!AppState.currentProfile) return false;
  const hierarchy = { super_admin: 5, archdeaconry_admin: 4, conference_admin: 3, moderator: 2, member: 1 };
  return (hierarchy[AppState.currentProfile.role] || 0) >= (hierarchy[requiredRole] || 0);
}

async function loadNotifications() {
  if (!AppState.currentUser) return;
  const { data } = await supabase.from('notifications').select('*').eq('user_id', AppState.currentUser.id).eq('read', false);
  const count = data?.length || 0;
  const badge = document.getElementById('notificationCount');
  if (badge) {
    if (count > 0) { badge.classList.remove('hidden'); badge.textContent = count > 9 ? '9+' : count; }
    else badge.classList.add('hidden');
  }
  return data || [];
}

// =====================================================
// TERMS AND PRIVACY
// =====================================================
function showTermsAndConditions() {
  const modal = document.createElement('div');
  modal.className = 'fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4 overflow-y-auto';
  modal.innerHTML = `<div class="glass-card p-6 w-full max-w-2xl max-h-[80vh] overflow-y-auto animate-fadeIn"><h2 class="text-2xl font-bold mb-4 text-gold">Terms & Conditions</h2><div class="space-y-4 text-sm"><p><strong>1. Conference Registration</strong><br>By registering, you agree to provide accurate information. Registration is subject to approval.</p><p><strong>2. Code of Conduct</strong><br>All attendees must behave respectfully. Disruptive behavior will result in dismissal.</p><p><strong>3. Media Consent</strong><br>By attending, you consent to photography and video recording for promotional purposes.</p><p><strong>4. Data Collection</strong><br>Your personal information is for registration only and not shared with third parties.</p><p><strong>5. Liability Waiver</strong><br>Organizers are not liable for any loss, damage, or injury during the conference.</p><p><strong>6. Cancellation Policy</strong><br>Registrations are non-refundable but can be transferred with prior notice.</p><p><strong>7. Amendments</strong><br>Organizers reserve the right to modify the program.</p><p class="mt-4 text-gold"><i class="fas fa-check-circle"></i> By accepting, you agree to all terms.</p></div><button id="closeTermsBtn" class="mt-6 w-full bg-gold text-royal py-2 rounded-xl font-bold">Close</button></div>`;
  document.body.appendChild(modal);
  document.getElementById('closeTermsBtn').onclick = () => modal.remove();
}

function showPrivacyPolicy() {
  const modal = document.createElement('div');
  modal.className = 'fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4 overflow-y-auto';
  modal.innerHTML = `<div class="glass-card p-6 w-full max-w-2xl max-h-[80vh] overflow-y-auto animate-fadeIn"><h2 class="text-2xl font-bold mb-4 text-gold">Privacy Policy</h2><div class="space-y-4 text-sm"><p><strong>Information We Collect</strong><br>Name, email, phone, parish, gender, age range, AYF position for conference registration.</p><p><strong>How We Use Your Information</strong><br>Process registration, generate Conference ID and QR code, communicate updates, track attendance.</p><p><strong>Data Protection</strong><br>Data stored securely on Supabase with industry-standard encryption.</p><p><strong>Data Sharing</strong><br>We do not sell or trade your personal information.</p><p><strong>Your Rights</strong><br>You have the right to access, correct, or request deletion of your data.</p><p><strong>Contact</strong><br>For privacy concerns, contact the Archdeaconry office.</p></div><button id="closePrivacyBtn" class="mt-6 w-full bg-gold text-royal py-2 rounded-xl font-bold">Close</button></div>`;
  document.body.appendChild(modal);
  document.getElementById('closePrivacyBtn').onclick = () => modal.remove();
}

// =====================================================
// REGISTRATION FORM (WITH TERMS CHECKBOX)
// =====================================================
async function showFullRegistrationForm() {
  const { data: parishes } = await supabase.from('parishes').select('name');
  const formHtml = `<div class="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4 overflow-y-auto"><div class="glass-card p-6 w-full max-w-2xl max-h-[90vh] overflow-y-auto"><div class="text-center mb-6"><i class="fas fa-registered text-royal text-4xl"></i><h2 class="text-2xl font-bold mt-2">Conference Registration</h2><p class="text-gold font-semibold">AYF Gwarimpa Archdeaconry Conference 2026</p><p class="text-sm text-gray-600 dark:text-gray-400 mt-1">27th April, 2026 | St. Philip Church, Gwarimpa</p></div><form id="fullRegistrationForm" class="space-y-4"><div><label class="block text-sm font-medium mb-1">Full Name *</label><input type="text" id="regFullName" required class="w-full p-3 rounded-xl border dark:bg-gray-800"></div><div><label class="block text-sm font-medium mb-1">Email Address *</label><input type="email" id="regEmail" required class="w-full p-3 rounded-xl border dark:bg-gray-800"></div><div><label class="block text-sm font-medium mb-1">Password *</label><input type="password" id="regPassword" required minlength="6" class="w-full p-3 rounded-xl border dark:bg-gray-800"></div><div><label class="block text-sm font-medium mb-1">Phone Number *</label><input type="tel" id="regPhone" required class="w-full p-3 rounded-xl border dark:bg-gray-800"></div><div><label class="block text-sm font-medium mb-1">Gender *</label><select id="regGender" required class="w-full p-3 rounded-xl border dark:bg-gray-800"><option value="">Select</option><option>Male</option><option>Female</option></select></div><div><label class="block text-sm font-medium mb-1">Age Range *</label><select id="regAgeRange" required class="w-full p-3 rounded-xl border dark:bg-gray-800"><option value="">Select</option><option>13-17</option><option>18-25</option><option>26-35</option><option>36-45</option><option>46+</option></select></div><div><label class="block text-sm font-medium mb-1">Parish *</label><select id="regParish" required class="w-full p-3 rounded-xl border dark:bg-gray-800"><option value="">Select Parish</option>${parishes?.map(p => `<option value="${p.name}">${p.name}</option>`).join('')}</select></div><div><label class="block text-sm font-medium mb-1">AYF Position *</label><input type="text" id="regPosition" placeholder="e.g., Member, Executive" required class="w-full p-3 rounded-xl border dark:bg-gray-800"></div><div class="flex items-start gap-2"><input type="checkbox" id="acceptTerms" required class="mt-1"><label class="text-sm">I accept the <a href="#" id="viewTermsLink" class="text-gold hover:underline">Terms & Conditions</a> and <a href="#" id="viewPrivacyLink" class="text-gold hover:underline">Privacy Policy</a> *</label></div><div class="flex gap-3 pt-4"><button type="submit" class="flex-1 bg-gold text-royal py-3 rounded-xl font-bold">Register</button><button type="button" id="cancelRegistration" class="flex-1 border border-gray-300 py-3 rounded-xl">Cancel</button></div></form><div class="mt-4 text-center"><p class="text-xs">Already registered? <a href="#" id="switchToLogin" class="text-gold hover:underline">Login here</a></p></div></div></div>`;
  document.body.insertAdjacentHTML('beforeend', formHtml);
  
  document.getElementById('viewTermsLink').onclick = (e) => { e.preventDefault(); showTermsAndConditions(); };
  document.getElementById('viewPrivacyLink').onclick = (e) => { e.preventDefault(); showPrivacyPolicy(); };
  document.getElementById('fullRegistrationForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    if (!document.getElementById('acceptTerms').checked) { showToast("Accept terms & privacy policy", "error"); return; }
    const btn = e.target.querySelector('button[type="submit"]');
    btn.textContent = "Creating..."; btn.disabled = true;
    try {
      const { data: authData, error: authError } = await supabase.auth.signUp({
        email: document.getElementById('regEmail').value,
        password: document.getElementById('regPassword').value,
        options: { data: { full_name: document.getElementById('regFullName').value } }
      });
      if (authError) throw new Error(authError.message);
      await supabase.from('profiles').insert([{
        id: authData.user.id, full_name: document.getElementById('regFullName').value,
        phone: document.getElementById('regPhone').value, gender: document.getElementById('regGender').value,
        age_range: document.getElementById('regAgeRange').value, parish: document.getElementById('regParish').value,
        ayf_position: document.getElementById('regPosition').value, role: 'member',
        avatar_url: `https://ui-avatars.com/api/?name=${encodeURIComponent(document.getElementById('regFullName').value)}&background=0A2E73&color=fff`
      }]);
      await supabase.from('registrations').insert({ user_id: authData.user.id, status: 'pending' });
      showToast("Registration successful! Check your email to confirm.", "success");
      document.querySelector('.fixed.bg-black\\/50').remove();
      renderAuth();
    } catch (error) { showToast(error.message, "error"); btn.textContent = "Register"; btn.disabled = false; }
  });
  document.getElementById('cancelRegistration').onclick = () => { document.querySelector('.fixed.bg-black\\/50').remove(); renderAuth(); };
  document.getElementById('switchToLogin').onclick = (e) => { e.preventDefault(); document.querySelector('.fixed.bg-black\\/50').remove(); renderAuth(); };
}

// =====================================================
// AUTHENTICATION
// =====================================================
async function renderAuth() {
  document.getElementById('appContainer').innerHTML = `<div class="flex items-center justify-center min-h-[80vh]"><div class="glass-card p-8 w-full max-w-md animate-fadeIn"><div class="text-center mb-8"><i class="fas fa-church text-royal text-5xl mb-3"></i><h2 class="text-3xl font-bold text-royal dark:text-gold">AYF Gwarimpa</h2><p class="text-gold font-bold mt-1">If God Be For Us</p><p class="text-gray-500 text-sm mt-2">Archdeaconry Conference 2026</p></div><div id="authError" class="hidden bg-red-100 border border-red-400 text-red-700 px-4 py-2 rounded-lg mb-4"></div><form id="loginForm"><div class="mb-4"><input type="email" id="email" placeholder="Email Address" required class="w-full p-3 rounded-xl border dark:bg-gray-800"></div><div class="mb-6"><input type="password" id="password" placeholder="Password" required class="w-full p-3 rounded-xl border dark:bg-gray-800"></div><button type="submit" class="w-full bg-royal hover:bg-royal/90 text-white py-3 rounded-xl font-semibold">Sign In</button></form><div class="relative my-6"><div class="absolute inset-0 flex items-center"><div class="w-full border-t border-gray-300"></div></div><div class="relative flex justify-center text-sm"><span class="px-2 bg-white dark:bg-gray-900 text-gray-500">Or</span></div></div><button id="googleBtn" class="w-full border border-gold/50 rounded-xl py-3 flex justify-center gap-3 hover:bg-gold/10"><i class="fab fa-google text-gold"></i> Google Login</button><div class="text-center mt-6"><a href="#" id="showRegisterLink" class="text-gold hover:underline block font-semibold">📝 Register for Conference →</a><a href="#" id="resetLink" class="text-royal dark:text-gold/70 text-sm hover:underline block mt-2">Forgot Password?</a></div></div></div>`;
  document.getElementById('loginForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const { error } = await supabase.auth.signInWithPassword({ email: document.getElementById('email').value, password: document.getElementById('password').value });
    if (error) { document.getElementById('authError').textContent = error.message; document.getElementById('authError').classList.remove('hidden'); }
    else checkUser();
  });
  document.getElementById('googleBtn').onclick = async () => { await supabase.auth.signInWithOAuth({ provider: 'google', options: { redirectTo: window.location.origin } }); };
  document.getElementById('showRegisterLink').onclick = async (e) => { e.preventDefault(); await showFullRegistrationForm(); };
  document.getElementById('resetLink').onclick = async (e) => { e.preventDefault(); const email = prompt("Enter your email:"); if(email){ await supabase.auth.resetPasswordForEmail(email); showToast("Reset link sent!", "success"); } };
}

async function checkUser() {
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) { renderAuth(); return; }
  AppState.currentUser = user;
  let { data: profile } = await supabase.from('profiles').select('*').eq('id', user.id).single();
  if (!profile) { await showFullRegistrationForm(); return; }
  AppState.currentProfile = profile;
  const isAdmin = await checkUserPermissions('moderator');
  document.querySelector('.admin-only-nav')?.classList.toggle('hidden', !isAdmin);
  await loadNotifications();
  setupRealtime();
  renderMainView();
}

function setupRealtime() {
  AppState.realtimeSubscriptions.forEach(sub => supabase.removeChannel(sub));
  AppState.realtimeSubscriptions = [];
  const postsChannel = supabase.channel('public-posts').on('postgres_changes', { event: '*', schema: 'public', table: 'posts' }, () => { if (AppState.currentView === 'home' || AppState.currentView === 'community') renderMainView(); }).subscribe();
  const notificationsChannel = supabase.channel('public-notifications').on('postgres_changes', { event: 'INSERT', schema: 'public', table: 'notifications', filter: `user_id=eq.${AppState.currentUser.id}` }, () => loadNotifications()).subscribe();
  AppState.realtimeSubscriptions = [postsChannel, notificationsChannel];
}

function getCountdown() {
  const target = new Date(2026, 3, 27, 0, 0, 0);
  const diff = target - new Date();
  if (diff <= 0) return { days: 0, hours: 0, minutes: 0, seconds: 0 };
  return { days: Math.floor(diff / 86400000), hours: Math.floor((diff % 86400000) / 3600000), minutes: Math.floor((diff % 3600000) / 60000), seconds: Math.floor((diff % 60000) / 1000) };
}

// =====================================================
// HOME FEED
// =====================================================
async function renderHomeFeed(container) {
  const { data: posts } = await supabase.from('posts').select(`*, profiles(full_name, avatar_url, role)`).order('created_at', { ascending: false });
  const { data: reg } = await supabase.from('registrations').select('conference_id, status').eq('user_id', AppState.currentUser.id).single();
  const cd = getCountdown();
  container.innerHTML = `<div class="glass-card p-6 mb-6 bg-gradient-to-r from-royal/20 via-gold/10 to-royal/20"><div class="text-center"><h2 class="text-3xl font-bold text-royal dark:text-gold mb-2">If God Be For Us</h2><p class="text-sm">AYF Gwarimpa Archdeaconry Conference 2026</p><div class="mt-4 grid grid-cols-4 gap-2 max-w-md mx-auto"><div class="bg-white/50 dark:bg-gray-800/50 rounded-lg p-2"><div class="text-2xl font-bold text-gold">${cd.days}</div><div class="text-xs">Days</div></div><div class="bg-white/50 dark:bg-gray-800/50 rounded-lg p-2"><div class="text-2xl font-bold text-gold">${cd.hours}</div><div class="text-xs">Hours</div></div><div class="bg-white/50 dark:bg-gray-800/50 rounded-lg p-2"><div class="text-2xl font-bold text-gold">${cd.minutes}</div><div class="text-xs">Mins</div></div><div class="bg-white/50 dark:bg-gray-800/50 rounded-lg p-2"><div class="text-2xl font-bold text-gold">${cd.seconds}</div><div class="text-xs">Secs</div></div></div><div class="mt-3"><p class="text-sm"><i class="fas fa-map-marker-alt text-gold"></i> St. Philip Church, Gwarimpa | 📅 27th April, 2026</p></div><div class="mt-2"><span class="px-3 py-1 rounded-full text-xs ${reg?.status === 'approved' ? 'bg-green-500/20 text-green-600' : 'bg-yellow-500/20 text-yellow-600'}"><i class="fas ${reg?.status === 'approved' ? 'fa-check-circle' : 'fa-clock'}"></i> ${reg?.status === 'approved' ? 'ID: ' + reg.conference_id : 'Pending Approval'}</span></div></div></div><button id="createPostBtn" class="w-full glass-card p-4 mb-6 text-left font-semibold flex items-center gap-3"><i class="fas fa-pen-alt text-gold text-xl"></i> <span>What's on your mind?</span></button><div id="postsFeed" class="space-y-4">${posts?.map(post => `<div class="glass-card p-5 post-card animate-fadeIn"><div class="flex gap-3 mb-3"><img src="${post.profiles.avatar_url}" class="w-12 h-12 rounded-full"><div><b>${post.profiles.full_name}</b>${post.profiles.role === 'super_admin' ? '<span class="text-xs bg-gold/20 px-2 py-0.5 rounded-full ml-2">Admin</span>' : ''}<p class="text-xs text-gray-500">${new Date(post.created_at).toLocaleString()}</p></div></div><p class="text-gray-700 dark:text-gray-300 mb-3">${post.content}</p><div class="flex gap-6 pt-3 border-t"><button data-like="${post.id}" class="like-btn flex items-center gap-2 hover:text-gold"><i class="far fa-heart"></i> ${post.likes_count || 0}</button><button data-comment="${post.id}" class="comment-toggle flex items-center gap-2 hover:text-gold"><i class="far fa-comment"></i> ${post.comments_count || 0}</button></div><div id="comments-${post.id}" class="hidden mt-4 pt-3 border-t"><div id="commentList-${post.id}" class="mb-3"></div><div class="flex gap-2"><input type="text" id="commentInput-${post.id}" placeholder="Write a comment..." class="flex-1 p-2 rounded-xl border"><button data-comment-post="${post.id}" class="submit-comment bg-royal text-white px-4 py-2 rounded-xl">Post</button></div></div></div>`).join('') || '<div class="glass-card p-12 text-center"><i class="fas fa-newspaper text-5xl text-gray-400 mb-3"></i><p>No posts yet. Be the first!</p></div>'}</div>`;
  document.getElementById('createPostBtn')?.addEventListener('click', () => { const c = prompt("Share your thoughts:"); if(c) supabase.from('posts').insert([{ user_id: AppState.currentUser.id, content: c }]).then(() => { showToast("Posted!", "success"); renderMainView(); }); });
  document.querySelectorAll('.like-btn').forEach(btn => btn.onclick = async () => { await supabase.from('likes').insert([{ user_id: AppState.currentUser.id, post_id: btn.dataset.like }]); renderMainView(); });
  document.querySelectorAll('.comment-toggle').forEach(btn => btn.onclick = async () => {
    const pid = btn.dataset.comment; const div = document.getElementById(`comments-${pid}`);
    if (div.classList.contains('hidden')) {
      div.classList.remove('hidden');
      const { data: comments } = await supabase.from('comments').select('*, profiles(full_name)').eq('post_id', pid);
      document.getElementById(`commentList-${pid}`).innerHTML = comments?.map(c => `<div class="flex gap-2 mb-2"><div><b class="text-sm">${c.profiles.full_name}</b><p class="text-sm">${c.content}</p></div></div>`).join('') || '<p>No comments</p>';
    } else div.classList.add('hidden');
  });
  document.querySelectorAll('.submit-comment').forEach(btn => btn.onclick = async () => {
    const pid = btn.dataset.commentPost; const input = document.getElementById(`commentInput-${pid}`);
    if (input.value) { await supabase.from('comments').insert([{ post_id: pid, user_id: AppState.currentUser.id, content: input.value }]); input.value = ''; renderMainView(); showToast("Comment added!", "success"); }
  });
  setTimeout(() => renderHomeFeed(container), 1000);
}

// =====================================================
// CONFERENCE MODULE (Updated for April 27, One-Day)
// =====================================================
async function renderConferenceModule(container) {
  const { data: reg } = await supabase.from('registrations').select('*').eq('user_id', AppState.currentUser.id).single();
  const cd = getCountdown();
  container.innerHTML = `<div class="space-y-5"><div class="glass-card p-6 text-center"><h2 class="text-3xl font-bold text-royal dark:text-gold">If God Be For Us</h2><p class="text-gold font-semibold">AYF Gwarimpa Archdeaconry Conference 2026</p><div class="mt-4 grid grid-cols-4 gap-2 max-w-sm mx-auto"><div class="bg-white/50 dark:bg-gray-800/50 rounded-lg p-2"><div class="text-2xl font-bold text-gold">${cd.days}</div><div class="text-xs">Days</div></div><div class="bg-white/50 dark:bg-gray-800/50 rounded-lg p-2"><div class="text-2xl font-bold text-gold">${cd.hours}</div><div class="text-xs">Hours</div></div><div class="bg-white/50 dark:bg-gray-800/50 rounded-lg p-2"><div class="text-2xl font-bold text-gold">${cd.minutes}</div><div class="text-xs">Mins</div></div><div class="bg-white/50 dark:bg-gray-800/50 rounded-lg p-2"><div class="text-2xl font-bold text-gold">${cd.seconds}</div><div class="text-xs">Secs</div></div></div><p class="mt-3"><i class="fas fa-calendar-alt text-gold"></i> 27th April, 2026 | <i class="fas fa-map-marker-alt text-gold"></i> St. Philip Church, Gwarimpa</p></div><div class="glass-card p-5 text-center"><h3 class="font-bold text-xl mb-3"><i class="fas fa-ticket-alt text-gold"></i> Your Conference Pass</h3><div id="qrContainer" class="flex justify-center mb-3"></div><p class="font-mono font-bold text-lg">${reg?.conference_id || 'Pending'}</p><p class="text-sm">Status: ${reg?.status === 'approved' ? '✅ Approved' : '⏳ Pending'}</p></div><div class="glass-card p-5"><h3 class="font-bold text-xl mb-3"><i class="fas fa-chalkboard-user"></i> Conference Speakers</h3><div class="space-y-2"><div class="flex justify-between"><span>👨‍🏫 Youth President</span><span class="text-gold">Bro. Michael Adeyemi</span></div><div class="flex justify-between"><span>🎤 Preacher</span><span class="text-gold">Ven. Dr. Emmanuel Okafor</span></div><div class="flex justify-between"><span>📝 General Secretary</span><span class="text-gold">Sis. Grace Okonkwo</span></div><div class="flex justify-between"><span>👥 Vice President 1</span><span class="text-gold">Bro. David Peter</span></div><div class="flex justify-between"><span>👥 Vice President 2</span><span class="text-gold">Sis. Esther John</span></div></div></div><div class="glass-card p-5"><h3 class="font-bold text-xl mb-3"><i class="fas fa-clock"></i> Program Schedule (One Day)</h3><div class="space-y-2"><div class="flex justify-between"><span>8:00 AM</span><span>Registration & Arrival</span></div><div class="flex justify-between"><span>9:00 AM</span><span>Opening Prayer & Worship</span></div><div class="flex justify-between"><span>10:00 AM</span><span>Keynote Address: "If God Be For Us"</span></div><div class="flex justify-between"><span>12:00 PM</span><span>Workshop Sessions</span></div><div class="flex justify-between"><span>1:30 PM</span><span>Lunch Break</span></div><div class="flex justify-between"><span>2:30 PM</span><span>Panel Discussion</span></div><div class="flex justify-between"><span>4:00 PM</span><span>Holy Communion Service</span></div><div class="flex justify-between"><span>6:00 PM</span><span>Closing & Awards</span></div></div></div></div>`;
  if (reg && document.getElementById('qrContainer') && reg.conference_id) new QRCode(document.getElementById('qrContainer'), { text: reg.conference_id, width: 150, height: 150 });
}

// =====================================================
// RESOURCES/DOCUMENTS
// =====================================================
async function renderDocumentCenter(container) {
  const { data: docs } = await supabase.from('documents').select('*').order('created_at', { ascending: false });
  container.innerHTML = `<div class="glass-card p-5 mb-5"><h2 class="text-2xl font-bold mb-3"><i class="fas fa-folder-open text-gold"></i> Resource Center</h2><input type="text" id="searchDocs" placeholder="Search..." class="w-full p-3 rounded-xl border"></div><div class="grid gap-3 md:grid-cols-2">${docs?.map(d => `<div class="glass-card p-4"><div class="flex gap-3"><div class="text-3xl"><i class="fas fa-file-pdf text-red-500"></i></div><div><h3 class="font-bold">${d.title}</h3><div class="flex gap-3 text-xs"><span>👁️ ${d.views || 0}</span><span>⬇️ ${d.downloads || 0}</span></div></div><button data-doc="${d.id}" class="downloadDoc ml-auto bg-gold/20 p-2 rounded-xl"><i class="fas fa-download"></i></button></div></div>`).join('') || '<div class="glass-card p-8 text-center"><i class="fas fa-file-alt text-4xl mb-2"></i><p>No documents</p></div>'}</div>`;
  document.querySelectorAll('.downloadDoc').forEach(btn => btn.onclick = () => showToast("Download started", "success"));
}

// =====================================================
// COMMUNITY
// =====================================================
async function renderCommunityModule(container) {
  const { data: discussions } = await supabase.from('posts').select('*, profiles(full_name, avatar_url)').order('created_at', { ascending: false });
  container.innerHTML = `<div class="glass-card p-5 mb-5"><h2 class="text-2xl font-bold"><i class="fas fa-users text-gold"></i> AYF Community</h2><p>Connect, share, and grow together</p></div><div class="glass-card p-4 mb-5"><textarea id="discussionInput" rows="3" placeholder="Start a discussion..." class="w-full p-3 rounded-xl border"></textarea><button id="postDiscussion" class="mt-3 bg-royal text-white px-6 py-2 rounded-xl w-full">Post</button></div><div class="space-y-4">${discussions?.map(d => `<div class="glass-card p-4"><div class="flex gap-3"><img src="${d.profiles.avatar_url}" class="w-10 h-10 rounded-full"><div><b>${d.profiles.full_name}</b><p class="text-xs">${new Date(d.created_at).toLocaleString()}</p></div></div><p class="mt-2">${d.content}</p></div>`).join('') || '<div class="glass-card p-8 text-center"><i class="fas fa-comments text-4xl"></i><p>No discussions yet</p></div>'}</div>`;
  document.getElementById('postDiscussion')?.addEventListener('click', async () => {
    const c = document.getElementById('discussionInput').value;
    if (c) { await supabase.from('posts').insert([{ user_id: AppState.currentUser.id, content: c }]); document.getElementById('discussionInput').value = ''; renderMainView(); showToast("Posted!", "success"); }
  });
}

// =====================================================
// PROFILE PAGE
// =====================================================
async function renderProfilePage(container) {
  const { data: reg } = await supabase.from('registrations').select('*').eq('user_id', AppState.currentUser.id).single();
  const { data: userPosts, count: postsCount } = await supabase.from('posts').select('*', { count: 'exact' }).eq('user_id', AppState.currentUser.id);
  container.innerHTML = `<div class="glass-card p-6 text-center mb-5"><img src="${AppState.currentProfile.avatar_url}" class="w-28 h-28 rounded-full mx-auto border-4 border-gold mb-3"><h2 class="text-2xl font-bold">${AppState.currentProfile.full_name}</h2><p class="text-gold font-mono">${reg?.conference_id || 'Pending'}</p><p>${AppState.currentProfile.parish} | ${AppState.currentProfile.ayf_position}</p><div class="grid grid-cols-3 gap-3 mt-5"><div class="bg-royal/10 p-2 rounded"><div class="font-bold text-xl">${postsCount || 0}</div><div>Posts</div></div><div class="bg-royal/10 p-2 rounded"><div class="font-bold text-xl">${reg?.check_in_count || 0}</div><div>Check-ins</div></div><div class="bg-royal/10 p-2 rounded"><div class="font-bold text-xl">${AppState.currentProfile.role}</div><div>Role</div></div></div></div><button id="settingsBtn" class="w-full glass-card p-4 mb-3 text-left"><i class="fas fa-user-edit text-gold mr-2"></i> Profile Settings</button><button id="termsBtn" class="w-full glass-card p-4 mb-3 text-left"><i class="fas fa-file-contract text-gold mr-2"></i> Terms & Conditions</button><button id="privacyBtn" class="w-full glass-card p-4 mb-3 text-left"><i class="fas fa-shield-alt text-gold mr-2"></i> Privacy Policy</button>`;
  document.getElementById('settingsBtn').onclick = () => showToast("Profile settings coming soon!", "success");
  document.getElementById('termsBtn').onclick = () => showTermsAndConditions();
  document.getElementById('privacyBtn').onclick = () => showPrivacyPolicy();
}

// =====================================================
// ADMIN PANEL
// =====================================================
async function renderAdminPanel(container) {
  if (!await checkUserPermissions('moderator')) { AppState.currentView = 'home'; renderMainView(); return; }
  const { count: totalUsers } = await supabase.from('profiles').select('*', { count: 'exact' });
  const { count: totalRegistrations } = await supabase.from('registrations').select('*', { count: 'exact' });
  const { data: parishData } = await supabase.from('profiles').select('parish');
  const parishCounts = parishData?.reduce((a, p) => { if(p.parish) a[p.parish] = (a[p.parish] || 0) + 1; return a; }, {});
  container.innerHTML = `<div class="mb-4"><button id="backToUser" class="glass-card px-4 py-2"><i class="fas fa-arrow-left"></i> Back</button></div><div class="grid lg:grid-cols-4 gap-4"><div class="lg:col-span-1"><div class="glass-card p-4"><h3 class="font-bold mb-3 text-gold"><i class="fas fa-shield-alt"></i> Admin</h3><div class="space-y-2"><button data-admin-tab="dashboard" class="admin-tab w-full text-left p-2 rounded hover:bg-gold/20">📊 Dashboard</button><button data-admin-tab="registrations" class="admin-tab w-full text-left p-2 rounded hover:bg-gold/20">✅ Approve</button><button data-admin-tab="qr-scanner" class="admin-tab w-full text-left p-2 rounded hover:bg-gold/20">📷 QR Scanner</button><button data-admin-tab="announcements" class="admin-tab w-full text-left p-2 rounded hover:bg-gold/20">📢 Announce</button></div></div></div><div class="lg:col-span-3" id="adminContent"><div class="glass-card p-5"><h2 class="text-2xl font-bold mb-4">Dashboard</h2><div class="grid grid-cols-3 gap-4 mb-6"><div class="bg-gradient-to-br from-royal/20 to-gold/20 p-4 rounded-xl text-center"><div class="text-3xl font-bold text-gold">${totalUsers || 0}</div><div>Users</div></div><div class="bg-gradient-to-br from-royal/20 to-gold/20 p-4 rounded-xl text-center"><div class="text-3xl font-bold text-gold">${totalRegistrations || 0}</div><div>Registrations</div></div><div class="bg-gradient-to-br from-royal/20 to-gold/20 p-4 rounded-xl text-center"><div class="text-3xl font-bold text-gold">${Object.keys(parishCounts || {}).length}</div><div>Parishes</div></div></div><canvas id="adminChart" height="200"></canvas></div></div></div>`;
  const ctx = document.getElementById('adminChart')?.getContext('2d');
  if (ctx) { if (AppState.analyticsChart) AppState.analyticsChart.destroy(); AppState.analyticsChart = new Chart(ctx, { type: 'bar', data: { labels: Object.keys(parishCounts || {}), datasets: [{ label: 'Registrations by Parish', data: Object.values(parishCounts || {}), backgroundColor: '#D4AF37' }] } }); }
  document.querySelectorAll('.admin-tab').forEach(btn => btn.onclick = async () => {
    const tab = btn.dataset.adminTab, ac = document.getElementById('adminContent');
    if (tab === 'qr-scanner') {
      ac.innerHTML = `<div class="glass-card p-5"><h3>QR Scanner</h3><div id="qr-reader" style="width:100%;max-width:500px"></div><div id="scanResult"></div></div>`;
      const scanner = new Html5Qrcode("qr-reader");
      scanner.start({ facingMode: "environment" }, { fps: 10, qrbox: 250 }, async (text) => { await supabase.from('attendance_logs').insert([{ user_id: AppState.currentUser.id, conference_id: text, checked_by: AppState.currentUser.id }]); document.getElementById('scanResult').innerHTML = `<div class="bg-green-500 text-white p-3 rounded text-center mt-3">✅ Checked in: ${text}</div>`; showToast("User checked in!", "success"); });
    } else if (tab === 'registrations') {
      const { data: pending } = await supabase.from('registrations').select('*, profiles(full_name, email, parish)').eq('status', 'pending');
      ac.innerHTML = `<div class="glass-card p-5"><h3>Pending (${pending?.length || 0})</h3>${pending?.map(p => `<div class="border-b py-3"><b>${p.profiles?.full_name}</b><p class="text-sm">${p.profiles?.email} | ${p.profiles?.parish}</p><button data-approve="${p.user_id}" class="approveReg bg-green-600 text-white px-3 py-1 rounded mt-2">Approve</button></div>`).join('')}</div>`;
      document.querySelectorAll('.approveReg').forEach(btn => btn.onclick = async () => { await supabase.from('registrations').update({ status: 'approved' }).eq('user_id', btn.dataset.approve); showToast("Approved!", "success"); renderAdminPanel(container); });
    } else if (tab === 'announcements') {
      ac.innerHTML = `<div class="glass-card p-5"><h3>Post Announcement</h3><input type="text" id="annTitle" placeholder="Title" class="w-full p-2 border rounded mb-2"><textarea id="annContent" rows="3" placeholder="Message" class="w-full p-2 border rounded mb-2"></textarea><button id="postAnnBtn" class="bg-gold text-royal px-4 py-2 rounded w-full">Publish</button></div>`;
      document.getElementById('postAnnBtn').onclick = async () => { await supabase.from('posts').insert([{ user_id: AppState.currentUser.id, title: `📢 ${document.getElementById('annTitle').value}`, content: document.getElementById('annContent').value, is_announcement: true }]); showToast("Announcement posted!", "success"); renderAdminPanel(container); };
    } else renderAdminPanel(container);
  });
  document.getElementById('backToUser')?.addEventListener('click', () => { AppState.currentView = 'home'; renderMainView(); });
}

// =====================================================
// MAIN RENDER & NAVIGATION
// =====================================================
async function renderMainView() {
  if (!AppState.currentProfile) return;
  const container = document.getElementById('appContainer');
  const isAdmin = await checkUserPermissions('moderator');
  if (AppState.currentView === 'admin' && isAdmin) await renderAdminPanel(container);
  else if (AppState.currentView === 'home') await renderHomeFeed(container);
  else if (AppState.currentView === 'conference') await renderConferenceModule(container);
  else if (AppState.currentView === 'resources') await renderDocumentCenter(container);
  else if (AppState.currentView === 'community') await renderCommunityModule(container);
  else if (AppState.currentView === 'profile') await renderProfilePage(container);
  attachNav();
}

function attachNav() {
  document.querySelectorAll('.nav-btn').forEach(btn => btn.onclick = () => { AppState.currentView = btn.dataset.nav; renderMainView(); });
  document.getElementById('darkModeToggle').onclick = () => { AppState.darkMode = !AppState.darkMode; applyDarkMode(); };
  document.getElementById('profileMenuBtn').onclick = () => document.getElementById('profileDropdown').classList.toggle('hidden');
  document.getElementById('settingsLink').onclick = (e) => { e.preventDefault(); AppState.currentView = 'profile'; renderMainView(); document.getElementById('profileDropdown').classList.add('hidden'); };
  document.getElementById('termsLink').onclick = (e) => { e.preventDefault(); showTermsAndConditions(); document.getElementById('profileDropdown').classList.add('hidden'); };
  document.getElementById('privacyLink').onclick = (e) => { e.preventDefault(); showPrivacyPolicy(); document.getElementById('profileDropdown').classList.add('hidden'); };
  document.getElementById('logoutBtnDropdown').onclick = async () => { await supabase.auth.signOut(); location.reload(); };
  document.getElementById('notificationsBtn').onclick = async () => { const n = await loadNotifications(); alert(n.map(x => `${x.title}: ${x.message}`).join('\n') || "No notifications"); await supabase.from('notifications').update({ read: true }).eq('user_id', AppState.currentUser.id); loadNotifications(); };
}

checkUser();
</script>
</body>
</html>
