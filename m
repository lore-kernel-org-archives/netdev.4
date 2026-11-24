Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484296;
	b=3szaKUcx7KEhD/x/p/vYY7zgKNFOJykcFHjNVUOnVQChUVcxr+q0zf7atr+wzNXDKdxt
	 oq/yloBoDLyeOzf7YoLGGWfx0XloYSJ2WOdgSJDicMNIR8m/0fmmb3pO7M92WzEzG8UBv
	 ALeg0cM48+7c/mKx0lIdcB4cKxB+w9sgG3CqwJDvPt947T3RF8rRLoqFlXoVlPyCaqtbB
	 E2j7gYFP4u3jg7DgIupZpyeOD0q8coQoZArS20yDMO6Lf75KOHKqf1sXxh1spax55uA62
	 MC5wcQFoTb4UHz9yqVXY6Nkzx49TUpHmMf1SwhtVlRhzfW6qXKLwo9PzlxssxlJZtSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9ttHp2mukC/tGMOBmjKlOmnQPb5GQ9cwK7fnwbrYrro=;
	b=pDWGNPeJNQ2oIa+ij2+KzI6zVf6h7nwaBPr7e9P0APlVPGcHZUJgHYV5igmKDw6G6H66
	 0PQUTYYTA3iAmIokQVJHCmeFlr3VF2Wu12cF9xJxdM7Itclts8RuzQqIYi1HuoxbdwY75
	 54LoovoX/wD8xT3Lq5z4JF6+eISvdDBKL5MnPvXHC/1zjyBxQeWVD0qH9k2HrfN1ubEL6
	 RClBtROM8L5M67ZKofXxvZBGMhsnyHvfS9r59lwYYuRuR0Zjw+O0BBDacWnSwffiYkw9d
	 +KgNEnDh4Cgli58OxGxlGuiZwyFcTtxVOJOaxyc43eEawYTTJb5yg4CTp6N8twWrBdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HalbCFD1;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BBA606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BBA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HalbCFD1
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4c685c751so34091737b3.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795484295; x=1796089095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ttHp2mukC/tGMOBmjKlOmnQPb5GQ9cwK7fnwbrYrro=;
        b=HalbCFD1Lw2UXPOv9DcbVAZIgTEpte5A7w0gB77Ia2AhhvTFnr+Cavmw04K6IXkBis
         gK/IW/J4QWjG1qGtWv6eIxLs0IhA6CR6s/oKp9ufURlCQcxuI6uDqx6DvLgI53F9E7aY
         m4c4zLFVzR5BW4DG5w+DBrp8KQ4VulJq2ihZ4T+ovhanQdgKA1SzBBVbcxPyv234pXhR
         YQBVwVjB5p5L5KgA0AffA2ScuCMwuul7g3vv26euOWsnMD9GmsT+grXBZDZZkaIV21Gh
         g0EQPgOTVAFOMQhJw22qn0uXQJzPOrGhFz2ka3EBMQcSNSp4eqjzTNb8vwFzinaH9ap+
         dOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795484295; x=1796089095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ttHp2mukC/tGMOBmjKlOmnQPb5GQ9cwK7fnwbrYrro=;
        b=dAFY6DVT6lxT6YWOulUee9SuhdQYnC9dQEei7qHaXfdqDM4jcTGDElt4gq7/zEmzKL
         16J4W0iSb8SC1vLnOLbV9XSDE6+F6PaLE5Z+qktelwj9kVqNNTp65bGqRqHYAyBUKMZ1
         yJvV3vl7eC8C7RUpis0N10TqT7OmGUjgaFEcmRF2fuJtIsKeF4KwtRaCemF3Vg0+RhhF
         fHzqUh6tbGAZB1Y1mqfMSecBcxtM9jApK8NCosMBWlwfUWL0CZOosXIJbJ8dFjgb+UQo
         uaUr3CW1Wd2q9c8rJgTYKOOHnLYDpZzmTqWf2mYZxmqZR4qLBqq9PdEfK/2BJpB0ksfD
         2ccw==
X-Gm-Message-State: APuU4Z9U+LQkY581DhdUwoFtvCIMHdC5y82Skeeg5l7EZlbDpLpUduZj
	75qSI/xcPKSAnI3YM4ii2/5jp3fP2CMGXMZosLtELKgF9JQ/tI6L9GLZxi37qKFO
