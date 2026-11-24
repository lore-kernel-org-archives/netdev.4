Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560751;
	b=AmHES3MRbTNpkBJU7rOk61BSIP8q1RP7cGNnmqIAlPqqzHC6nqgpDcRk44h7Lww76ndU
	 rnv3e1xUZFQDIFUrbSBqtxm3OzkzWsnd1NXOF8JWsSv2QFnzopwZSNhT/Vc1orMcdIIGk
	 xjcvq9Xtjn8L6AMzROwdktdsyDaEa3safDp66E2h0fwT6oV7ssznz2uykBUo/ITLQmFWY
	 2R5Lb/C2zqv5aajMwfRBjem3kH1Xw3Qh31qb6REgQCPIj4BlCktT9kRAv4zbmstGvinRi
	 6egstc+Wuo8NUgny5Ik/jiGXFzIZwF78P14+KKC7kuXNVgHUucOkDIHuSEpkEkxGEmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2igVG5RklVUD8y322B3VKO8NTww9xtgX73vhc/aUyRM=;
	b=XmkzdQZb2jFzBIYRjQv6xYVHHBfLtgYIOM4qhIkTbRnvkmWBVTuh2QF0pu05flcgUgPd
	 vPF1msJ2UgNiROeXSjxZzRpRpaKYq06zz0cDXUxEWOmrq4SAOSzpwaXqpA6BaOXefUUTg
	 r5l9HX3TdIdfGhw1g2NEjq97XtmrucNRS+5VyL8Mvj+OfC9fIUBLkHemp31ekSF9ugPa+
	 qs20Rpb5n7IfHbrR/o8qKEEr8nGjV2SneXrROlru3Q/TOyYjbpjoE6Avsaca4csnWWffg
	 NQsmunfzS62nP81jwGovr0ql97+3UaG/e72BUClGxQp6jPcnTUQBKnYj4BvxW+r/gug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9+SWYpR;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9076D606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9076D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9+SWYpR
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so7510268c88.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560750; x=1796165550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2igVG5RklVUD8y322B3VKO8NTww9xtgX73vhc/aUyRM=;
        b=E9+SWYpRPDEsfq+0U/uJAo2engtzlYuz3sY9Je4smTBPQZ17qdzRGQHN1hA4CvLPCQ
         Hlk95vLZF2tmrI9HkNPQffMC6AE3L9UwQJ3PLbuXfLH5IkOREsJUG303F031930SyFtt
         keFRZGnUdlezx3g7J9ONM0DoMzwyukZ8Nm5xFtOqr3uMCys8n6urLRcBUYNmIGW5+9Mj
         QZ9LcotNACDvnw/5kGWx0J3c8yGYHbbUtjNnpf4pAYr76W7aF21Lxd8gIWRM8ZIJsAKG
         biyTBq5B3M50Q0GYV142Xdk1dMnzUjhCXVWM6nPcCXeUTZzfTuFJxvUa6gF2QqMMt2Dx
         aYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560750; x=1796165550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2igVG5RklVUD8y322B3VKO8NTww9xtgX73vhc/aUyRM=;
        b=T7X7hzsfVPXZZqQ0MdHZO+cPYM7MTr/HTPfj3nBKNYLvGk0dTER+snPoxVlwij3F1Z
         YZxbSTWBU0+JzX1Obv3Z6sMBqefyiqdZ5s5eYyZ3hDM9lBXdJQbkFgcQr2IeGpY/bgZc
         Sb1SyMwUAPxuu0ZRjJ/36EkJUOx6+LtGxQ/IuEyiF+MhkQIU9SubCQ5IK7jh9BEhYDfB
         NuLVqp9pyp8W4NbKfs2dQ+3zqDxj4LSC2ojBP8ObosUOA06TbYh+V+UEvHc9zVo0Ni88
         DC/2Kb9DMgSEbvF4JoRLyIphb1wsAvtXvglvPCEZ0k9v3F6rPMgexuhnbx/+95mALLPT
         RQ7g==
X-Gm-Message-State: APuU4Z8cSEQp+rzOFhl/JSL6juG+dEwefyBoSOuahAH5+yNT+gOgvMrU
	Jtjf/zXbfGnSgZMugLC8s4Lyh0JAU71F6Lb5ge81jAPfrBp1nPh7d1eZgpk9dg==
