Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824133;
	b=i1t3IJ5rHExtKipgmUSu17zQ0Gpryww6n5atdaWB8VWdPRvUrGFcRL9B5wM3Tjs/bPaA
	 8lo89nhrEvbVGeJ1L/q542qSpvV9X7KBGTx4XJETa1Pf4+xkYADJtRXlJOnYA+JIb0aib
	 QI9zPWfodKzqL67v4bE0JIb+zGQum1CEP/eXP3nGtlmf0I688mmXJTwaRGsItOEgWBKlk
	 L9WeXil09EIy+zoSJD8fXuuIBXyV1F3gEgvfjPIne5BKcYC9SU/tJ6pnszI2QOUcLaCvL
	 D30RB/gpVm+4gE5J8jWXlUytjVV4M9sx9hzeKzDn+DX41wkOcEhxhxjGKU8yVadcLbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MmFHwFEuMpLfLRAKJJjBjIdikYWgskAg6Z40N1h66qk=;
	b=NvFtxBEuwb5kqvTzVUwmHvFzApRv+RYpMTN161yBhcOMo5IgKJvs/jKsRbS7muZ0Pmdj
	 TDXkX+xveJh7daRCXifyJmYoUNaROOso8/bY1K/LMgF/7tQHUfgq/7/vfL27LGQ5fnTMY
	 I1OWLSyFmnUUk+hwA3KEdAZqQpaat8ZrdQ/xhzfqn50ZZvv1I1xjep9b0+Ce51d+PGLnQ
	 Y/tLyMbtkB/WxoQxTM6wJYpXcdgwsefQhq1r3GGC9YqTJ8Gz3A8uVogPjJHIRDUrSN5I5
	 u6eGgg9K7YkGfmfYbdSKKVQCA+plUvGLzCmMlurI/7MMEjrUoH4ztQ/MY2otaSXseJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgAYqc9G;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D81606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D81606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgAYqc9G
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b7efd3bc26so1628640a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824132; x=1795428932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmFHwFEuMpLfLRAKJJjBjIdikYWgskAg6Z40N1h66qk=;
        b=HgAYqc9G+r96o0aqLB0eD65XAGTpvqpGGt1tW8Ub7O/zlwjAXz1TJx3hFYyjVwyZ09
         ECxETVeCo06ckRHSN36lx41RzEpKa2tvpIimz2927tVhlZPmryHZF2EL7RoebI89/kfv
         fY4XMfG987AjFYznToDjdOG6cRZtFHqytosoCqFNm7pkBmCTuUTMhzaCvCKvZhw8BgSW
         nb2VijaUGgqbOlOrDlLogUZwZVHbdXT/2BY7o76L+vWqspXux2lQVg0LxzJbjnvzXpeQ
         b6+N6W7V2SaeT/vujdVrAi0PrvF14wgBNST8KCkL2miE0tnLXS+SXFukDhhwmIqG8Ry7
         0bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824132; x=1795428932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmFHwFEuMpLfLRAKJJjBjIdikYWgskAg6Z40N1h66qk=;
        b=HBzWmw2gxv3QX1lwoPHL2El6tZwU/A1g66a7ZAOOZiAar1b2+K1eXsGNkajGO0I2RF
         PH/VsbF/3KqDkahjTFHLRPmLoctoi/6m/FpsDMjaJWVHjFdEeF1OZd1zdYl53rfK/BD8
         1Hd0ohZRRSqUfINWFTtYnnEL1OrK3ww5ElDTB4PNRld7XPCv45wHFshZAf97GMthZVW3
         nFetdtUn+dWsVUvx4626QoxDwm0y5SnRCOgabHEhoWCb5rL3a0muPKnYXr0UaHc5Odau
         IKyl0PZzqGENy85x7DQW+zK4mOs2CrGS4IQWItqDPytlbp2MkzNyNEyU4iUkVvg0bwhH
         Y1GQ==
X-Forwarded-Encrypted: i=1; AL+hErGHuiD+zujdx0jfvKOSv1rQ7t4RSeMt54UD5cOk+nPZrXiSeQewpP3jvWPGRml/gal0JoMq+Vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yfmYStY2mPjsndDIGSeq4S9oIR87eO+shmkQJPXY76e9Wk0o2
	oySNknlVaQELLN6zrKBg2zTywdNa9FeOvAwAkhfibxycjoCReJ+2NGsP
