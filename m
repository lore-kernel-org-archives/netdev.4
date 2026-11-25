Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586061;
	b=U4uC2JrorK+u20rEi0XbF/g3SK/x/7IH1cecM0CkSu2pJ4GZqv+C9CzC54c8FFtIffa4
	 271Vg6EqqHUTl3aB0mj8WiBVZAZMoknz++pF85qDPZ6mMk/HOiwJGO2/bzmkMF/l5WpAd
	 Vcaa+WJz0DKWUdLwjw1ueydm95ab6gjww/JZ1nUAxYN284DOW8y/7+auCTYUFxQjJI6z+
	 JnpaiiBE5yBiUB7QaY6s6lzSekHg7LWd7eSJ2MHeA12ODCAd9AtFn4Ga97IDGOph9Ljej
	 ECM+66fY3TAwtyKAlVBDN8CVZZ5gUacrPZqD8HUqORf5IKBWX+EQ3SlmgS1dglHrHGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+Bg1tcVFicbbXaykMYvFz5W401OjX0GZjBhGqh2OgKc=;
	b=UYVMG6tDEhCINMeGuk5IHAXwOHKprJ/BjOy9aVphebq0N1jynD7G5U2YX270soKMixc0
	 ZuYhCCX+43Dw3BvZ2mlopny9IawytcLCORiv5YPc7c/mBJhLI7VEw0Tw/IX1TOLdnJmQZ
	 TZIm9Vpb24GUGHVpHzS1hTrEKWOVmyaBy/SlRT3miGxHYZFs7NcmTV0y4VCDt//54QV0V
	 31wQ/lja8qssgfxh19oMUlyBR+ZXXPGMMJ2RQTIml17GAcf+RuKn/+pxHM5tkeRaFYULc
	 LlaRZOrPHKQhXHjlqVSzd0XpviWwF+8q2ZAUSMcnmCkN9B0XpdJn0sisNMVuttisz+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="B/L4cdtp";
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E1B606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E1B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B/L4cdtp
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd97f89731so3183422a12.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795586060; x=1796190860; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Bg1tcVFicbbXaykMYvFz5W401OjX0GZjBhGqh2OgKc=;
        b=B/L4cdtpUN1r61Do/Avk7MB+fEHXhtLtoi1+4dDF85c4N39C2chGUEwp260pb14DRV
         PDpN7fYYpBtwBBqWzMK7PneIVbFtHK+Q5tUWfGHSxIZ+g13P/j04BFWMDzquMTTJIesQ
         iIrr7sab8PBM2rLOGh9CsppAxEU79Nzmcy/4W5TfEWvRZYDQLplf2Vno6Vdr9KqOw/qq
         v4xrhjHy7A34AmUlsjDSeLFg/9nBsddyRVv4voI/Zr8yfjSWR0DCaTAt5Oip6nIBmTtJ
         sPuZSAa12Fwf7DluuROQuQOtJ9DGa63LAobE0GRJdg0Q/iTpXxumUsnfXMNZZcPDKGXp
         Ul0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586060; x=1796190860;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Bg1tcVFicbbXaykMYvFz5W401OjX0GZjBhGqh2OgKc=;
        b=RUR9R1H8bNlnIeXJNEadBoPC0nb3UvmulRsI5zkC8EWMMEQjAGj6cluEtB5iyQ1Zdu
         qF/iqHUQCmjJpwCe/liF19dKtNOmZR4Ov8RSxTMtkgSZv/W0fD1LUPWK21nTDsSBbmBl
         AVeJP3FRR0bIZ7B+axt9npcXchrFE3ThsiwF5A7PgHjt/ycOB7yhpKDUj4di68K6Exk7
         eT/Y9fZSBf4JBsnLfyTyzbllb4uHuOT7uqZYDiV6YzdgoVDt2ZeztdZLuD/CabAwbgGf
         xrvHn/ubozB0cToYuJnjXGmetVf7MBkryMfKTIQK3yHPavf4gLo/7cz9bXeU8SNBIMFH
         ytqw==
X-Forwarded-Encrypted: i=1; AL+hErGMfEC0VsB0PA4zFjAj02B15aYbhSnqhX5T26+AVXZFHNMamRhZUPLcMhY8IOt4wJLz0yS/gqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XlPzHaE42OZBCjrKe/xnIRi4O971o+IO1DAuhVbTAKxRWDtun
	kKnLOXcK/4h07WXWgts6pcDluSCq51lmzm/LYCKLpRdtv5Rlm+dytZR7mIDmRdzOFy33qo63OWm
	jPdkrjzSlKrXu74T6iA==
X-Received: from pgin25-n1.prod.google.com ([2002:a05:6a02:8799:10b0:cda:d1e4:341b])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:164d:b0:3b3:a575:846a with SMTP id 98e67ed59e1d1-3b40a5de1bcmr13038342a91.22.1795586059832;
 Tue, 24 Nov 2026 21:54:19 -0800 (PST)
Date: Wed, 25 Nov 2026 05:54:16 +0000
In-Reply-To: <179553165359.3135.5730863120205025514@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123144535.155300-1-starchang@google.com> <179553165359.3135.5730863120205025514@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125055416.1987174-1-starchang@google.com>
Subject: Re: [PATCH net v7] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: Star Chang <starchang@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Julian Anastasov <ja@ssi.bg>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wangroger@google.com, starchang@google.com
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

> [Medium] Should these packets be consumed instead of dropped?

I chose to drop them because, with the knob set, ARP in L2 BMC frames
is rejected for neighbour learning, similar to how the IP paths drop
unicast packets in L2 BMC frames. But you have a point that ordinary
broadcast requests for other hosts would then show up as drops. I'm
fine with switching to consume_skb() or a specific drop reason if the
maintainers prefer.

> [Medium] ... changes the semantics of an existing IP-only knob

This is intended. With the knob set, ARP in L2 BMC frames is not trusted
for neighbour learning: a forged GARP or broadcast reply/request with
sip = gateway is exactly the attack. Ignoring announcements and arp_accept
for such frames follows from that, and the knob is opt-in
(drop_gratuitous_arp already drops GARP entirely).

The same applies to IPv4 link-local peers that broadcast their replies
(RFC 3927): exempting them would let an attacker forge those entries
again, so I'd rather keep it strict and document it, if wanted.
