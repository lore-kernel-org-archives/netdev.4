Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828230;
	b=tc0AzE8hcCrkQO6mhC6icryWTSvmRysavsdLLPw4iVxlWL2Nk5jBHxHZzA+HVq1dG18w
	 CecSsjj5aUNfKbQV5xNOFLqs8s5/U9a3RIVJDWXsOxuhD2HaTtHFM8ZAEb4ikgN58Zdy8
	 rg1kbFexSmX9jX/0xpGix56CCM9fjPAAAhEgjjeoVqvMifuIKdOgK7rcBIH5OUV+VFN5N
	 aCmqkbXNyLcQ4fcAyRfiyFMsiWwsOl1bSTFZmvy5WQEhv3xQRKeJkOjvBFmofFIjrWgP/
	 sNk12Rr9RCnCS9fp/zY2EPbJoA+ly01lTxqq7SvXPjIZbIeoGN5kqRRf0LzWGjAhHhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
	b=u0/HE6ZU06XEJ8kj840+qW0spFz1O7G4PKWSm8pe4AMToqnSEQZUkJxWRy+C1BjxP8BW
	 K5VaH5J1ghFLlUl095MBFq0YQ2agY4JuXdacH4bnjaJSK8dUnoW2ksIHNRm988G8ePdQH
	 lBvlXwb1fEtHpR+AecXARmqeSX7JqIYBL+OHcNad9YuTW6cgnu0qZP5Q5FKV4qzSgQwDt
	 ytzbb7aiC5ADsyDRm1Tw7jSosxKOTXZKgFNqgd8jazKI2txeAUTTwtRWs3v8TpWqYxtgR
	 SRHTbdDubl+xCVBIpTlD558l+GxDOaNOMOM+ShyzRkT6MxLsagTjxACZsx+nUZ53puw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTPv96oK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D73606AB74
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D73606AB74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTPv96oK
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490f38e9688so2335057f8f.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 03:23:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794828228; cv=none;
        d=google.com; s=arc-20260327;
        b=UPqQFTWEaADU3OnAyvvebtq/BKleHxU38M03I6Xb8rVuY5GPulbAHdWCBIPpQ0Y4er
         n1TmzAEvf6dZD4gwv0Qr4OBFYELtbmE+/tW+LrV55kb9vlpUbeEwrj4HBMVJXgPxwccV
         sHLZ87aAIq1EK6xzcBhsSQ+6gP2cRDteVxlD8W9NakVQxB7L9CqjlU0IkyzSkM07YUVb
         Iys4QB7OasaF4ZYazMMY/722+hOqJx2Bhv6qfik+n5ADngGOYHqchYOr+cTq9gJi2lDj
         /MEMPUWX99EE5SUFGntbN8JicH1Uafx7kwhBw6rJ7MILJSuWakLpEmKG4/+z9T4GH/N0
         jJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
        fh=lcm2FZPIeqgOanSAHh96pAXbQmK93ztPbPoFyl0WdQA=;
        b=Fkc3hIN11URYo/0COduE6sgFDNmSsqR9z/EXQHT0FoAqxLkck64m2z/E1BGi7RyNT8
         xe5F7wjq19uPfILjYMF9IdPensdkMxU7cnA4JKNaTHiKcxbOstHuSzsiAzUvJWRouHgn
         kSa+wACzkysEkd0ajWpvltUK78rgBY17r08crfJfbKmxv3XejkAz9N98+DplHXwE1zV0
         F2EdgzgQZXWxeDrrCeWQkTwQzVlHRCkKHdJiGi6y++QEFNleOJ7D/urN1vP5yQspnL4u
         A0k9lJ18BfjpImzomUthQEDpFjphlA60FpRFPUnVCEntsrU+QL7+p7krvwD1TBA9ShZe
         B7kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828228; x=1795433028; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
        b=CTPv96oKruVMu5+1xy5CsLjHaPzMA8IUmSwT+AGs+LX8npV8stuzU+uRYRzRWNauOv
         tjkz+gsdmZ0SDshzFDlbLZ1T0IhQL2lqUkfhF2LEuYdMDv+N/K5YFkAZGa0mPIHkywTC
         qhxfI4FN2t/ruCC2Kjt73UBpWzzvmzlpJAKPApFd+HEhy8iHoxHORRtnl5Ci33nSdkKa
         VJxVf2NGnAsYyvnY4urlpq9wZeSzHS5WUVf9DzjbOf9TESD6UowIX84AFRHNKj1uRG+X
         hiCbiK+gE/h6cLOlM8CWcm0S7vF2s4feUUTFSC1M1RBy8ibT1M5M+hs2auBf2X10FThP
         DwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828228; x=1795433028;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
        b=ARXqN5OFBw4fMRc7uJQNJsZignBrUVbaS9FD0YRWuQ7NYCcsegKRN39y1/VMv6VlYE
         4AzYLt8PDjhm+cciU+CSetFQW1kHM7PqUFP+czq811f30l7Kc9UVCy/T9w0mx+S0GJw3
         HZV99wb8K7/D/bnbBd0sTQ2J2UrHeWbD54adblkRkHahDcPXiK9h1XWrgX638JzFb1U4
         wtCV/SzvpqjlU+8+NhIlQr67MYYN9K0V2lVeE8H44fFmNhf16s0qVd8SBjlRCLyFigie
         5y/OPu+hQBipY3zsaKvOWRVyBoAyuxZGb4WUfnhrrWDfoo+LeaEiA6G6TRbFpqq4wtCP
         G8sw==