X-Gm-Gg: AZFdTZdX/C5sCTdRPqBxrblXYKi3/fL4Lxo9S7RG7C/DSou5jMHrpUxMpJ+7PKhcuJb
	Hn/+xWCSfEHhH3H74/GwGF0oLwALEniwsmCI6Fummmo9z5wl/MSHMmkjxMPjmS4IzRkvokSUe71
	q6LFtRhyXVdrsBDAhftLDqcjWnxY3+jX3R3bIFjbDHcMCINpB7Wj5lvpVuaXROqIuvReiBvObWW
	tsaPbhO4XfHf/Py2nAK209KfTzrYuxEM6GE9s5X6qUe5EXOjKzvndEa4ytzm6N57d4bPO7Slq40
	veEwxULg96cbYPNh4H2Jjw9K5g1M1aWXdacO6ccoJn5xs35lIP6d7HCCjOQGcSUEtoBpR1bNuMt
	CNmSFjJXUsUJKfcC1i8oN4dbZd5wetOhw6kPz4NMMldTSczn36s3URzMo7PfHQopacEKi2Jb2YE
	fSJo4WZF/nZnIuqsUpuG7cjmg9BbSkB/8x5vfKuwTBy5Zb7FNw61RNpwzKDah1K1Eyp0Hytx59I
	AZoOd0Ld9s/FlIU0uPZJePhnousNyQHtd9brfeQDgAkiJSu4ZcqUzp4YYD6oEgkgJrEmV2wsRr1
	KnTb+wdIN48T8PKQeSKln0yB6/w3C8bvGkmCQCdY7WP2YSVHFYXC1t6JLfN98l0PXpphvUqoz7W
	nxdmIQhjgDs7UFspJF5PmTX54OU3A/hAT3RVQeAgqUVeL/c5kY5/Uhn6Wua/0ISB4Eg==
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr17412085c88.10.1795560749548;
        Tue, 24 Nov 2026 14:52:29 -0800 (PST)
Received: from l ([2603:8002:ea00:6800:e2af:cae4:df96:350])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm42648144c88.13.2026.11.24.14.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:29 -0800 (PST)
From: Dave Seddon <dave.seddon.ca@gmail.com>
To: netdev@vger.kernel.org
Cc: Dave Seddon <dave.seddon.ca@gmail.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>,
	Paolo Lungaroni <paolo.lungaroni@uniroma2.it>,
	Frank Dressler <frank@dressler.pro>
Subject: [PATCH iproute2] seg6local: accept lblen and nflen in either order
Date: Tue, 24 Nov 2026 14:52:27 -0800
Message-ID: <20261124225227.3795875-1-dave.seddon.ca@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The man page lists lblen and nflen as flavors attributes in no fixed
order, but ip only accepts lblen first:

  ip -6 route add 2001:db8:2::/64 dev lo encap seg6local action End \
    flavors next-csid nflen 16 lblen 32
  Error: either "to" is duplicate, or "lblen" is garbage.

Parse them in a loop.

Fixes: 04a6b456bf74 ("seg6: add support for flavors in SRv6 End* behaviors")
Suggested-by: Frank Dressler <frank@dressler.pro>
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
---
This applies on top of "seg6local: fix crash when next-csid ends the
command", as discussed in that thread.

 ip/iproute_lwtunnel.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/ip/iproute_lwtunnel.c b/ip/iproute_lwtunnel.c
index 53004b5f..3a6bf7c0 100644
--- a/ip/iproute_lwtunnel.c
+++ b/ip/iproute_lwtunnel.c
@@ -1433,27 +1433,30 @@ static int seg6local_parse_flavors(struct rtattr *rta, size_t len,
 		return ret;
 
 	if (flavors & (1 << SEG6_LOCAL_FLV_OP_NEXT_CSID)) {
-		NEXT_ARG_FWD();
-		if (argc > 0 && strcmp(*argv, "lblen") == 0) {
-			NEXT_ARG();
-			if (lbl_ok++)
-				duparg2("lblen", *argv);
-			if (get_u8(&lbl, *argv, 0))
-				invarg("\"locator-block length\" value is invalid\n", *argv);
-			ret = rta_addattr8(rta, len, SEG6_LOCAL_FLV_LCBLOCK_BITS, lbl);
-			NEXT_ARG_FWD();
-		}
-
-		if (argc > 0 && strcmp(*argv, "nflen") == 0) {
-			NEXT_ARG();
-			if (nfl_ok++)
-				duparg2("nflen", *argv);
-			if (get_u8(&nfl, *argv, 0))
-				invarg("\"locator-node function length\" value is invalid\n", *argv);
-			ret = rta_addattr8(rta, len, SEG6_LOCAL_FLV_LCNODE_FN_BITS, nfl);
+		while (NEXT_ARG_OK()) {
 			NEXT_ARG_FWD();
+			if (strcmp(*argv, "lblen") == 0) {
+				NEXT_ARG();
+				if (lbl_ok++)
+					duparg2("lblen", *argv);
+				if (get_u8(&lbl, *argv, 0))
+					invarg("\"locator-block length\" value is invalid\n",
+					       *argv);
+				ret = rta_addattr8(rta, len, SEG6_LOCAL_FLV_LCBLOCK_BITS, lbl);
+			} else if (strcmp(*argv, "nflen") == 0) {
+				NEXT_ARG();
+				if (nfl_ok++)
+					duparg2("nflen", *argv);
+				if (get_u8(&nfl, *argv, 0))
+					invarg("\"locator-node function length\" value is invalid\n",
+					       *argv);
+				ret = rta_addattr8(rta, len,
+						   SEG6_LOCAL_FLV_LCNODE_FN_BITS, nfl);
+			} else {
+				PREV_ARG();
+				break;
+			}
 		}
-		PREV_ARG();
 	}
 
 	rta_nest_end(rta, nest);
-- 
2.56.0

