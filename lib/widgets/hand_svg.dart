// ============================================================
//  hand_svg.dart  –  SignTranslate AI  –  Embedded Hand SVG
// ============================================================
//
//  This file embeds the AI hand illustration as an SVG string
//  so the app doesn't require an external asset file.
//  Usage:  SvgPicture.string(HandSvg.data)
// ============================================================

class HandSvg {
  HandSvg._();

  static const String data = '''
<svg viewBox="0 0 300 320" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <!-- Outer glow gradient -->
    <radialGradient id="glowGrad" cx="50%" cy="50%" r="50%">
      <stop offset="0%" stop-color="#00D4C8" stop-opacity="0.3"/>
      <stop offset="100%" stop-color="#0099FF" stop-opacity="0"/>
    </radialGradient>

    <!-- Hand body gradient -->
    <linearGradient id="handGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%"   stop-color="#00D4C8"/>
      <stop offset="50%"  stop-color="#0077CC"/>
      <stop offset="100%" stop-color="#001F3F"/>
    </linearGradient>

    <!-- Circuit line gradient -->
    <linearGradient id="circuitGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%"   stop-color="#00D4C8" stop-opacity="0"/>
      <stop offset="50%"  stop-color="#00D4C8"/>
      <stop offset="100%" stop-color="#00D4C8" stop-opacity="0"/>
    </linearGradient>

    <!-- Glow filter -->
    <filter id="glow" x="-50%" y="-50%" width="200%" height="200%">
      <feGaussianBlur stdDeviation="4" result="blur"/>
      <feMerge>
        <feMergeNode in="blur"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>

    <filter id="softGlow" x="-30%" y="-30%" width="160%" height="160%">
      <feGaussianBlur stdDeviation="8" result="blur"/>
      <feMerge>
        <feMergeNode in="blur"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>
  </defs>

  <!-- Background glow circle -->
  <ellipse cx="150" cy="165" rx="115" ry="120" fill="url(#glowGrad)"/>

  <!-- ── Hand silhouette ─────────────────────────────────── -->
  <!-- Palm -->
  <path d="
    M 100 200
    C  90 180,  85 155,  88 135
    C  90 118,  95 110, 105 108
    C 110 107, 115 110, 118 118
    L 118  95
    C 118  82, 124  76, 132  76
    C 140  76, 146  82, 146  95
    L 146  88
    C 146  75, 152  69, 160  69
    C 168  69, 174  75, 174  88
    L 174  95
    C 174  82, 180  76, 188  76
    C 196  76, 200  83, 200  96
    L 200 145
    C 210 138, 218 138, 222 148
    C 226 158, 220 172, 210 180
    L 200 200
    C 195 215, 188 228, 175 235
    C 160 243, 140 243, 125 235
    C 112 228, 104 215, 100 200 Z
  " fill="url(#handGrad)" opacity="0.92"/>

  <!-- ── Circuit lines on palm ───────────────────────────── -->
  <!-- Horizontal lines -->
  <line x1="118" y1="160" x2="200" y2="160" stroke="url(#circuitGrad)" stroke-width="1" opacity="0.6"/>
  <line x1="115" y1="180" x2="205" y2="180" stroke="url(#circuitGrad)" stroke-width="1" opacity="0.5"/>
  <line x1="110" y1="200" x2="200" y2="200" stroke="url(#circuitGrad)" stroke-width="1" opacity="0.4"/>

  <!-- Vertical lines -->
  <line x1="132" y1="90"  x2="132" y2="170" stroke="url(#circuitGrad)" stroke-width="1" opacity="0.5" transform="rotate(90,132,130)"/>
  <line x1="160" y1="80"  x2="160" y2="180" stroke="#00D4C8"            stroke-width="0.8" opacity="0.3"/>

  <!-- Circuit nodes (dots) -->
  <circle cx="132" cy="155" r="2.5" fill="#00D4C8" filter="url(#glow)" opacity="0.9"/>
  <circle cx="160" cy="148" r="2.5" fill="#00D4C8" filter="url(#glow)" opacity="0.9"/>
  <circle cx="188" cy="155" r="2.5" fill="#00D4C8" filter="url(#glow)" opacity="0.9"/>
  <circle cx="145" cy="175" r="2"   fill="#0099FF" filter="url(#glow)" opacity="0.8"/>
  <circle cx="175" cy="175" r="2"   fill="#0099FF" filter="url(#glow)" opacity="0.8"/>
  <circle cx="155" cy="195" r="2"   fill="#00D4C8" filter="url(#glow)" opacity="0.7"/>

  <!-- Diagonal circuit traces -->
  <polyline points="132,155 145,175 155,195" fill="none" stroke="#00D4C8" stroke-width="0.8" opacity="0.5"/>
  <polyline points="188,155 175,175 155,195" fill="none" stroke="#00D4C8" stroke-width="0.8" opacity="0.5"/>
  <line x1="160" y1="148" x2="155" y2="195" stroke="#0099FF" stroke-width="0.7" opacity="0.4"/>

  <!-- ── Fingertip accent lines ──────────────────────────── -->
  <line x1="105" y1="108" x2="105" y2="90" stroke="#00D4C8" stroke-width="1.5" opacity="0.7" stroke-linecap="round"/>
  <line x1="132" y1=" 76" x2="132" y2="58" stroke="#00D4C8" stroke-width="1.5" opacity="0.7" stroke-linecap="round"/>
  <line x1="160" y1=" 69" x2="160" y2="51" stroke="#00D4C8" stroke-width="1.5" opacity="0.7" stroke-linecap="round"/>
  <line x1="188" y1=" 76" x2="188" y2="58" stroke="#00D4C8" stroke-width="1.5" opacity="0.7" stroke-linecap="round"/>

  <!-- Fingertip glow dots -->
  <circle cx="105" cy="88"  r="3" fill="#00D4C8" filter="url(#softGlow)" opacity="0.9"/>
  <circle cx="132" cy="56"  r="3" fill="#00D4C8" filter="url(#softGlow)" opacity="0.9"/>
  <circle cx="160" cy="49"  r="3" fill="#5FFAF3" filter="url(#softGlow)" opacity="1"/>
  <circle cx="188" cy="56"  r="3" fill="#00D4C8" filter="url(#softGlow)" opacity="0.9"/>

  <!-- ── AI badge (top-right of hand) ───────────────────── -->
  <circle cx="218" cy="98" r="18" fill="#0A1628" stroke="#00D4C8" stroke-width="1.5" opacity="0.95"/>
  <text x="218" y="103" text-anchor="middle" font-family="sans-serif" font-size="11"
        font-weight="bold" fill="#00D4C8">AI</text>

  <!-- ── Outer ring arcs ────────────────────────────────── -->
  <circle cx="150" cy="165" r="108" fill="none" stroke="#00D4C8"
          stroke-width="1" stroke-dasharray="4 8" opacity="0.25"/>
  <circle cx="150" cy="165" r="118" fill="none" stroke="#0099FF"
          stroke-width="0.8" stroke-dasharray="2 12" opacity="0.15"/>
</svg>
''';
}