X-Forwarded-Encrypted: i=1; AL+hErFE6c269G5OQ3DAFWFbNm8Z+Rx/h8Ilj4CcM1fXcyZKwlogx5FXFrh9WRxY37ZOUrwPSiV1DC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9ZXjYbexNHgz3uJyLmGLw7cOtYg7OYh5js1SymguP7LQo79Bn
	BCSZw1NPcHehLwS0hS744iZCBFPyBKAt8rKnxXwbVzj00OTqVciiHA3xF5z1sQMNYPykOFNUEbz
	y44o0dOwYXkdBnzR5/JuYVTdzexuZP4I=
X-Gm-Gg: AZFdTZf+Gswn2nGnN9StmyoPFy/JqtN2Ks9Gr7YcUoYv56uGlpqBSMqGF3ro+upJIL5
	o1PoVv9+W09ZTuTjYU7sbrtULk/nuPsic5ae7KuvzCfD3GcABuA7yBWj4DXBowPdzt6Ne8OOjWE
	+Kudmyc1mIms68fVdNxdO850+INIA8ZoqzFMEmYURvpzT4C+AEgXhl3oudu0SgHQLyHJ9yA/Ont
	L1OYHXfTpynUBtgi3t2XDp5mjwu07MyyArmPWvxIweqbmAdHKCXpxP39FWFzhrGYCzdtLmLuLyq
	e5KlNV2H/O+pvVdwMPAi16sLRv+NjkbPrw/0P4ccX9luXFhLFKE1oM00YT31yElCHs3Z0xig2zb
	1WKZWPrSnfpp9HFyKpeHMmNNiAcVflXD3Aaa0cSLJKcIVNHUilOpT7lFglQJyNxPEGLI=
X-Received: by 2002:a05:6000:401f:b0:48a:f4d4:e1f3 with SMTP id
 ffacd0b85a97d-49c6ff8142amr23541572f8f.13.1794828227485; Mon, 16 Nov 2026
 03:23:47 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
In-Reply-To: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Mon, 16 Nov 2026 12:23:35 +0100
X-Gm-Features: Aa3M54rcJmWUc1Ncq_Fk9iW3VcokWpJC0yoijn8Jeo0Icrve_bZeoYCpsWMQggs
Message-ID: <CAKx9m6O=uqC16v5-swStrtq4xzNzExbM0xFoi5znQOmnwDvSZA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: dwmac-motorcomm: shutdown hook
 and Wake-on-LAN from S5
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: me@ziyao.cc, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Magnus,

On Mon, Nov 16, 2026 at 10:17 AM Magnus Leatti wrote:
> Giuseppe, this is the OOB WoL enable you and Yao discussed in the
> s2idle thread [1]: it is only enabled when powering off, because only
> a chip reset disables it again. If you can try "wol g" and a power-off
> on the Slimbook, a laptop would be a good third board.

Tried it on the Slimbook EVO15-A8 (Ryzen 7 8845HS, BIOS N.1.14GOS07).
I ran Ubuntu's 7.0.0-43 kernel with both patches applied to the
distro's dwmac-motorcomm.c and built out of tree, so not net-next
itself. The module also carried my pending reset-on-resume change and
a register dump, neither of which runs at shutdown. Magic packet sent
from another host on the LAN about 75 s after power-off, on AC:

  patched   wol g, BIOS WoL disabled   no wake, 1 of 1
  patched   wol g, BIOS WoL enabled    wake, 1 of 1
  distro    wol g, BIOS WoL enabled    no wake, 1 of 1

One thing worth knowing for laptops: on this one the firmware gates
the root port. \_SB.PCI0.GPP5._PRW (SSDT23) returns {0x0F, 0x04} only
when the BIOS setup "Wake on LAN" option is on, otherwise {0x0F, 0},
and /proc/acpi/wakeup shows GPP5 at S0. It was off here, which is why
my first attempt didn't wake.

I couldn't check for warnings from the shutdown path: the journal
stops before devices are shut down, and I have no serial console or
netconsole on this machine.

Tested-by: Giuseppe Nespolino <g.nespolino@gmail.com>

As before, I worked through this with an AI assistant; the test runs
and their results are from this machine.

Thanks,
Giuseppe