X-Gm-Gg: AYBFou1ac9z/tWYbHaSfr+jJxBHw6oWkMI0zxZGbbngqeEzTgqtp1HwcHsz/bxBADXq
	5HEcAjRNeBqdGPlwMpQcTyAjVnIDf5XyP30W3DlpL68n4OOambN9NENJdk4IbbwYc9QceIa7z8x
	icyA/KljOJp6ZNvLE9ivqQLIXj+QUWWVYrBVkQjtEDu4OMDIglYQAoTOtLfZy1ksfyyCYg5ER+4
	V3E3OQzinQq0M8xItNNmds44CEtJFV1zONzWAkiegQIniUI5Hw73y5AStIwpQLRmkGU3r40sJp0
	JrBASBndFoa+XoJTs2VWa1Lwipw2nz5lBKa0s/lDxSIvn0WnP+jn+dg0+7O4qvCj/qxOiNyePsG
	BZKf2s2w2lbzwfFN2YeekKT4ZMIjD58jgx+QKBO4nTsLGJC5gW9CAtSAozRIPwp6kbLSCiLiUgd
	8/EhWcCDwti0yMMe2YH5DY6ABSrHH/o3YVhV6nkJzr94LFeLB9tiOIesuIEtauENW6OfExZH6X3
	2e2fHqvg5duX7f0mUpmkLyCcm/CI5Vd7rbWzcZsjvyqf/UCddB/629WS2316QwAcBIeC6cQvOgj
	ULEJtCg58v6uEQEUOhS1YMMCcKf1hjNTtQusmZ1xp0fy3s5GWd/MlyrSUjZH
X-Received: by 2002:a05:6402:210e:b0:6b6:8ed8:765a with SMTP id 4fb4d7f45d1cf-6b7c0d06184mr7571102a12.38.1794824131325;
        Mon, 16 Nov 2026 02:15:31 -0800 (PST)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c24e7714sm4235699a12.28.2026.11.16.02.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:15:30 -0800 (PST)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Julian Anastasov <ja@ssi.bg>,
	Simon Horman <horms@verge.net.au>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	lvs-devel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH nf v3] ipvs: ftp: do not link expectations to unconfirmed conntracks
Date: Mon, 16 Nov 2026 13:15:06 +0300
Message-Id: <20261116101506.98853-1-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
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

ip_vs_ftp_out() can link an expectation to an unconfirmed conntrack. A
later extension add on the same packet, such as seqadj in
ip_vs_update_conntrack() or NAT, then reallocates ct->ext and leaves the
expectation pointing into the freed area:

  BUG: KASAN: slab-use-after-free in nf_ct_unlink_expect_report+0x490/0x4c0
  Write of size 8 at addr ffff888004dd4e48 by task syz.2.17/649

Link the expectation only to a confirmed conntrack.

Fixes: b25adce16064 ("ipvs: correct usage/allocation of seqadj ext in ipvs")
Suggested-by: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
v3: skip unconfirmed conntracks, as suggested by Pablo; v2 did not
cover NAT.
v2: https://lore.kernel.org/netdev/20261113011447.2357709-8-pablo@netfilter.org/

 net/netfilter/ipvs/ip_vs_ftp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/ipvs/ip_vs_ftp.c b/net/netfilter/ipvs/ip_vs_ftp.c
index 44de99f4d187..cb0cdc35a7c1 100644
--- a/net/netfilter/ipvs/ip_vs_ftp.c
+++ b/net/netfilter/ipvs/ip_vs_ftp.c
@@ -398,8 +398,10 @@ static int ip_vs_ftp_out(struct ip_vs_app *app, struct ip_vs_conn *cp,
 						   end - start,
 						   buf, buf_len);
 		if (mangled) {
-			ip_vs_nfct_expect_related(skb, ct, n_cp,
-						  ipvsh->protocol, 0, 0);
+			if (nf_ct_is_confirmed(ct))
+				ip_vs_nfct_expect_related(skb, ct, n_cp,
+							  ipvsh->protocol,
+							  0, 0);
 			if (skb->ip_summed == CHECKSUM_COMPLETE)
 				skb->ip_summed = CHECKSUM_UNNECESSARY;
 			/* csum is updated */
-- 
2.34.1