X-Gm-Gg: AZFdTZfJc681qJISkhXrfo1xvSN/GtqM7WhFeDS3JqNct8fk2OG/q6yII4d/JaC0b9u
	UUIOlu5QS+drTMM/ygcTGTWMqyRfOx/9ArfoOPX716Topp1sTSgLj2cI19+zILUk2qrqnw+/yHk
	36/f3uFOVQiKRoPm/QeWOuKityX20rkjHDp9vRqMroJcIcR26R65ESDoVUgqmqZ3ELwt9VuWHG3
	f+jPOfKQfcCI2vXDOM8fGswdiUaLnkXh2BnpP0ny4bDF3j/PKujGLtBrxGWLKm0n0HhIpzybAwR
	ZXX5+swoltGL3a8trnta62A2F3szWKN2BEIjDTMgWPSSo+rIxiiUR7sNtOR9Wklqla0XKCcYep8
	RbC1KA4+purQ9fVhwTa2fxQHIT8XLK6Ul8hn6RXlJB0PZFNN4zxS8tiEpEF3v/aBO6sUv7WBpD6
	f7wvIDP8TRHsmsNWyZm3STQkKkNeNJMDgalIDPtUe+MpYUCVeKm6QtuiiMehOGTlaDPpqam7xuQ
	73n0jlHSbnXO2SSYr2J8PJfqS+0+PsZhKN+yTkoksm14vr0jZtldvDgRaSqKUTcfAsEKbgk5vo8
	rfDfvGDpPxGWa47eJ3YpXm3JoGrRiZrRWYAx//wT+iLWMSswueBxkNYJV5K+fzVLsBjxjIQmCr4
	EzSdJuSKhmygcAr8HxljRu6G2HVx7rhK9ARZ3GKoiUlketqX94t0l+9WF9OPPlfvkQMU+SLpqMD
	UHSNhIE5SgQNg7txCvVRIgvd32
X-Received: by 2002:a05:690c:4a02:b0:8b0:f1c0:60b1 with SMTP id 00721157ae682-8b5204a7d4bmr41571617b3.60.1795484294996;
        Mon, 23 Nov 2026 17:38:14 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:7bd1:1ca0:6d54:522c:b8ac:678d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df3353258sm6455451d50.9.2026.11.23.17.38.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 17:38:13 -0800 (PST)
From: Aviral Srivastava <aviralyash27@gmail.com>
To: netdev@vger.kernel.org
Cc: netdev-bot+sashiko@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org
Subject: Re: [PATCH net] udp: gro: do not match tunnel-processed and plain packets
Date: Mon, 23 Nov 2026 17:38:04 -0800
Message-ID: <20261124013804.96778-1-aviralyash27@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179545921450.3135.6404804724515356262@kernel.org>
References: <20261122183951.73210-1-aviralyash27@gmail.com> <179545921450.3135.6404804724515356262@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. Both points lead to changes, I will send a v2.

[Medium] Fixes tag covers only the out-of-bounds read

Agreed. The port match through udp_hdr(p) dates from e20cf8d3f1f7 and
the merge does not depend on 4b0ebbca3e16. I checked it on v6.6.162,
which does not have 4b0ebbca3e16 (arm64 QEMU, KASAN, netns over veth):

- vxlan with inner TCP, UDP_GRO socket on the port, plain datagram
  with the same outer TTL, TOS and DF as the vxlan packet: 2000 of
  2000 datagrams end up inside the inner TCP segments on the vxlan
  device, none reach the UDP socket. No KASAN report.
- Same with consecutive IP IDs and no DF: 2000 of 2000.
- Same with the plain datagram's TTL off by one: 0 merged. Differing
  ports, no tunnel device, GRO off: 0 merged.
- With the v1 hunk applied to v6.6.162: 0 merged in every case, and
  UDP in vxlan/geneve still aggregates.

On v6.6 the L3 gate is the flush/flush_id state from 5babae777c61,
computed on the two real outer headers, so ordinary header values are
enough there. v2 carries both tags, e20cf8d3f1f7 first, and Cc: stable.
The hunk applies to 6.6.y, 6.1.y, 5.15.y and 5.10.y as is.

[Low] encap_mark is cleared by FOU/GUE

The observation is right and the comment and changelog in v1 are wrong
on this. I do not think an is_fou comparison is needed, though:

- When FOU/GUE carry IPIP, SIT or GRE (or vxlan), the inner handler
  sets encap_mark again and the transport header moves to the inner L4
  header. Those are covered by the v1 check: they give the same KASAN
  report against plain UDP before the patch and none after.
- When FOU/GUE carry UDP directly, encap_mark is 0, but nothing moves
  the transport header or the network offsets, so udp_hdr(p) is the
  outer UDP header, the same layer as for a plain packet. A plain
  datagram with those ports resolves to the FOU socket itself in the
  GRO lookup, so it does not reach udp_gro_receive_segment().

I ran held plain UDP followed by FOU/GUE-direct UDP with matching inner
ports, and the reverse order, with a wildcard, a single-tunnel and a
connected FOU socket, with a UDP_GRO socket, rx-udp-gro-forwarding and
rx-gro-list: no cross merge and no KASAN report, with or without the
patch. The only merge with differing is_fou I could produce needs the
FOU port to be deleted while a packet is held; it is at the same header
layer and in bounds.

v2 keeps the code and rewords the comment and changelog to say what
encap_mark guarantees at that point.

Separately, UDP carried directly in FOU/GUE never aggregates in
udp_gro_receive_segment(), because the inner header is compared with
the held packet's outer one. That is not a regression and not changed
by this patch.

The v1 notes also said "28 and 29" KASAN reports. That was the dmesg
ring limit, the console logs of those runs have 1023 and 308. And the
changelog said the merged datagram is not seen by the forward and
egress netfilter hooks; the hooks do see the aggregate, what is skipped
are rules matching the datagram itself. Both are corrected in v2.

pw-bot: cr
