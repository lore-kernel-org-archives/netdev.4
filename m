Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621754;
	b=V1Kgz3Zi8TSdJu/lj3szzyVIl7QPB83YUqX72X0BEUuIsRAJ/7Y3O51UKerbup/9otkE
	 2iWqoA60Lwa9xdDzCue7m5hSBgFXfAPq+kR05HaImerO/BOg0FuPMJIylW6l61ef2bSvG
	 TImG2Ra5F0MoSIjnUGZehL8raopL2HcahAagRkNgH0wf4Ikp8bR+pNtySQDbqSA1IsmNT
	 6tBugfRRgNsaby0z6T9YEI5Hc6wy793hyIPNw+QHw1Gqtr6WNhqKfHL4Amnl+btEtyZwF
	 O7FsIAJ1d262yclMVN75r4X/VPYlhE8VGCy2RMaq6+0XT3gL1Zv1hc3ngmRN50Tm+MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2G4AYUd7cpfGVwTNSVOea5oYMTV/zVtjSs8MJKt1xHU=;
	b=IRMudMSh6ff2Gsc82INDOU58zI0O8AU1lOYB8jLKE+c5Xr0RAi9+lInFQoBtqREgIfs3
	 hqvikARnMnirrsRUdj1aLV46WjRATJ1HxaO9GVB6/pBu4fV1OYRnWWhv35E1oA8VsbSBx
	 QJ5LJwVmeonA6gdeyNO9VGxdOeGESXr6pA5nAYa+5FWZL4SzqbcHm1YkVSeafRZ1396XJ
	 NtAJm6fRD7nu+MabKne5/Xbe5u352f7pTkx79cIoo9ZbMxIyaz8sFUBPPnOb4nGD7h5MM
	 I3sDe3PM/K6n+FsqIkw6PhewQNPF1sGDxTR1m4hDZwETuo2ytEfwJ9B7cDhyyTaNFCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEVGqzFH;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD7C606A335
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD7C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEVGqzFH
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-92100b756b0so47205976d6.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621753; x=1796226553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2G4AYUd7cpfGVwTNSVOea5oYMTV/zVtjSs8MJKt1xHU=;
        b=WEVGqzFHkBju6xfGP+do6tGFYjuoS3H8QWOPUrFsmgLoO41obRCPP5pwjo6QuTmYzq
         XO8tfnRaiAjVZ2v4w3JDhrTN57MLSrZB5+mCWTddB0ABtefRUzaMFcfk72hmf5Ad6zUM
         9tBXSpDkowwupZ5L3LgeuO0F8u2C+F/GQ75Ji6uLpaviwvwLcrUOtoTjFeKSJftfzaKK
         ppsqWZglf9+MvOBQwBUn4m3/Ale78VLFjVYBlA0Hyp/nmitpt4QuqLgiwwpmPv3jAaBz
         LInan7TQCqrPJ4VHW77pa6WEjxgESqdAoGqgFTB0LD/qfGwRQ8Kprve29oS6YxrQyizx
         C6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621753; x=1796226553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2G4AYUd7cpfGVwTNSVOea5oYMTV/zVtjSs8MJKt1xHU=;
        b=dJque5LEbQyTu0zMYLKGhAS1Urre/ttbVIQ771lyFti8rI9DmPW6qGZZA2kp9tOe9e
         2RwrdrkeB126OxDu3rFLlamxnP7mZ9/sg5pDF3deqf2ADsva01FXRyfPpFk2WzV1VfLr
         zvY4UyLVxraY2b8b4I23czt9I2yBSVXPALZEz7+vjAA4XtVARMrzc6c8yQSjevImdkJW
         e7FCzF3sloTD9JrPMIjRGm9KQDE7RaE78PzxgHcDw7qx87/7nkPcNnC5WKjIAe2ox8qH
         2thSBwFC9xRIICJirIieYcJRA/uFqwmU7tT/HmqY6ZCOrjOSVbWJAPE75Yjhu9d69q/N
         tsFw==
X-Gm-Message-State: APuU4Z+g8EQiHo21Y/+vMG23VLQTXdoxdkaniXLxYI+hre9/J7udTL3k
	zcnvuVmJ3UR1HyoN3xQ+0DB3hD/zIK896KO7UdlX5c1lmvT0WpwkRuHmKeESLv7E
X-Gm-Gg: AZFdTZf2HZ9M6R+ihDLA+iQp7qgPvnEqAqfrx5YpTgL8a+kklT838cMGWd4ggOKoVDc
	FTH9h9zCnVbFyHaG+9rYEX5ecuRNDL03KTTopV42/qh/iilBpWZkIHTTNsFb1Vte8JRG27Zw7SI
	tDuU+tCHMfSIOPusGj41ENcx6DAQH1kmgoRA87jdSf0oEyLNz7hrK7gs0cu/lp8gQZ/s5A7RHXA
	7YU4VepfJwNyrc+HkhSa7s+eSzpZrFjiL36OX1Ht1CuNwK43b6tEFMFeaaMA3aPmKgVGSQN2uO7
	rITNASrz0tOO/vGFgo+sKSIWby/vEPvVURncqBCZSYybBy1yoHYxtpfZKN35FfzJJq/FtJJu749
	CzbC69FBaUvbydPEbL1omk7x+AGd7bJmX4MOeAnQJgvQcwu6FdaimeE8QZDPVZmlhpSNUKekWfs
	Ajkl0iSNMoRe00YJznr4cVuZl+kAscDPe4QbZIHnZ53TeYXhB5HALk1vzar8tjsyOzKjMzXUEO1
	sNME29xEJLG3GppDUgcQMtPpyboOJi5R8i4BUu/qhS/Kz4RLU3SxDyM8OK5EnnnrletTKxZBgmL
	q+NCoDMzcC5lW5yB7uQDw0nnKtnaOX4Fe5HWGC10J4oQKUu7vowzYtShB7cfO/Sium7EyP2zflU
	YJcq8h8oU60CWYvvf8qfmBGIoV2P+V1qvBmvCXpjp194uO5sP8kTb2V5X
X-Received: by 2002:a05:6214:6346:10b0:921:317c:89b5 with SMTP id 6a1803df08f44-92134b11263mr242953356d6.44.1795621752867;
        Wed, 25 Nov 2026 07:49:12 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0f5d7sm166716946d6.37.2026.11.25.07.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:49:12 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	linux-sctp@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: [PATCH net v2] sctp: diag: fix stack garbage in IPv6 scope_id during dump_one lookup
Date: Wed, 25 Nov 2026 10:49:11 -0500
Message-ID: <7cc69548f249ff63527a663c22d9dc918d3c3e84.1795621751.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
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

As gomaja noticed, sctp_diag_dump_one() builds IPv6 lookup addresses on
the stack but never initializes sin6_scope_id or sin6_flowinfo. For
link-local addresses, __sctp_v6_cmp_addr() compares scope_ids when both
are non-zero, so stack garbage in these fields can cause sporadic lookup
failures.

Zero-initialize both laddr and paddr to ensure sin6_scope_id is 0, which
acts as a wildcard in __sctp_v6_cmp_addr(), matching any scope, just as
TCP and UDP handle idiag_if purely as a device filter (dif) parameter
without conflating it with IPv6 scope_id.

The dif check in sctp_addrs_lookup_transport() already filters by
sk_bound_dev_if, so scope_id on the lookup addresses is unnecessary.

Fixes: 8f840e47f190 ("sctp: add the sctp_diag.c file")
Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
v2:
  - Add a Fixes tag and target net.git.
  - Fix the issue by zero-initializing laddr/paddr instead of explicitly
    setting sin6_scope_id to 0 (reported by Clashiko).
---
 net/sctp/diag.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sctp/diag.c b/net/sctp/diag.c
index c2a0de2adf6f..564a5b51e6ce 100644
--- a/net/sctp/diag.c
+++ b/net/sctp/diag.c
@@ -433,7 +433,7 @@ static int sctp_diag_dump_one(struct netlink_callback *cb,
 	struct sk_buff *skb = cb->skb;
 	struct net *net = sock_net(skb->sk);
 	const struct nlmsghdr *nlh = cb->nlh;
-	union sctp_addr laddr, paddr;
+	union sctp_addr laddr = {}, paddr = {};
 	int dif = req->id.idiag_if;
 	struct sctp_comm_param commp = {
 		.skb = skb,
-- 
2.47.1

